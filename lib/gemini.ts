export const WORD_SCHEMA = {
  type: "ARRAY",
  items: {
    type: "OBJECT",
    properties: {
      word: { type: "STRING" },
      examples: { type: "ARRAY", items: { type: "STRING" } },
      english: { type: "STRING" },
      note: { type: "STRING" },
    },
    required: ["word", "examples", "english"],
  },
};

/** Tried in this order when the main model is overloaded or rate-limited. */
const FALLBACKS = (process.env.GEMINI_FALLBACK_MODELS ?? "gemini-3.5-flash-lite,gemini-3.1-flash-lite")
  .split(",")
  .map((s) => s.trim())
  .filter(Boolean);

const sleep = (ms: number) => new Promise((r) => setTimeout(r, ms));

export async function askGemini(prompt: string, key: string, model: string): Promise<string> {
  const models = [model, ...FALLBACKS.filter((m) => m !== model)];
  const problems: string[] = [];

  for (const m of models) {
    for (let attempt = 0; attempt < 2; attempt++) {
      let res: Response;
      try {
        res = await fetch(`https://generativelanguage.googleapis.com/v1beta/models/${m}:generateContent`, {
          method: "POST",
          headers: { "Content-Type": "application/json", "x-goog-api-key": key },
          body: JSON.stringify({
            contents: [{ parts: [{ text: prompt }] }],
            generationConfig: { responseMimeType: "application/json", responseSchema: WORD_SCHEMA, temperature: 1 },
          }),
        });
      } catch (e: any) {
        problems.push(`${m}: network error ${e?.message ?? e}`);
        await sleep(2000);
        continue;
      }

      if (res.ok) {
        const j = await res.json();
        const text = j?.candidates?.[0]?.content?.parts?.map((p: any) => p.text ?? "").join("") ?? "";
        if (text) return text;
        problems.push(`${m}: empty answer`);
        break;
      }

      const body = (await res.text()).replace(/\s+/g, " ").slice(0, 200);
      problems.push(`${m}: HTTP ${res.status} ${body}`);
      if (res.status === 429 || res.status >= 500) {
        await sleep(3000 * (attempt + 1)); // busy – wait, retry once, then try the next model
        continue;
      }
      break; // 400/403/404: this model won't work, go to the next one
    }
  }
  throw new Error(`Gemini failed – ${problems.join(" | ")}`);
}