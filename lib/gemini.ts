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

export async function askGemini(prompt: string, key: string, model: string): Promise<string> {
  for (let attempt = 0; attempt < 3; attempt++) {
    const res = await fetch(`https://generativelanguage.googleapis.com/v1beta/models/${model}:generateContent`, {
      method: "POST",
      headers: { "Content-Type": "application/json", "x-goog-api-key": key },
      body: JSON.stringify({
        contents: [{ parts: [{ text: prompt }] }],
        generationConfig: { responseMimeType: "application/json", responseSchema: WORD_SCHEMA, temperature: 1 },
      }),
    });
    if (res.ok) {
      const j = await res.json();
      return j?.candidates?.[0]?.content?.parts?.map((p: any) => p.text ?? "").join("") ?? "";
    }
    if (res.status === 429 || res.status >= 500) {
      await new Promise((r) => setTimeout(r, 4000 * (attempt + 1)));
      continue;
    }
    throw new Error(`Gemini ${res.status}: ${(await res.text()).slice(0, 300)}`);
  }
  throw new Error("Gemini is busy or the free quota is used up – try again later");
}