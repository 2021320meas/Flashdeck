"use client";

import { useEffect, useState, useCallback } from "react";
import { shuffle, Card } from "@/lib/supabase";

export default function Flashcards({ cards }: { cards: Card[] }) {
  const [queue, setQueue] = useState<Card[]>(cards);
  const [i, setI] = useState(0);
  const [flipped, setFlipped] = useState(false);
  const [known, setKnown] = useState<string[]>([]);
  const [missed, setMissed] = useState<Card[]>([]);
  const [reverse, setReverse] = useState(false);

  // Tracks how many immediate repetitions are still required
  // for each card after it was marked "Still learning".
  const [repeatRemaining, setRepeatRemaining] = useState<Record<string, number>>({});

  // Tracks cards that have already received their immediate repetition cycle.
  const [reinforced, setReinforced] = useState<Set<string>>(new Set());

  useEffect(() => {
    reset(cards);
  }, [cards]); // eslint-disable-line

  function reset(list: Card[]) {
    setQueue(list);
    setI(0);
    setFlipped(false);
    setKnown([]);
    setMissed([]);
    setRepeatRemaining({});
    setReinforced(new Set());
  }

  const done = i >= queue.length;
  const card = queue[i];

  const mark = useCallback(
    (ok: boolean) => {
      if (!card) return;

      const cardId = card.id;
      const remaining = repeatRemaining[cardId] ?? 0;
      const hasBeenReinforced = reinforced.has(cardId);

      if (ok) {
        // Only count the card once as known.
        setKnown((k) => (k.includes(cardId) ? k : [...k, cardId]));
      } else {
        // Only count the card once as missed.
        setMissed((m) =>
          m.some((c) => c.id === cardId) ? m : [...m, card]
        );

        // If this is the first time the card was marked as difficult,
        // schedule 4–5 immediate repetitions.
        if (!hasBeenReinforced && remaining === 0) {
          const repetitions = Math.random() < 0.5 ? 4 : 5;

          setReinforced((r) => {
            const next = new Set(r);
            next.add(cardId);
            return next;
          });

          setRepeatRemaining((r) => ({
            ...r,
            [cardId]: repetitions,
          }));

          // Insert the repetitions directly after the current card.
          setQueue((q) => {
            const next = [...q];
            next.splice(i + 1, 0, ...Array(repetitions).fill(card));
            return next;
          });
        }
      }

      // If this card is part of its immediate repetition cycle,
      // decrease the number of repetitions remaining.
      if (remaining > 0) {
        const newRemaining = remaining - 1;

        setRepeatRemaining((r) => {
          const next = { ...r };

          if (newRemaining === 0) {
            delete next[cardId];
          } else {
            next[cardId] = newRemaining;
          }

          return next;
        });

        // When the final immediate repetition is completed,
        // there is a 30% chance of seeing this card again later.
        if (newRemaining === 0 && Math.random() < 0.3) {
          setQueue((q) => {
            const next = [...q];

            // Put the card a few cards later rather than immediately.
            const minOffset = 2;
            const maxOffset = Math.min(5, next.length - i - 1);
            const offset =
              maxOffset >= minOffset
                ? Math.floor(
                    Math.random() * (maxOffset - minOffset + 1)
                  ) + minOffset
                : 1;

            const insertAt = Math.min(i + offset, next.length);

            next.splice(insertAt, 0, card);

            return next;
          });
        }
      }

      setFlipped(false);
      setI((x) => x + 1);
    },
    [card, i, repeatRemaining, reinforced]
  );

  useEffect(() => {
    const h = (e: KeyboardEvent) => {
      if (
        (e.target as HTMLElement).tagName === "TEXTAREA" ||
        (e.target as HTMLElement).tagName === "INPUT"
      ) {
        return;
      }

      if (e.code === "Space") {
        e.preventDefault();
        setFlipped((f) => !f);
      }

      if (e.key === "ArrowRight") mark(true);
      if (e.key === "ArrowLeft") mark(false);
    };

    window.addEventListener("keydown", h);

    return () => window.removeEventListener("keydown", h);
  }, [mark]);

  if (!cards.length) {
    return <p className="muted">No cards yet.</p>;
  }

  if (done)
    return (
      <div className="panel">
        <h2 style={{ marginTop: 0 }}>Round finished 🎉</h2>

        <p>
          ✅ Knew: {known.length} &nbsp; ❌ Missed: {missed.length}
        </p>

        <div className="row">
          {missed.length > 0 && (
            <button onClick={() => reset(shuffle(missed))}>
              Review {missed.length} missed
            </button>
          )}

          <button
            className="ghost"
            onClick={() => reset(shuffle(cards))}
          >
            Restart (shuffled)
          </button>
        </div>
      </div>
    );

  const front = reverse ? card.back : card.front;
  const back = reverse ? card.front : card.back;

  return (
    <>
      <div
        className="row"
        style={{
          justifyContent: "space-between",
          marginBottom: 8,
        }}
      >
        <span className="muted">
          {i + 1} / {queue.length}
        </span>

        <div className="row">
          <button
            className="ghost"
            onClick={() => reset(shuffle(queue))}
          >
            Shuffle
          </button>

          <button
            className="ghost"
            onClick={() => {
              setReverse((r) => !r);
              setFlipped(false);
            }}
          >
            {reverse
              ? "Showing: answer first"
              : "Showing: term first"}
          </button>
        </div>
      </div>

      <div className="progress">
        <div
          style={{
            width: `${(i / queue.length) * 100}%`,
          }}
        />
      </div>

      <div className="scene">
        <div
          className={`flip ${flipped ? "flipped" : ""}`}
          onClick={() => setFlipped((f) => !f)}
        >
          <div className="face">{front}</div>
          <div className="face back">{back}</div>
        </div>
      </div>

      <div
        className="row"
        style={{ justifyContent: "center" }}
      >
        <button
          className="danger"
          onClick={() => mark(false)}
        >
          ✗ Still learning
        </button>

        <button
          className="ghost"
          onClick={() => setFlipped((f) => !f)}
        >
          Flip
        </button>

        <button
          style={{ background: "var(--ok)" }}
          onClick={() => mark(true)}
        >
          ✓ Know it
        </button>
      </div>

      <p
        className="muted"
        style={{ textAlign: "center" }}
      >
        Keys: Space = flip · ← still learning · → know it
      </p>
    </>
  );
}