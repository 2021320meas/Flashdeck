import { supabase } from "./supabase";
import { todayStr } from "./dates";
import { applyAnswer, isDue, Outcome, ReviewEntry } from "./reviewlogic";

const LS_KEY = "flashdeck.review.v1";

type Ctx = { uid: string | null; entries: Map<string, ReviewEntry> };
const decks = new Map<string, Ctx>();
let chain: Promise<void> = Promise.resolve();

function readLocal(): ReviewEntry[] {
  try {
    const raw = localStorage.getItem(LS_KEY);
    const arr = raw ? JSON.parse(raw) : [];
    return Array.isArray(arr) ? arr : [];
  } catch {
    return [];
  }
}

function writeLocal(all: ReviewEntry[]) {
  try {
    localStorage.setItem(LS_KEY, JSON.stringify(all));
  } catch (e) {
    console.error("review save failed:", e);
  }
}

/** Loads this deck's review list (call before building a session). */
export async function loadReview(deckId: string): Promise<{ error?: string }> {
  await chain;
  const { data: auth } = await supabase.auth.getSession();
  const uid = auth.session?.user.id ?? null;
  let rows: ReviewEntry[] = [];
  let error: string | undefined;

  if (uid) {
    const { data, error: err } = await supabase.from("review_schedule").select("*").eq("deck_id", deckId);
    if (err) {
      error = err.message;
      console.error("review load failed:", err.message);
    } else {
      rows = (data ?? []) as ReviewEntry[];
    }
  } else {
    rows = readLocal().filter((e) => e.deck_id === deckId);
  }

  decks.set(deckId, { uid, entries: new Map(rows.map((e) => [e.card_id, e])) });
  return { error };
}

export function dueToday(deckId: string): Map<string, ReviewEntry> {
  const today = todayStr();
  const out = new Map<string, ReviewEntry>();
  decks.get(deckId)?.entries.forEach((e, id) => {
    if (isDue(e, today)) out.set(id, e);
  });
  return out;
}

export function listSize(deckId: string): number {
  return decks.get(deckId)?.entries.size ?? 0;
}

export function recordReviewAnswer(deckId: string, cardId: string, ok: boolean): Outcome {
  const ctx = decks.get(deckId);
  if (!ctx) return "ignored";
  const before = ctx.entries.get(cardId);
  const { outcome, entry } = applyAnswer(before, cardId, deckId, ok, todayStr());
  if (outcome === "ignored") return outcome;

  if (entry) ctx.entries.set(cardId, entry);
  else ctx.entries.delete(cardId);

  if (ctx.uid) {
    const uid = ctx.uid;
    chain = chain.then(async () => {
      const res = entry
        ? await supabase.from("review_schedule").upsert({ user_id: uid, ...entry }, { onConflict: "user_id,card_id" })
        : await supabase.from("review_schedule").delete().eq("user_id", uid).eq("card_id", cardId);
      if (res.error) console.error("review save failed:", res.error.message);
    });
  } else {
    const rest = readLocal().filter((e) => !(e.deck_id === deckId && e.card_id === cardId));
    writeLocal(entry ? [...rest, entry] : rest);
  }
  return outcome;
}