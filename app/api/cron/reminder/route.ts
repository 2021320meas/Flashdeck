import { NextResponse } from "next/server";
import { createClient } from "@supabase/supabase-js";
import { addDays, localHour, todayStr } from "@/lib/dates";
import { GOAL, normalize, settle } from "@/lib/streak";

export const dynamic = "force-dynamic";

/**
 * Called by Vercel Cron twice a day (14:00 and 15:00 UTC). Whichever run lands
 * inside 16:00–17:59 Berlin time sends the reminder – this keeps working when
 * the clocks change. At most one email per day, and none if you already
 * finished today's goal.
 */
export async function GET(req: Request) {
  const secret = process.env.CRON_SECRET;
  if (!secret || req.headers.get("authorization") !== `Bearer ${secret}`) {
    return NextResponse.json({ error: "unauthorized" }, { status: 401 });
  }
  const force = new URL(req.url).searchParams.get("force") === "1"; // for testing
  const hour = localHour();
  if (!force && (hour < 16 || hour > 17)) return NextResponse.json({ skipped: `local hour is ${hour}` });

  const supaUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
  const serviceKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
  const resendKey = process.env.RESEND_API_KEY;
  const to = process.env.NOTIFY_EMAIL || "meassothyro3@gmail.com";
  if (!supaUrl || !serviceKey || !resendKey) {
    return NextResponse.json({ error: "missing env vars" }, { status: 500 });
  }

  const admin = createClient(supaUrl, serviceKey, { auth: { persistSession: false } });
  const today = todayStr();
  const { data: rows, error } = await admin.from("user_stats").select("*");
  if (error) return NextResponse.json({ error: error.message }, { status: 500 });

  const site =
    process.env.SITE_URL ||
    (process.env.VERCEL_PROJECT_PRODUCTION_URL ? `https://${process.env.VERCEL_PROJECT_PRODUCTION_URL}` : "");
  const results: string[] = [];

  for (const row of rows ?? []) {
    // finalise yesterday and earlier so lives/streak are current
    const s = settle(normalize(row), addDays(today, -1));
    await admin
      .from("user_stats")
      .update({ lives: s.lives, streak: s.streak, run: s.run, settled_through: s.settled_through })
      .eq("user_id", row.user_id);

    const doneToday = s.last_active_date === today;
    if (!force && (doneToday || row.last_email_date === today)) {
      results.push(doneToday ? "already studied" : "already emailed");
      continue;
    }

    const doneCards = s.cards_today_date === today ? s.cards_today : 0;
    const left = Math.max(1, GOAL - doneCards);
    const risk =
      s.lives > 0
        ? `If you skip today you lose a life (${s.lives} → ${s.lives - 1}).`
        : `You have no lives left – skipping today resets your ${s.streak}-day streak.`;

    const html = `
      <div style="font-family:system-ui,sans-serif;max-width:480px">
        <h2>🐱 Time for your German cards!</h2>
        <p>You haven't finished today's goal yet – just <b>${left} more card${left === 1 ? "" : "s"}</b>.</p>
        <p>🔥 Streak: <b>${s.streak}</b> &nbsp; ❤️ Lives: <b>${s.lives}</b> &nbsp; 📅 Days used: <b>${s.total_days}</b></p>
        <p>${risk}</p>
        ${site ? `<p><a href="${site}" style="background:#4255ff;color:#fff;padding:10px 16px;border-radius:8px;text-decoration:none">Open FlashDeck</a></p>` : ""}
      </div>`;

    const res = await fetch("https://api.resend.com/emails", {
      method: "POST",
      headers: { Authorization: `Bearer ${resendKey}`, "Content-Type": "application/json" },
      body: JSON.stringify({
        from: process.env.EMAIL_FROM || "FlashDeck <onboarding@resend.dev>",
        to: [to],
        subject: `🐱 ${left} cards left to keep your ${s.streak}-day streak`,
        html,
      }),
    });

    if (res.ok) {
      await admin.from("user_stats").update({ last_email_date: today }).eq("user_id", row.user_id);
      results.push("email sent");
    } else {
      results.push(`email failed: ${res.status} ${await res.text()}`);
    }
  }
  return NextResponse.json({ ok: true, results });
}
