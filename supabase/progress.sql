-- Run once in the Supabase SQL editor (after schema.sql). Adds study progress + streak tracking.

create table if not exists deck_progress (
  user_id uuid not null references auth.users(id) on delete cascade,
  deck_id uuid not null references decks(id) on delete cascade,
  seen_ids uuid[] not null default '{}',
  primary key (user_id, deck_id)
);

create table if not exists user_stats (
  user_id uuid primary key references auth.users(id) on delete cascade,
  lives int not null default 3,
  streak int not null default 0,
  run int not null default 0,
  total_days int not null default 0,
  last_active_date date,
  settled_through date not null,
  cards_today int not null default 0,
  cards_today_date date,
  last_email_date date,
  updated_at timestamptz not null default now()
);

alter table deck_progress enable row level security;
alter table user_stats enable row level security;

create policy "own progress" on deck_progress for all to authenticated
  using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "own stats" on user_stats for all to authenticated
  using (auth.uid() = user_id) with check (auth.uid() = user_id);

-- Adds card ids to the "seen this round" list (or clears it when p_reset is true).
create or replace function mark_seen(p_deck uuid, p_ids uuid[], p_reset boolean default false)
returns void language sql as $$
  insert into deck_progress (user_id, deck_id, seen_ids)
  values (auth.uid(), p_deck, p_ids)
  on conflict (user_id, deck_id) do update
  set seen_ids = case
    when p_reset then p_ids
    else (select coalesce(array_agg(distinct x), '{}') from unnest(deck_progress.seen_ids || p_ids) as x)
  end;
$$;
