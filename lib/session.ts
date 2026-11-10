import { supabase, shuffle, Card } from "./supabase";
import { loadReview, ReviewMap } from "./review";
import { todayStr } from "./dates";

export const SESSION_SIZE = 70;

export type Session = {
  cards: Card[];
  seenBefore: number;
  fresh: number;
  total: number;
  tracked: boolean;
  /** cards scheduled for review (card id -> due date) */
  review: ReviewMap;
  /** how many cards at the front of the session are due for review */
  dueCount: number;
};


/**
 * Picks up to 70 random cards that you have not seen yet in the current round
 * through the deck. When every card has been seen, a new round starts.
 * Not logged in: just a random 70 (nothing is saved).
 */
export async function buildSession(deckId: string, all: Card[]): Promise<Session> {
  const { data: auth } = await supabase.auth.getSession();
  const review = await loadReview();                                   // <-- c) new line
  if (!auth.session) {
    const w = withDue(shuffle(all).slice(0, SESSION_SIZE), all, review);   // <-- c) replaces
    return { cards: w.cards, seenBefore: 0, fresh: w.cards.length, total: all.length, tracked: false, review, dueCount: w.dueCount };  // <-- c) replaces
  }

  const { data } = await supabase.from("deck_progress").select("seen_ids").eq("deck_id", deckId).maybeSingle();
  const seen = new Set<string>(data?.seen_ids ?? []);
  let unseen = all.filter((c) => !seen.has(c.id));
  let seenBefore = all.length - unseen.length;

  if (unseen.length === 0) {
    await supabase.rpc("mark_seen", { p_deck: deckId, p_ids: [], p_reset: true });
    unseen = all;
    seenBefore = 0;
  }

  let pick = shuffle(unseen).slice(0, SESSION_SIZE);
  const fresh = pick.length;
  if (pick.length < SESSION_SIZE) {
    // last session of a round: top up with random already-seen cards
    const ids = new Set(pick.map((c) => c.id));
    const extra = shuffle(all.filter((c) => !ids.has(c.id))).slice(0, SESSION_SIZE - pick.length);
    pick = shuffle([...pick, ...extra]);
  }
  const w = withDue(pick, all, review);                                // <-- d) replaces the old return
  return { cards: w.cards, seenBefore, fresh, total: all.length, tracked: true, review, dueCount: w.dueCount };  // <-- d)
}

export function markSeen(deckId: string, cardId: string) {
  supabase.rpc("mark_seen", { p_deck: deckId, p_ids: [cardId] }).then((r) => {
    if (r.error) console.error("progress save failed:", r.error.message);
  });
}

/** Put cards whose review is due (today or overdue) first, then fill up with the rest. */
function withDue(pick: Card[], all: Card[], review: ReviewMap): { cards: Card[]; dueCount: number } {
  const today = todayStr();
  const due = shuffle(all.filter((c) => review[c.id] && review[c.id] <= today)).slice(0, SESSION_SIZE);
  const dueIds = new Set(due.map((c) => c.id));
  const rest = pick.filter((c) => !dueIds.has(c.id)).slice(0, SESSION_SIZE - due.length);
  return { cards: [...due, ...rest], dueCount: due.length };
}