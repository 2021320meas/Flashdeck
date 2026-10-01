"use client";
import { useCallback, useEffect, useRef, useState } from "react";
import { Card, shuffle } from "@/lib/supabase";
import { buildSession, markSeen, SESSION_SIZE } from "@/lib/session";
import { recordCards, useStats } from "@/lib/stats";
import { GOAL } from "@/lib/streak";

const THRESH = 90; // px to drag before a swipe counts

export default function Flashcards({ cards, deckId, active }: { cards: Card[]; deckId: string; active: boolean }) {
  const [queue, setQueue] = useState<Card[]>([]);
  const [i, setI] = useState(0);
  const [flipped, setFlipped] = useState(false);
  const [known, setKnown] = useState(0);
  const [missed, setMissed] = useState<Card[]>([]);
  const [reverse, setReverse] = useState(false);
  const [info, setInfo] = useState({ seenBefore: 0, fresh: 0, total: 0, tracked: false });
  const [loading, setLoading] = useState(true);

  // swipe state
  const [dx, setDx] = useState(0);
  const [dragging, setDragging] = useState(false);
  const [snap, setSnap] = useState(false);
  const drag = useRef<{ x: number; y: number; moved: boolean } | null>(null);
  const busy = useRef(false);

  const stats = useStats();
  const cardsRef = useRef(cards);
  cardsRef.current = cards;
  const started = useRef(false);

  const startSession = useCallback(async () => {
    setLoading(true);
    const s = await buildSession(deckId, cardsRef.current);
    setQueue(s.cards);
    setInfo({ seenBefore: s.seenBefore, fresh: s.fresh, total: s.total, tracked: s.tracked });
    setI(0); setFlipped(false); setKnown(0); setMissed([]); setDx(0);
    setLoading(false);
  }, [deckId]);

  // build the first session once the deck's cards have arrived
  useEffect(() => {
    if (cards.length > 0 && !started.current) {
      started.current = true;
      startSession();
    }
  }, [cards.length, startSession]);

  const done = !loading && queue.length > 0 && i >= queue.length;
  const card = queue[i];

  const mark = useCallback((ok: boolean) => {
    if (!card) return;
    if (ok) setKnown((k) => k + 1); else setMissed((m) => [...m, card]);
    if (info.tracked) markSeen(deckId, card.id);
    recordCards(1);
    setFlipped(false);
    setI((x) => x + 1);
  }, [card, deckId, info.tracked]);

  /** Animate the card off-screen, then record the answer. */
  const commit = useCallback((dir: "left" | "right") => {
    if (busy.current || !card) return;
    busy.current = true;
    setDx(dir === "right" ? window.innerWidth : -window.innerWidth);
    setTimeout(() => {
      setSnap(true);
      mark(dir === "right");
      setDx(0);
      requestAnimationFrame(() => requestAnimationFrame(() => { setSnap(false); busy.current = false; }));
    }, 200);
  }, [card, mark]);

  useEffect(() => {
    if (!active) return;
    const h = (e: KeyboardEvent) => {
      const t = (e.target as HTMLElement).tagName;
      if (t === "TEXTAREA" || t === "INPUT") return;
      if (e.code === "Space") { e.preventDefault(); setFlipped((f) => !f); }
      if (e.key === "ArrowRight") commit("right");
      if (e.key === "ArrowLeft") commit("left");
    };
    window.addEventListener("keydown", h);
    return () => window.removeEventListener("keydown", h);
  }, [active, commit]);

  function onDown(e: React.PointerEvent<HTMLDivElement>) {
    if (busy.current) return;
    drag.current = { x: e.clientX, y: e.clientY, moved: false };
    setDragging(true);
    e.currentTarget.setPointerCapture(e.pointerId);
  }
  function onMove(e: React.PointerEvent<HTMLDivElement>) {
    const d = drag.current;
    if (!d) return;
    const mx = e.clientX - d.x;
    const my = e.clientY - d.y;
    if (!d.moved && Math.abs(mx) > 8 && Math.abs(mx) > Math.abs(my)) d.moved = true;
    if (d.moved) setDx(mx);
  }
  function onUp() {
    const d = drag.current;
    drag.current = null;
    setDragging(false);
    if (!d) return;
    if (!d.moved) { setFlipped((f) => !f); return; } // a tap flips the card
    if (dx > THRESH) commit("right");
    else if (dx < -THRESH) commit("left");
    else setDx(0);
  }
  function onCancel() {
    drag.current = null;
    setDragging(false);
    setDx(0);
  }

  if (!cards.length) return <p className="muted">No cards yet.</p>;
  if (loading) return <p className="muted">Shuffling your next {SESSION_SIZE} cards…</p>;

  const roundSeen = Math.min(info.total, info.seenBefore + info.fresh);
  const roundComplete = roundSeen >= info.total;

  if (done)
    return (
      <div className="panel">
        <h2 style={{ marginTop: 0 }}>Session finished 🎉</h2>
        <p>✅ Knew: {known} &nbsp; ❌ Still learning: {missed.length}</p>
        {info.tracked && (
          <p className="muted">
            {roundComplete
              ? `You have now seen all ${info.total} cards in this deck. The next session starts a new round.`
              : `Round progress: ${roundSeen} / ${info.total} cards seen. The next session shows cards you haven't seen yet.`}
          </p>
        )}
        <div className="row">
          {missed.length > 0 && (
            <button onClick={() => { setQueue(shuffle(missed)); setI(0); setMissed([]); setKnown(0); setFlipped(false); }}>
              Review {missed.length} missed
            </button>
          )}
          <button className="ghost" onClick={startSession}>Next {SESSION_SIZE} cards</button>
        </div>
      </div>
    );

  if (!card) return null;

  const front = reverse ? card.back : card.front;
  const back = reverse ? card.front : card.back;
  const goalDone = (stats?.cards_today ?? 0) >= GOAL;
  const right = Math.max(0, Math.min(1, dx / THRESH));
  const left = Math.max(0, Math.min(1, -dx / THRESH));

  return (
    <>
      {stats && (
        <p className="muted" style={{ margin: "0 0 8px" }}>
          {goalDone ? "✅ Today's goal done — streak safe" : `Today: ${stats.cards_today} / ${GOAL} cards to keep your streak`}
        </p>
      )}
      {!info.tracked && <p className="muted">Log in to save progress, streak and lives.</p>}
      <div className="row" style={{ justifyContent: "space-between", marginBottom: 8 }}>
        <span className="muted">{i + 1} / {queue.length}</span>
        <div className="row">
          <button className="ghost" onClick={() => { setReverse((r) => !r); setFlipped(false); }}>
            {reverse ? "Answer first" : "Term first"}
          </button>
        </div>
      </div>
      <div className="progress"><div style={{ width: `${(i / queue.length) * 100}%` }} /></div>

      <div className="swipe-wrap"
        onPointerDown={onDown} onPointerMove={onMove} onPointerUp={onUp} onPointerCancel={onCancel}>
        <div className="swipe"
          style={{
            transform: `translateX(${dx}px) rotate(${dx / 20}deg)`,
            transition: dragging || snap ? "none" : "transform .2s ease",
          }}>
          <div className="scene">
            <div className={`flip ${flipped ? "flipped" : ""}`}>
              <div className="face"><span>{front}</span></div>
              <div className="face back"><span>{back}</span></div>
            </div>
          </div>
        </div>
        <div className="hint hint-left" style={{ opacity: left }}>✗ Still learning</div>
        <div className="hint hint-right" style={{ opacity: right }}>✓ Know it</div>
      </div>

      <div className="actions">
        <button className="danger" onClick={() => commit("left")}>✗ Still learning</button>
        <button className="ghost" onClick={() => setFlipped((f) => !f)}>Flip</button>
        <button style={{ background: "var(--ok)" }} onClick={() => commit("right")}>✓ Know it</button>
      </div>
      <p className="muted" style={{ textAlign: "center" }}>
        Swipe left = still learning · swipe right = know it · tap to flip
      </p>
    </>
  );
}
