import { addDays } from "./dates";

/**
 * 3-day repetition rules (pure functions, no I/O).
 *
 * - Swipe left on a card that is not on the review list  -> it is added, Day 1 is TOMORROW.
 * - Day 1 and Day 2: any answer (left or right) just moves the card on to the next day.
 * - Day 3: swipe right -> mastered, card leaves the list.
 *          swipe left  -> a new 3-day cycle starts (Day 1 tomorrow).
 * - Only the FIRST answer of a calendar day counts, so re-reviewing "missed" cards
 *   in the same session can never skip a day or change the outcome.
 */
export const CYCLE_DAYS = 3;

export type ReviewEntry = {
  card_id: string;
  deck_id: string;
  day: number;
  due_date: string;
  last_reviewed: string | null;
  cycles: number;
};

export type Outcome = "started" | "advanced" | "graduated" | "restarted" | "ignored";

export function isDue(e: ReviewEntry, today: string): boolean {
  return e.due_date <= today && e.last_reviewed !== today;
}

export function applyAnswer(
  entry: ReviewEntry | undefined,
  cardId: string,
  deckId: string,
  ok: boolean,
  today: string
): { outcome: Outcome; entry: ReviewEntry | null } {
  if (!entry) {
    if (ok) return { outcome: "ignored", entry: null };
    return {
      outcome: "started",
      entry: { card_id: cardId, deck_id: deckId, day: 1, due_date: addDays(today, 1), last_reviewed: today, cycles: 1 },
    };
  }

  if (!isDue(entry, today)) return { outcome: "ignored", entry };

  if (entry.day < CYCLE_DAYS) {
    return {
      outcome: "advanced",
      entry: { ...entry, day: entry.day + 1, due_date: addDays(today, 1), last_reviewed: today },
    };
  }

  if (ok) return { outcome: "graduated", entry: null };
  return {
    outcome: "restarted",
    entry: { ...entry, day: 1, due_date: addDays(today, 1), last_reviewed: today, cycles: entry.cycles + 1 },
  };
}