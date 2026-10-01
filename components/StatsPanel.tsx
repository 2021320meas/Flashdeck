"use client";
import { useStats } from "@/lib/stats";
import { GOAL, LIFE_EVERY, MAX_LIVES } from "@/lib/streak";

export function Hearts({ lives }: { lives: number }) {
  return <>{Array.from({ length: MAX_LIVES }, (_, k) => (k < lives ? "❤️" : "🤍")).join("")}</>;
}

/** Small badge for the top bar. */
export function StatsBadge() {
  const s = useStats();
  if (!s) return null;
  return (
    <span className="badge" title="Streak · lives">
      🔥 {s.streak} &nbsp;<Hearts lives={s.lives} />
    </span>
  );
}

/** Bigger card for the home page. */
export default function StatsPanel() {
  const s = useStats();
  if (!s) return null;
  const toNext = LIFE_EVERY - (s.run % LIFE_EVERY);
  const pct = Math.min(100, (s.cards_today / GOAL) * 100);
  return (
    <div className="panel stats">
      <div className="stat"><b>🔥 {s.streak}</b><span className="muted">day streak</span></div>
      <div className="stat"><b><Hearts lives={s.lives} /></b><span className="muted">lives</span></div>
      <div className="stat"><b>📅 {s.total_days}</b><span className="muted">days used</span></div>
      <div className="stat-wide">
        <div className="progress"><div style={{ width: `${pct}%` }} /></div>
        <span className="muted">
          {s.cards_today >= GOAL ? "Today's goal done ✅" : `Today: ${s.cards_today} / ${GOAL} cards`}
          {" · "}
          {s.lives >= MAX_LIVES ? "lives full" : `next life in ${toNext} day${toNext === 1 ? "" : "s"} of daily use`}
        </span>
      </div>
    </div>
  );
}
