import { useEffect, useState } from "react";
import { supabase } from "./supabase";
import { addDays, todayStr } from "./dates";
import { Stats, GOAL, newStats, normalize, settle, rolloverToday, countDay } from "./streak";

let cache: Stats | null = null;
let uid: string | null = null;
let chain: Promise<void> = Promise.resolve();
const listeners = new Set<() => void>();

function emit() {
  listeners.forEach((l) => l());
}

function persist() {
  if (!cache || !uid) return;
  const s = cache;
  const id = uid;
  chain = chain.then(async () => {
    const { error } = await supabase.from("user_stats").upsert(
      {
        user_id: id,
        lives: s.lives,
        streak: s.streak,
        run: s.run,
        total_days: s.total_days,
        last_active_date: s.last_active_date,
        settled_through: s.settled_through,
        cards_today: s.cards_today,
        cards_today_date: s.cards_today_date,
        updated_at: new Date().toISOString(),
      },
      { onConflict: "user_id" }
    );
    if (error) console.error("stats save failed:", error.message);
  });
}

/** Load (or create) the stats row, settle missed days, and publish to the UI. */
export async function initStats(): Promise<void> {
  await chain;
  const { data } = await supabase.auth.getSession();
  const user = data.session?.user;
  if (!user) {
    cache = null;
    uid = null;
    emit();
    return;
  }
  uid = user.id;
  const today = todayStr();
  const { data: row } = await supabase.from("user_stats").select("*").eq("user_id", uid).maybeSingle();
  let s: Stats = row ? normalize(row) : newStats(addDays(today, -1));
  s = rolloverToday(settle(s, addDays(today, -1)), today);
  cache = s;
  emit();
  persist();
}

/** Call whenever the user answers `n` cards. */
export function recordCards(n = 1) {
  if (!cache || !uid) return;
  const today = todayStr();
  let s = rolloverToday(settle(cache, addDays(today, -1)), today);
  s = { ...s, cards_today: s.cards_today + n };
  if (s.cards_today >= GOAL) s = countDay(s, today);
  cache = s;
  emit();
  persist();
}

export function useStats(): Stats | null {
  const [s, setS] = useState<Stats | null>(cache);
  useEffect(() => {
    const f = () => setS(cache ? { ...cache } : null);
    listeners.add(f);
    f();
    return () => {
      listeners.delete(f);
    };
  }, []);
  return s;
}
