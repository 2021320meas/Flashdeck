"use client";
import Link from "next/link";
import { useEffect, useState } from "react";
import { supabase } from "@/lib/supabase";
import { initStats } from "@/lib/stats";
import { StatsBadge } from "@/components/StatsPanel";

export default function Nav() {
  const [email, setEmail] = useState<string | null>(null);

  useEffect(() => {
    supabase.auth.getSession().then(({ data }) => {
      setEmail(data.session?.user.email ?? null);
      initStats();
    });
    const { data } = supabase.auth.onAuthStateChange((_e, s) => {
      setEmail(s?.user.email ?? null);
      initStats();
    });
    // re-check streak/lives when the app is reopened (e.g. from the home screen the next day)
    const onVisible = () => { if (!document.hidden) initStats(); };
    document.addEventListener("visibilitychange", onVisible);
    return () => {
      data.subscription.unsubscribe();
      document.removeEventListener("visibilitychange", onVisible);
    };
  }, []);

  return (
    <div className="nav">
      <Link href="/" className="logo">
        <img src="/icon-192.png" alt="" width={28} height={28} style={{ borderRadius: 7, verticalAlign: "middle", marginRight: 8 }} />
        FlashDeck
      </Link>
      <div className="row">
        <StatsBadge />
        {email ? (
          <>
            <span className="muted hide-sm">{email}</span>
            <button className="ghost" onClick={() => supabase.auth.signOut()}>Log out</button>
          </>
        ) : (
          <Link href="/login" className="btn">Log in</Link>
        )}
      </div>
    </div>
  );
}
