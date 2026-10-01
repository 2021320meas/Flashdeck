"use client";
import { useEffect, useState } from "react";
import { shuffle, Card } from "@/lib/supabase";
import { recordCards } from "@/lib/stats";

const QUIZ_SIZE = 20;

type Q = { card: Card; options: string[]; answer: string; prompt: string };

function build(cards: Card[], reverse: boolean): Q[] {
  return shuffle(cards).slice(0, QUIZ_SIZE).map((card) => {
    const prompt = reverse ? card.back : card.front;
    const answer = reverse ? card.front : card.back;
    const pool = cards
      .filter((c) => c.id !== card.id)
      .map((c) => (reverse ? c.front : c.back))
      .filter((t) => t !== answer);
    const distractors = shuffle(Array.from(new Set(pool))).slice(0, 3);
    return { card, prompt, answer, options: shuffle([answer, ...distractors]) };
  });
}

export default function Quiz({ cards }: { cards: Card[] }) {
  const [reverse, setReverse] = useState(false);
  const [qs, setQs] = useState<Q[]>([]);
  const [i, setI] = useState(0);
  const [picked, setPicked] = useState<string | null>(null);
  const [score, setScore] = useState(0);

  useEffect(() => { restart(); }, [cards.length, reverse]); // eslint-disable-line

  function restart() {
    setQs(cards.length >= 2 ? build(cards, reverse) : []);
    setI(0); setPicked(null); setScore(0);
  }

  if (cards.length < 2) return <p className="muted">Add at least 2 cards to take a quiz.</p>;
  if (!qs.length) return null;

  if (i >= qs.length)
    return (
      <div className="panel">
        <h2 style={{ marginTop: 0 }}>Score: {score} / {qs.length}</h2>
        <button onClick={restart}>New quiz ({QUIZ_SIZE} random cards)</button>
      </div>
    );

  const q = qs[i];

  return (
    <>
      <div className="row" style={{ justifyContent: "space-between" }}>
        <span className="muted">Question {i + 1} / {qs.length} · Score {score}</span>
        <button className="ghost" onClick={() => setReverse((r) => !r)}>
          {reverse ? "Answer → term" : "Term → answer"}
        </button>
      </div>
      <div className="progress"><div style={{ width: `${(i / qs.length) * 100}%` }} /></div>
      <div className="panel pre" style={{ fontSize: 20 }}>{q.prompt}</div>
      {q.options.map((o) => {
        const cls = picked === null ? "" : o === q.answer ? "right" : o === picked ? "wrong" : "";
        return (
          <button key={o} className={`opt ${cls}`} disabled={picked !== null}
            onClick={() => { setPicked(o); recordCards(1); if (o === q.answer) setScore((s) => s + 1); }}>
            {o}
          </button>
        );
      })}
      {picked !== null && <button onClick={() => { setI(i + 1); setPicked(null); }}>Next →</button>}
    </>
  );
}
