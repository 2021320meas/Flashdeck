import { supabase } from "./supabase";
import { addDays, todayStr } from "./dates";

/** A hard card comes back after this many days. */
export const REVIEW_DAYS = 3;

/** card id -> due date (YYYY-MM-DD) */
export type ReviewMap = Record<string, string>;

const LS_KEY = "flashdeck_review";

function lsRead(): ReviewMap {
  try { return JSON.parse(localStorage.getItem(LS_KEY) || "{}"); } catch { return {}; }
}
function lsWrite(m: ReviewMap) {
  try { localStorage.setItem(LS_KEY, JSON.stringify(m)); } catch { /* ignore */ }
}

async function loggedIn() {
  const { data } = await supabase.auth.getSession();
  return !!data.session;
}

export async function loadReview(): Promise<ReviewMap> {
  if (!(await loggedIn())) return lsRead();
  const { data, error } = await supabase.from("card_review").select("card_id, due_date").range(0, 4999);
  if (error) { console.error("review load failed:", error.message); return {}; }
  const m: ReviewMap = {};
  for (const r of data ?? []) m[r.card_id as string] = r.due_date as string;
  return m;
}

/** Show this card again in REVIEW_DAYS days. Returns the new due date. */
export function scheduleReview(cardId: string): string {
  const due = addDays(todayStr(), REVIEW_DAYS);
  loggedIn().then((ok) => {
    if (!ok) { const m = lsRead(); m[cardId] = due; lsWrite(m); return; }
    supabase.rpc("schedule_review", { p_card: cardId, p_due: due }).then((r) => {
      if (r.error) console.error("review save failed:", r.error.message);
    });
  });
  return due;
}

export function clearReview(cardId: string) {
  loggedIn().then((ok) => {
    if (!ok) { const m = lsRead(); delete m[cardId]; lsWrite(m); return; }
    supabase.rpc("clear_review", { p_card: cardId }).then((r) => {
      if (r.error) console.error("review clear failed:", r.error.message);
    });
  });
}