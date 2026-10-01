-- Run this first in the Supabase SQL editor.
create extension if not exists "pgcrypto";

create table if not exists decks (
  id uuid primary key default gen_random_uuid(),
  name text not null unique,
  created_at timestamptz not null default now()
);

create table if not exists cards (
  id uuid primary key default gen_random_uuid(),
  deck_id uuid not null references decks(id) on delete cascade,
  front text not null,
  back text not null,
  created_at timestamptz not null default now()
);

create index if not exists cards_deck_idx on cards(deck_id);

alter table decks enable row level security;
alter table cards enable row level security;

-- Anyone can read (so you can study without logging in)
create policy "decks readable" on decks for select using (true);
create policy "cards readable" on cards for select using (true);

-- Only logged-in users can change things
create policy "decks write" on decks for all to authenticated using (true) with check (true);
create policy "cards write" on cards for all to authenticated using (true) with check (true);
