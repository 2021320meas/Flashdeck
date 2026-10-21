import { runDailyJob } from "@/lib/dailyjob";
import { buildItPrompt } from "@/lib/dailywords";

export const dynamic = "force-dynamic";
export const maxDuration = 60;

const LEVEL = process.env.DAILY_IT_LEVEL || "B2";

export async function GET(req: Request) {
  return runDailyJob(req, {
    deckName: process.env.DAILY_IT_DECK_NAME || "German IT Interview",
    perDay: Number(process.env.DAILY_IT_WORDS_COUNT || 30),
    model: process.env.GEMINI_MODEL || "gemini-3.5-flash",
    prompt: (count, avoid) => buildItPrompt(count, LEVEL, avoid),
  });
}