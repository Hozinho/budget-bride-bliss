create table if not exists purchase_clicks (
  id uuid primary key default gen_random_uuid(),
  plan text not null,
  destination_url text not null,
  created_at timestamptz not null default now()
);

alter table purchase_clicks enable row level security;

create policy "Allow anonymous inserts"
  on purchase_clicks
  for insert
  to anon
  with check (true);
