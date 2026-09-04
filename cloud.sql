-- Apollo Ink V17 — one cloud record per account
create table if not exists public.apollo_cloud (
  user_id uuid primary key references auth.users(id) on delete cascade,
  payload jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.apollo_cloud enable row level security;

drop policy if exists "apollo_cloud_select_own" on public.apollo_cloud;
drop policy if exists "apollo_cloud_insert_own" on public.apollo_cloud;
drop policy if exists "apollo_cloud_update_own" on public.apollo_cloud;
drop policy if exists "apollo_cloud_delete_own" on public.apollo_cloud;

create policy "apollo_cloud_select_own" on public.apollo_cloud
for select to authenticated using (auth.uid() = user_id);

create policy "apollo_cloud_insert_own" on public.apollo_cloud
for insert to authenticated with check (auth.uid() = user_id);

create policy "apollo_cloud_update_own" on public.apollo_cloud
for update to authenticated using (auth.uid() = user_id) with check (auth.uid() = user_id);

create policy "apollo_cloud_delete_own" on public.apollo_cloud
for delete to authenticated using (auth.uid() = user_id);

grant select, insert, update, delete on public.apollo_cloud to authenticated;
