"use client";
import { useRouter } from "next/navigation";
import { useState } from "react";
import { supabase } from "@/lib/supabase";

export default function Login() {
  const router = useRouter();
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [err, setErr] = useState("");
  const [busy, setBusy] = useState(false);

  async function submit(mode: "in" | "up") {
    setBusy(true);
    setErr("");
    const { error } =
      mode === "in"
        ? await supabase.auth.signInWithPassword({ email, password })
        : await supabase.auth.signUp({ email, password });
    setBusy(false);
    if (error) return setErr(error.message);
    if (mode === "up") setErr("Account created. If email confirmation is on, confirm it, then log in.");
    else router.push("/");
  }

  return (
    <div className="panel" style={{ maxWidth: 400, margin: "0 auto" }}>
      <h1>Log in</h1>
      <input placeholder="Email" type="email" value={email} onChange={(e) => setEmail(e.target.value)} />
      <input placeholder="Password" type="password" value={password} onChange={(e) => setPassword(e.target.value)} />
      {err && <p className="err">{err}</p>}
      <div className="row">
        <button disabled={busy} onClick={() => submit("in")}>Log in</button>
        <button className="ghost" disabled={busy} onClick={() => submit("up")}>Sign up</button>
      </div>
      <p className="muted">Tip: after creating your own account, turn off “Allow new users to sign up” in Supabase (Authentication → Sign In / Providers) so nobody else can edit your decks.</p>
    </div>
  );
}
