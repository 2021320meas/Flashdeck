create table if not exists review_schedule (
  user_id uuid not null references auth.users(id) on delete cascade,
  card_id uuid not null references cards(id) on delete cascade,
  deck_id uuid not null references decks(id) on delete cascade,
  day smallint not null default 1 check (day between 1 and 3),
  due_date date not null,
  last_reviewed date,
  cycles int not null default 1,
  primary key (user_id, card_id)
);

create index if not exists review_schedule_deck_idx on review_schedule(user_id, deck_id);

alter table review_schedule enable row level security;

create policy "own review schedule" on review_schedule for all to authenticated
  using (auth.uid() = user_id) with check (auth.uid() = user_id);