import { NextResponse } from "next/server";
import { createClient } from "@supabase/supabase-js";
import { todayStr } from "./dates";
import { parseWords, coreKey, NewCard } from "./dailywords";
import { askGemini } from "./gemini";

export type DailyJobConfig = {
  deckName: string;
  perDay: number;
  model: string;
  prompt: (count: number, avoid: string[]) => string;
};

export async function runDailyJob(req: Request, cfg: DailyJobConfig) {
  const secret = process.env.CRON_SECRET;
  if (!secret || req.headers.get("authorization") !== `Bearer ${secret}`) {
    return NextResponse.json({ error: "unauthorized" }, { status: 401 });
  }
  const force = new URL(req.url).searchParams.get("force") === "1";

  const supaUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
  const serviceKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
  const geminiKey = process.env.GEMINI_API_KEY;
  if (!supaUrl || !serviceKey || !geminiKey) return NextResponse.json({ error: "missing env vars" }, { status: 500 });

  const admin = createClient(supaUrl, serviceKey, {
    auth: { persistSession: false },
    global: { fetch: (url, init) => fetch(url, { ...init, cache: "no-store" }) },
  });
  const today = todayStr();

  const deckRes = await admin.from("decks").upsert({ name: cfg.deckName }, { onConflict: "name" }).select("id").single();
  if (deckRes.error) return NextResponse.json({ error: deckRes.error.message }, { status: 500 });
  const deckId = deckRes.data.id as string;

  const { count: doneToday } = await admin
    .from("cards").select("id", { count: "exact", head: true }).eq("deck_id", deckId).eq("added_on", today);
  if (!force && (doneToday ?? 0) >= cfg.perDay) {
    return NextResponse.json({ skipped: "already added today", count: doneToday });
  }

  // every headword already in ANY deck (your Anki cards included), compared by its "core" form
  const existing = new Set<string>();
  for (let from = 0; ; from += 1000) {
    const { data, error } = await admin.from("cards").select("front").order("id").range(from, from + 999);
    if (error) return NextResponse.json({ error: error.message }, { status: 500 });
    for (const r of data ?? []) existing.add(coreKey(r.front as string));
    if (!data || data.length < 1000) break;
  }
  // newest 500 words of THIS deck, shown to the AI so it doesn't suggest them again
  const { data: recent } = await admin
    .from("cards").select("front").eq("deck_id", deckId).order("created_at", { ascending: false }).limit(500);
  const avoid = (recent ?? []).map((r: any) => String(r.front).split("\n")[0]);

  let need = cfg.perDay - (force ? 0 : doneToday ?? 0);
  const added: NewCard[] = [];
  let lastError = "";

  for (let round = 0; round < 3 && need > 0; round++) {
    try {
      const raw = await askGemini(cfg.prompt(need + 4, avoid), geminiKey, cfg.model);
      const fresh = parseWords(raw, existing, need);
      if (fresh.length === 0) { lastError = "no usable words returned"; continue; }
      const { data: inserted, error } = await admin
        .from("cards")
        .upsert(fresh.map((c) => ({ ...c, deck_id: deckId, added_on: today })), { onConflict: "deck_id,word_key", ignoreDuplicates: true })
        .select("word_key");
      if (error) { lastError = error.message; break; }
      const ok = new Set((inserted ?? []).map((r: any) => r.word_key as string));
      const saved = fresh.filter((c) => ok.has(c.word_key));
      for (const c of saved) {
        existing.add(coreKey(c.word_key));
        avoid.unshift(c.word_key);
      }
      added.push(...saved);
      need -= ok.size;
    } catch (e: any) {
      lastError = e.message;
      break;
    }
  }

  return NextResponse.json({
    ok: added.length > 0,
    deck: cfg.deckName,
    added: added.length,
    words: added.map((c) => c.word_key),
    ...(lastError ? { note: lastError } : {}),
  }, { status: added.length > 0 || !lastError ? 200 : 502 });
}