import { addDays } from "./dates";

/** A day counts as "used" once you answer this many cards. */
export const GOAL = 10;
export const MAX_LIVES = 3;
/** Every this-many consecutive days of use earns one life (up to MAX_LIVES). */
export const LIFE_EVERY = 14;

export type Stats = {
  lives: number;
  streak: number; // current streak (days kept alive, lives protect it)
  run: number; // consecutive days actually used; resets on a missed day
  total_days: number; // all days ever used
  last_active_date: string | null;
  settled_through: string; // every day up to and including this one is final
  cards_today: number;
  cards_today_date: string | null;
};

export function newStats(settledThrough: string): Stats {
  return {
    lives: MAX_LIVES,
    streak: 0,
    run: 0,
    total_days: 0,
    last_active_date: null,
    settled_through: settledThrough,
    cards_today: 0,
    cards_today_date: null,
  };
}

export function normalize(row: Record<string, any>): Stats {
  return {
    lives: row.lives,
    streak: row.streak,
    run: row.run,
    total_days: row.total_days,
    last_active_date: row.last_active_date ?? null,
    settled_through: row.settled_through,
    cards_today: row.cards_today ?? 0,
    cards_today_date: row.cards_today_date ?? null,
  };
}

/** A fully missed day: lose a life (streak is protected). With no life left the streak resets. */
function applyMiss(s: Stats) {
  s.run = 0;
  if (s.lives > 0) s.lives -= 1;
  else s.streak = 0;
}

/** Finalise every day after `settled_through` up to and including `through` (days without activity are misses). */
export function settle(input: Stats, through: string): Stats {
  const s = { ...input };
  let guard = 0;
  while (s.settled_through < through && guard++ < 800) {
    const d = addDays(s.settled_through, 1);
    if (s.last_active_date !== d) applyMiss(s);
    s.settled_through = d;
  }
  return s;
}

export function rolloverToday(input: Stats, today: string): Stats {
  if (input.cards_today_date === today) return input;
  return { ...input, cards_today: 0, cards_today_date: today };
}

/** Mark `today` as used (idempotent). */
export function countDay(input: Stats, today: string): Stats {
  const s = settle(input, addDays(today, -1));
  if (s.last_active_date === today) return s;
  s.total_days += 1;
  s.streak += 1;
  s.run += 1;
  if (s.run % LIFE_EVERY === 0 && s.lives < MAX_LIVES) s.lives += 1;
  s.last_active_date = today;
  s.settled_through = today;
  return s;
}
