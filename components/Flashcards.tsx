"use client";
import { useCallback, useEffect, useRef, useState } from "react";
import { Card, shuffle } from "@/lib/supabase";
import { buildSession, markSeen, SESSION_SIZE } from "@/lib/session";
import { recordCards, useStats } from "@/lib/stats";
import { GOAL } from "@/lib/streak";
import { dueToday, listSize, loadReview, recordReviewAnswer } from "@/lib/review";
import { CYCLE_DAYS } from "@/lib/reviewlogic";

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
  // 3-day review: card id -> day of the cycle, for the cards queued as reviews in this session
  const [reviewDay, setReviewDay] = useState<Record<string, number>>({});
  const [reviewInfo, setReviewInfo] = useState({ due: 0, listed: 0, error: "" });
  const [rv, setRv] = useState({ started: 0, graduated: 0, restarted: 0 });

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
    const { error } = await loadReview(deckId);
    // cards due for their 3-day review come first; they are kept out of the random pick
    const due = dueToday(deckId);
    const dueCards = shuffle(cardsRef.current.filter((c) => due.has(c.id)));
    const s = await buildSession(deckId, cardsRef.current, new Set(dueCards.map((c) => c.id)));
    setQueue([...dueCards, ...s.cards]);
    setInfo({ seenBefore: s.seenBefore, fresh: s.fresh, total: s.total, tracked: s.tracked });
    setReviewDay(Object.fromEntries(dueCards.map((c) => [c.id, due.get(c.id)!.day])));
    setReviewInfo({ due: dueCards.length, listed: listSize(deckId), error: error ?? "" });
    setRv({ started: 0, graduated: 0, restarted: 0 });
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
    // 3-day repetition: left starts a cycle, Day 3 decides whether the card is done
    const outcome = recordReviewAnswer(deckId, card.id, ok);
    if (outcome === "started") setRv((r) => ({ ...r, started: r.started + 1 }));
    if (outcome === "graduated") setRv((r) => ({ ...r, graduated: r.graduated + 1 }));
    if (outcome === "restarted") setRv((r) => ({ ...r, restarted: r.restarted + 1 }));
    if (outcome !== "ignored") setReviewInfo((r) => ({ ...r, listed: listSize(deckId) }));
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
        {(rv.started > 0 || rv.graduated > 0 || rv.restarted > 0) && (
          <p className="muted">
            3-day review:
            {rv.started > 0 && ` ${rv.started} new word${rv.started > 1 ? "s" : ""} added (Day 1 is tomorrow).`}
            {rv.graduated > 0 && ` ${rv.graduated} remembered and removed. 🎓`}
            {rv.restarted > 0 && ` ${rv.restarted} start${rv.restarted > 1 ? "" : "s"} a new 3-day cycle.`}
          </p>
        )}
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
      {!info.tracked && <p className="muted">Log in to save progress, streak and lives. (Your review list is saved in this browser.)</p>}
      {reviewInfo.error && (
        <p className="err">Review list could not be loaded ({reviewInfo.error}). Run supabase/review.sql in Supabase.</p>
      )}
      {reviewInfo.listed > 0 && (
        <p className="muted" style={{ margin: "0 0 8px" }}>
          🔁 {reviewInfo.due} review card{reviewInfo.due === 1 ? "" : "s"} due today · {reviewInfo.listed} on your 3-day review list
        </p>
      )}
      <div className="row" style={{ justifyContent: "space-between", marginBottom: 8 }}>
        <span className="muted">{i + 1} / {queue.length}</span>
        <div className="row">
          <button className="ghost" onClick={() => { setReverse((r) => !r); setFlipped(false); }}>
            {reverse ? "Answer first" : "Term first"}
          </button>
        </div>
      </div>
      <div className="progress"><div style={{ width: `${(i / queue.length) * 100}%` }} /></div>
      
      {reviewDay[card.id] && (
        <p style={{ textAlign: "center", margin: "0 0 4px", fontWeight: 600 }}>
          🔁 Review · Day {reviewDay[card.id]} of {CYCLE_DAYS}
          {reviewDay[card.id] === CYCLE_DAYS && <span className="muted"> — final check</span>}
        </p>
      )}
      
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
