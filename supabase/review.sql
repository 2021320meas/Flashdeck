create table if not exists card_review (
  user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  card_id uuid not null references cards(id) on delete cascade,
  due_date date not null,
  primary key (user_id, card_id)
);

alter table card_review enable row level security;

create policy "own review" on card_review for all to authenticated
  using (auth.uid() = user_id) with check (auth.uid() = user_id);

create or replace function schedule_review(p_card uuid, p_due date)
returns void language sql as $$
  insert into card_review (user_id, card_id, due_date)
  values (auth.uid(), p_card, p_due)
  on conflict (user_id, card_id) do update set due_date = excluded.due_date;
$$;

create or replace function clear_review(p_card uuid)
returns void language sql as $$
  delete from card_review where user_id = auth.uid() and card_id = p_card;
$$;