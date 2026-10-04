export type GeneratedWord = {
  word: string;
  examples: string[];
  english: string;
};

export type NewCard = { front: string; back: string; word_key: string };

export function wordKey(w: string): string {
  return w.trim().toLowerCase().replace(/\s+/g, " ");
}

export function toCard(w: GeneratedWord): NewCard | null {
  const word = (w.word ?? "").trim();
  const english = (w.english ?? "").trim();
  const examples = (w.examples ?? []).map((e) => String(e).trim()).filter(Boolean).slice(0, 3);
  if (!word || !english || examples.length === 0) return null;
  return { front: [word, ...examples].join("\n"), back: english, word_key: wordKey(word) };
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
  const seen = new Set(existing);
  const out: NewCard[] = [];
  for (const item of list) {
    const c = toCard(item as GeneratedWord);
    if (!c || seen.has(c.word_key)) continue;
    seen.add(c.word_key);
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