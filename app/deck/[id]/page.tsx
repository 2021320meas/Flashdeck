"use client";
import Link from "next/link";
import { useCallback, useEffect, useMemo, useState } from "react";
import { supabase, Card, Deck } from "@/lib/supabase";
import Flashcards from "@/components/Flashcards";
import Quiz from "@/components/Quiz";

type Tab = "cards" | "flash" | "quiz";

export default function DeckPage({ params }: { params: { id: string } }) {
  const { id } = params;
  const [deck, setDeck] = useState<Deck | null>(null);
  const [cards, setCards] = useState<Card[]>([]);
  const [tab, setTab] = useState<Tab>("flash");
  const [front, setFront] = useState("");
  const [back, setBack] = useState("");
  const [search, setSearch] = useState("");
  const [editing, setEditing] = useState<string | null>(null);
  const [err, setErr] = useState("");

  const load = useCallback(async () => {
    const d = await supabase.from("decks").select("*").eq("id", id).single();
    if (d.data) setDeck(d.data as Deck);
    // fetch all cards (Supabase default cap is 1000 rows)
    const c = await supabase.from("cards").select("*").eq("deck_id", id).order("created_at").range(0, 4999);
    if (c.error) setErr(c.error.message);
    else setCards(c.data as Card[]);
  }, [id]);

  useEffect(() => { load(); }, [load]);

  function fail(message: string) {
    setErr(message.includes("row-level") ? "You need to log in to change cards." : message);
  }

  async function addCard() {
    if (!front.trim() || !back.trim()) return;
    const { error } = await supabase.from("cards").insert({ deck_id: id, front: front.trim(), back: back.trim() });
    if (error) return fail(error.message);
    setFront(""); setBack(""); setErr(""); load();
  }

  useEffect(() => {
  function handleKeyDown(e: KeyboardEvent) {
    if (e.ctrlKey && e.key === "Enter") {
      e.preventDefault();
      addCard();
    }
  }

  window.addEventListener("keydown", handleKeyDown);

  return () => {
    window.removeEventListener("keydown", handleKeyDown);
  };
  }, [front, back]);

  async function saveEdit(c: Card) {
    const { error } = await supabase.from("cards").update({ front: c.front, back: c.back }).eq("id", c.id);
    if (error) return fail(error.message);
    setEditing(null); load();
  }

  async function remove(cid: string) {
    if (!confirm("Delete this card?")) return;
    const { error } = await supabase.from("cards").delete().eq("id", cid);
    if (error) return fail(error.message);
    load();
  }

  const filtered = useMemo(() => {
    const s = search.toLowerCase();
    return s ? cards.filter((c) => c.front.toLowerCase().includes(s) || c.back.toLowerCase().includes(s)) : cards;
  }, [cards, search]);

  if (!deck) return <p className="muted">Loading… <Link href="/">← Back</Link></p>;

  return (
    <>
      <Link href="/" className="muted">← All decks</Link>
      <h1>{deck.name} <span className="muted">({cards.length} cards)</span></h1>
      <div className="tabs">
        <button className={tab === "flash" ? "active" : ""} onClick={() => setTab("flash")}>Flashcards</button>
        <button className={tab === "quiz" ? "active" : ""} onClick={() => setTab("quiz")}>Quiz</button>
        <button className={tab === "cards" ? "active" : ""} onClick={() => setTab("cards")}>Manage cards</button>
      </div>
      {err && <p className="err">{err}</p>}

      {/* kept mounted (just hidden) so a session in progress survives switching tabs */}
      <div style={{ display: tab === "flash" ? "block" : "none" }}>
        <Flashcards cards={cards} deckId={id} active={tab === "flash"} />
      </div>
      <div style={{ display: tab === "quiz" ? "block" : "none" }}>
        <Quiz cards={cards} />
      </div>

      {tab === "cards" && (
        <>
          <div className="panel">
            <h3 style={{ marginTop: 0 }}>Add a card</h3>
            <textarea rows={3} placeholder="Front (word + example sentence)" value={front} onChange={(e) => setFront(e.target.value)} />
            <textarea rows={2} placeholder="Back (meaning)" value={back} onChange={(e) => setBack(e.target.value)} />
            <button onClick={addCard}>Add card</button>
          </div>
          <input placeholder="Search cards…" value={search} onChange={(e) => setSearch(e.target.value)} />
          {filtered.map((c) =>
            editing === c.id ? (
              <EditRow key={c.id} card={c} onSave={saveEdit} onCancel={() => setEditing(null)} />
            ) : (
              <div className="panel" key={c.id}>
                <div className="pre"><b>{c.front}</b></div>
                <div className="pre muted" style={{ marginTop: 8 }}>{c.back}</div>
                <div className="row" style={{ marginTop: 10 }}>
                  <button className="ghost" onClick={() => setEditing(c.id)}>Edit</button>
                  <button className="ghost" onClick={() => remove(c.id)}>Delete</button>
                </div>
              </div>
            )
          )}
        </>
      )}
    </>
  );
}

function EditRow({ card, onSave, onCancel }: { card: Card; onSave: (c: Card) => void; onCancel: () => void }) {
  const [f, setF] = useState(card.front);
  const [b, setB] = useState(card.back);
  return (
    <div className="panel">
      <textarea rows={3} value={f} onChange={(e) => setF(e.target.value)} />
      <textarea rows={2} value={b} onChange={(e) => setB(e.target.value)} />
      <div className="row">
        <button onClick={() => onSave({ ...card, front: f, back: b })}>Save</button>
        <button className="ghost" onClick={onCancel}>Cancel</button>
      </div>
    </div>
  );
}
