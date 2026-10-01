# FlashDeck – a Quizlet-style site (Next.js + Supabase + Vercel)

Features
- Decks, flip cards, multiple-choice quiz (20 random questions), add/edit/delete/search cards
- **70-card sessions**: each session is a random 70 cards you haven't seen yet in the current round, so you cover the whole deck before any card repeats. When all cards have been seen, a new round starts.
- **Swipe**: left = still learning, right = know it, tap = flip (buttons and keyboard also work)
- **Streak, days used and 3 lives** (Duolingo-style, see rules below)
- **Reminder email** at 4–5 PM if you haven't studied
- **Installable on iPhone** with the cat icon, phone-friendly layout

Your Anki export is already converted: `supabase/seed.sql` (385 cards, 3 decks).

## Rules for streak and lives
- A day counts as "used" when you answer **10 cards** (flashcards or quiz). Change `GOAL` in `lib/streak.ts`.
- You start with **3 lives** (max 3).
- Miss a whole day → **lose 1 life**; the streak is protected while you still have a life.
- Miss a day with **0 lives** → the streak resets to 0.
- **14 days in a row** of use → **earn 1 life**. Missing a day restarts that 14-day count.
- Days are counted in Europe/Berlin time (`NEXT_PUBLIC_TZ` to change).

## 1. Supabase
1. Create a project at supabase.com.
2. SQL Editor → run, in this order: `supabase/schema.sql`, `supabase/seed.sql`, **`supabase/progress.sql`** (new: progress + streak tables).
3. Settings → API: copy the **Project URL**, **anon public key** and **service_role key**.
4. Authentication → Providers → Email: turn **off** "Confirm email" for simplicity.

## 2. Run locally
```bash
npm install
cp .env.example .env.local   # paste your URL + anon key
npm run dev
```
Open http://localhost:3000 → Log in → **Sign up**. Streak/lives/progress are saved per logged-in account.

## 3. Lock it to you
After creating your account, in Supabase → Authentication → Sign In / Providers turn **off** "Allow new users to sign up".

## 4. Deploy on Vercel
1. Push this folder to GitHub → vercel.com → New Project → import it.
2. Add environment variables (see `.env.example`):
   `NEXT_PUBLIC_SUPABASE_URL`, `NEXT_PUBLIC_SUPABASE_ANON_KEY`, and for the email reminder:
   `SUPABASE_SERVICE_ROLE_KEY`, `RESEND_API_KEY`, `CRON_SECRET`, `NOTIFY_EMAIL`.
3. Deploy.

## 5. Reminder email (4–5 PM)
- Create a free account at **resend.com** using **meassothyro3@gmail.com**, create an API key → `RESEND_API_KEY`.
  Without your own verified domain, Resend only delivers to the email you signed up with – which is why you must use that address.
- `CRON_SECRET`: any long random string. Vercel sends it automatically to the cron route.
- `vercel.json` schedules two daily runs (14:00 and 15:00 UTC). The code only sends when the Berlin time is 16:xx or 17:xx, so it keeps working across summer/winter time. Vercel's free (Hobby) plan runs cron jobs somewhere inside the scheduled hour, not to the minute.
- You get at most one email per day, and none if you've already done today's cards.
- The first email can only be sent after you've logged in once (that creates your stats row).
- Test it any time: open `https://YOUR-SITE/api/cron/reminder?force=1` with the header `Authorization: Bearer YOUR_CRON_SECRET`, e.g.
  `curl -H "Authorization: Bearer YOUR_CRON_SECRET" "https://YOUR-SITE/api/cron/reminder?force=1"`

## 6. Put it on your iPhone home screen
1. Open your Vercel URL in **Safari**.
2. Tap **Share** → **Add to Home Screen** → **Add**.
3. The cat icon appears; it opens full-screen like an app.
To change the icon background colour, edit `BG` in `scripts/make_icons.py` and run `python3 scripts/make_icons.py` (needs `pip install pillow`).

## Adding more cards later
Use the **Manage cards** tab. For bulk imports from a new Anki export:
```bash
python3 scripts/convert_anki.py "New Export.txt" supabase/new.sql
```
Run `new.sql` in the Supabase SQL editor (re-running an old export would duplicate cards).
