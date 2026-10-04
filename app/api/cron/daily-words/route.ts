import { NextResponse } from "next/server";
import { createClient } from "@supabase/supabase-js";
import { todayStr } from "@/lib/dates";
import { buildPrompt, parseWords, NewCard } from "@/lib/dailywords";

export const dynamic = "force-dynamic";
export const maxDuration = 60;

const DECK_NAME = process.env.DAILY_DECK_NAME || "German Daily Words";
const PER_DAY = Number(process.env.DAILY_WORDS_COUNT || 20);
const LEVEL = process.env.DAILY_LEVEL || "B2";
const MODEL = process.env.GEMINI_MODEL || "gemini-3.5-flash";

const SCHEMA = {
  type: "ARRAY",
  items: {
    type: "OBJECT",
    properties: {
      word: { type: "STRING" },
      examples: { type: "ARRAY", items: { type: "STRING" } },
      english: { type: "STRING" },
    },
    required: ["word", "examples", "english"],
  },
};

async function askGemini(prompt: string, key: string): Promise<string> {
  for (let attempt = 0; attempt < 3; attempt++) {
    const res = await fetch(`https://generativelanguage.googleapis.com/v1beta/models/${MODEL}:generateContent`, {
      method: "POST",
      headers: { "Content-Type": "application/json", "x-goog-api-key": key },
      body: JSON.stringify({
        contents: [{ parts: [{ text: prompt }] }],
        generationConfig: { responseMimeType: "application/json", responseSchema: SCHEMA, temperature: 1 },
      }),
    });
    if (res.ok) {
      const j = await res.json();
      return j?.candidates?.[0]?.content?.parts?.map((p: any) => p.text ?? "").join("") ?? "";
    }
    if (res.status === 429 || res.status >= 500) {
      await new Promise((r) => setTimeout(r, 4000 * (attempt + 1)));
      continue;
    }
    throw new Error(`Gemini ${res.status}: ${(await res.text()).slice(0, 300)}`);
  }
  throw new Error("Gemini is busy or the free quota is used up – try again later");
}

export async function GET(req: Request) {
  const secret = process.env.CRON_SECRET;
  if (!secret || req.headers.get("authorization") !== `Bearer ${secret}`) {
    return NextResponse.json({ error: "unauthorized" }, { status: 401 });
  }
  const force = new URL(req.url).searchParams.get("force") === "1";

  const supaUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
  const serviceKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
  const geminiKey = process.env.GEMINI_API_KEY;
  if (!supaUrl || !serviceKey || !geminiKey) return NextResponse.json({ error: "missing env vars" }, { status: 500 });

  const admin = createClient(supaUrl, serviceKey, { auth: { persistSession: false } });
  const today = todayStr();

  let { data: deck } = await admin.from("decks").select("id").eq("name", DECK_NAME).maybeSingle();
  if (!deck) {
    const created = await admin.from("decks").insert({ name: DECK_NAME }).select("id").single();
    if (created.error) return NextResponse.json({ error: created.error.message }, { status: 500 });
    deck = created.data;
  }
  const deckId = deck!.id as string;

  const { count: doneToday } = await admin
    .from("cards").select("id", { count: "exact", head: true }).eq("deck_id", deckId).eq("added_on", today);
  if (!force && (doneToday ?? 0) >= PER_DAY) return NextResponse.json({ skipped: "already added today", count: doneToday });

  const { data: old } = await admin.from("cards").select("word_key").eq("deck_id", deckId).not("word_key", "is", null).limit(5000);
  const existing = new Set<string>((old ?? []).map((r: any) => r.word_key));

  let need = PER_DAY - (force ? 0 : doneToday ?? 0);
  const added: NewCard[] = [];
  let lastError = "";

  for (let round = 0; round < 3 && need > 0; round++) {
    try {
      const avoid = Array.from(existing).slice(-300);
      const raw = await askGemini(buildPrompt(need + 3, LEVEL, avoid), geminiKey);
      const fresh = parseWords(raw, existing, need);
      if (fresh.length === 0) { lastError = "no usable words returned"; continue; }
      const { data: inserted, error } = await admin
        .from("cards")
        .upsert(fresh.map((c) => ({ ...c, deck_id: deckId, added_on: today })), { onConflict: "deck_id,word_key", ignoreDuplicates: true })
        .select("word_key");
      if (error) { lastError = error.message; break; }
      for (const r of inserted ?? []) existing.add((r as any).word_key);
      added.push(...fresh.filter((c) => (inserted ?? []).some((r: any) => r.word_key === c.word_key)));
      need -= (inserted ?? []).length;
    } catch (e: any) {
      lastError = e.message;
      break;
    }
  }

  return NextResponse.json({
    ok: added.length > 0,
    added: added.length,
    words: added.map((c) => c.word_key),
    ...(lastError ? { note: lastError } : {}),
  }, { status: added.length > 0 || !lastError ? 200 : 502 });
}