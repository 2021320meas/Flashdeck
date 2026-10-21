export type GeneratedWord = {
  word: string;
  examples: string[];
  english: string;
  note?: string; // optional usage tip, shown under the English meaning
};

export type NewCard = { front: string; back: string; word_key: string };

export function wordKey(w: string): string {
  return w.trim().toLowerCase().replace(/\s+/g, " ");
}

/**
 * The "core" of a headword, used to spot repeats even when written differently:
 * "die Schwachstelle, -n" = "Schwachstelle" = "die Schwachstelle";
 * "sich verlassen auf + akk." = "verlassen auf".
 * Accepts a whole card front too (only its first line is used).
 */
export function coreKey(s: string): string {
  let k = (s ?? "").split("\n")[0].toLowerCase();
  k = k.replace(/\(.*?\)/g, " "); // (Pl.), (Nomen)
  k = k.split(",")[0]; // plural / genitive endings after a comma
  k = k.replace(/\+\s*(akk|dat|gen)\.?/g, " "); // case info
  k = k.replace(/^\s*(der|die|das)\s+/, "");
  k = k.replace(/^\s*sich\s+/, "");
  return k.replace(/[.!?;:]+$/g, "").replace(/\s+/g, " ").trim();
}

export function toCard(w: GeneratedWord): NewCard | null {
  const word = (w.word ?? "").trim();
  const english = (w.english ?? "").trim();
  const examples = (w.examples ?? []).map((e) => String(e).trim()).filter(Boolean).slice(0, 3);
  if (!word || !english || examples.length === 0) return null;
  const note = (w.note ?? "").trim();
  return {
    front: [word, ...examples].join("\n"),
    back: note ? `${english}\n\n💡 ${note}` : english,
    word_key: wordKey(word),
  };
}

export function parseWords(raw: string, existing: Set<string>, limit: number): NewCard[] {
  let data: unknown;
  try {
    data = JSON.parse(raw);
  } catch {
    return [];
  }
  const list = Array.isArray(data) ? data : (data as any)?.words;
  if (!Array.isArray(list)) return [];
  const seen = new Set(Array.from(existing).map(coreKey));
  const out: NewCard[] = [];
  for (const item of list) {
    const c = toCard(item as GeneratedWord);
    if (!c) continue;
    const ck = coreKey(c.word_key);
    if (!ck || seen.has(ck)) continue;
    seen.add(ck);
    out.push(c);
    if (out.length >= limit) break;
  }
  return out;
}

export function buildPrompt(count: number, level: string, avoid: string[]): string {
  return [
    `You are a German teacher making flashcards for an English-speaking learner at level ${level}.`,
    `Create ${count} NEW German vocabulary items that are useful in everyday life, work and conversation.`,
    `Mix the types: nouns (always with article, e.g. "die Umfrage"), verbs (with preposition/case where relevant, e.g. "sich kümmern um"),`,
    `adjectives/adverbs, and useful fixed expressions (e.g. "erst vor Kurzem").`,
    `For each item give: "word" (the German headword/phrase), "examples" (exactly 2 natural German example sentences that use it, correct grammar, level ${level}),`,
    `and "english" (a short, accurate English meaning, max 6 words).`,
    `Do not repeat any of these words: ${avoid.length ? avoid.join(", ") : "(none yet)"}.`,
    `Return only JSON.`,
  ].join("\n");
}

export function buildItPrompt(count: number, level: string, avoid: string[]): string {
  return [
    `You are a German language coach for an IT professional preparing for job interviews in Germany.`,
    `The learner is a penetration tester (red team) from Cambodia, English-speaking, German level ${level} or higher.`,
    `Difficulty: mix levels. About half the items and sentences at ${level}, the rest clearly harder (up to C1): sentences with subordinate clauses (weil, obwohl, sodass), passive voice, Konjunktiv II for polite interview answers, and formal written style (Nominalstil) as used in reports and job ads.`,
    `They want jobs in IT security (red team AND blue team) and also related roles: system/infrastructure administration, cloud, DevOps, software development, IT support.`,
    ``,
    `Create ${count} NEW German vocabulary items. Use terms that German employers, job ads and IT teams really use.`,
    `Spread them roughly in these proportions:`,
    `- 27% offensive security / pentesting / red team (e.g. Schwachstelle, Rechteausweitung, Seitwärtsbewegung, Angriffsfläche, Prüfbericht)`,
    `- 20% defensive security / blue team / SOC / incident response / forensics (e.g. Vorfallsbehandlung, Protokollierung, Erkennung, Eindämmung)`,
    `- 13% governance, compliance and reporting (e.g. BSI IT-Grundschutz, ISO 27001, DSGVO, NIS2, Risikoanalyse, Berechtigungskonzept)`,
    `- 13% infrastructure, networks, cloud and DevOps (e.g. Bereitstellung, Containerisierung, Lastverteilung, Ausfallsicherheit, Pipeline)`,
    `- 10% software development and IT support (e.g. Quellcode-Prüfung, Fehlerbehebung, Ticketsystem, Abhängigkeit)`,
    `- 17% interview and workplace language (e.g. Berufserfahrung, Verantwortungsbereich, Einarbeitung, Kündigungsfrist, Teamarbeit, Stärken und Schwächen, "Ich bringe ... mit")`,
    ``,
    `Rules for each item:`,
    `- "word": the German term. Nouns with article and plural, e.g. "die Schwachstelle, -n". Verbs with required preposition/case where relevant, e.g. "sich ausweisen als". Prefer the real German term; if Germans mostly say an English loanword, use the loanword (e.g. "der Pentest", "das Red Teaming").`,
    `- "examples": exactly 2 correct, natural German sentences at level ${level} or above (see difficulty mix). Sentence 1 shows normal use at work (technical context). Sentence 2 is something the learner could say in a job interview, in the first person, about their own experience (e.g. "Ich habe in meiner bisherigen Position ...").`,
    `- "english": short, accurate English meaning (max 6 words).`,
    `- "note": optional, one short English tip only when useful: formal vs informal, loanword used in practice, a common collocation, or a false friend. Max 15 words. Leave it out otherwise.`,
    `Do not invent terms. Do not repeat any of these words: ${avoid.length ? avoid.join(", ") : "(none yet)"}.`,
    `Return only JSON.`,
  ].join("\n");
}