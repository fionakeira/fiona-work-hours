-- Run once in your own Supabase project's SQL Editor.
-- This preserves the requested no-sign-in experience: anyone can read and edit.
create table if not exists public.fiona_timesheet_entries (
 id text primary key,
 date date not null check (date between '1900-01-01'::date and '2100-12-31'::date),
 hours numeric(6,2) not null check (hours >= 0.01 and hours <= 24),
 description text not null default '' check (char_length(description) <= 1000)
);
alter table public.fiona_timesheet_entries enable row level security;
revoke all on public.fiona_timesheet_entries from anon, authenticated;
grant usage on schema public to anon, authenticated;
grant select, insert, update, delete on public.fiona_timesheet_entries to anon, authenticated;
drop policy if exists "Public timesheet access" on public.fiona_timesheet_entries;
create policy "Public timesheet access" on public.fiona_timesheet_entries
 for all to anon, authenticated using (true) with check (true);

-- Current entry copied from the original site. This does not overwrite edits.
insert into public.fiona_timesheet_entries (id,date,hours,description)
values ('initial-sept-2','2026-09-02',8,'') on conflict (id) do nothing;
