import { supabase, shuffle, Card } from "./supabase";

export const SESSION_SIZE = 70;

export type Session = {
  cards: Card[];
  /** cards of this deck already seen earlier in the current round */
  seenBefore: number;
  /** how many never-seen-this-round cards are in this session */
  fresh: number;
  total: number;
  tracked: boolean;
};

/**
 * Picks up to 70 random cards that you have not seen yet in the current round
 * through the deck. When every card has been seen, a new round starts.
 * Not logged in: just a random 70 (nothing is saved).
 */
export async function buildSession(deckId: string, all: Card[]): Promise<Session> {
  const { data: auth } = await supabase.auth.getSession();
  if (!auth.session) {
    const cards = shuffle(all).slice(0, SESSION_SIZE);
    return { cards, seenBefore: 0, fresh: cards.length, total: all.length, tracked: false };
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
  return { cards: pick, seenBefore, fresh, total: all.length, tracked: true };
}

export function markSeen(deckId: string, cardId: string) {
  supabase.rpc("mark_seen", { p_deck: deckId, p_ids: [cardId] }).then((r) => {
    if (r.error) console.error("progress save failed:", r.error.message);
  });
}
