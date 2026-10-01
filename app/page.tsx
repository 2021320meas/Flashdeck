"use client";
import Link from "next/link";
import { useCallback, useEffect, useState } from "react";
import { supabase, Deck } from "@/lib/supabase";
import StatsPanel from "@/components/StatsPanel";

type DeckRow = Deck & { count: number };

export default function Home() {
  const [decks, setDecks] = useState<DeckRow[]>([]);
  const [name, setName] = useState("");
  const [err, setErr] = useState("");
  const [loading, setLoading] = useState(true);

  const load = useCallback(async () => {
    const { data, error } = await supabase.from("decks").select("*, cards(count)").order("name");
    if (error) setErr(error.message);
    else
      setDecks(
        (data as any[]).map((d) => ({ id: d.id, name: d.name, created_at: d.created_at, count: d.cards?.[0]?.count ?? 0 }))
      );
    setLoading(false);
  }, []);

  useEffect(() => { load(); }, [load]);

  async function addDeck() {
    if (!name.trim()) return;
    const { error } = await supabase.from("decks").insert({ name: name.trim() });
    if (error) return setErr(error.message.includes("row-level") ? "Log in first to create decks." : error.message);
    setName("");
    setErr("");
    load();
  }

  return (
    <>
      <StatsPanel />
      <h1>Your decks</h1>
      {loading ? <p className="muted">Loading…</p> : (
        <div className="grid">
          {decks.map((d) => (
            <Link key={d.id} href={`/deck/${d.id}`} className="tile">
              <h3>{d.name}</h3>
              <span className="muted">{d.count} cards</span>
            </Link>
          ))}
        </div>
      )}
      <div className="panel" style={{ marginTop: 24 }}>
        <h3 style={{ marginTop: 0 }}>New deck</h3>
        <div className="row">
          <input style={{ flex: 1, marginBottom: 0 }} placeholder="Deck name" value={name}
            onChange={(e) => setName(e.target.value)} onKeyDown={(e) => e.key === "Enter" && addDeck()} />
          <button onClick={addDeck}>Create</button>
        </div>
        {err && <p className="err">{err}</p>}
      </div>
    </>
  );
}
