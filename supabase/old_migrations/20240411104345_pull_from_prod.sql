drop policy "Public Profile are viewable by everyone." on "public"."Profile";

alter table "public"."Product" enable row level security;

create policy "Allow read only for authenticated users"
on "public"."Account"
as permissive
for select
to authenticated
using (true);


create policy "Allow update only for authenticated users"
on "public"."Account"
as permissive
for update
to authenticated
using (true);


create policy "Enable insert for authenticated users only"
on "public"."Product"
as permissive
for insert
to authenticated
with check (true);


create policy "Enable read for authenticated users only"
on "public"."Product"
as permissive
for select
to authenticated
using (true);


create policy "Public Profile are viewable by everyone."
on "public"."Profile"
as permissive
for select
to public
using ((auth.uid() = id));



