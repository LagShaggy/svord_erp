drop policy "Enable insert for authenticated users only" on "public"."account_contact";

drop policy "Enable insert for authenticated users only" on "public"."currency";

drop policy "Enable insert for authenticated users only" on "public"."price";

drop policy "Enable insert for authenticated users only" on "public"."product_variant";

drop policy "Enable insert for authenticated users only" on "public"."product_variant_manufacturer";

drop policy "Enable insert for authenticated users only" on "public"."account";

drop policy "Enable insert for authenticated users only" on "public"."product";

drop policy "Public Profile are viewable by everyone." on "public"."profile";

drop policy "Users can insert their own profile." on "public"."profile";

drop policy "Users can update own profile." on "public"."profile";

alter table "public"."price" drop constraint "public_price_currenyId_fkey";

alter table "public"."product_variant_manufacturer" drop constraint "public_product_variant_manufacturer_currency_fkey";

alter table "public"."currency" alter column "iso" set default ''::text;

alter table "public"."currency" alter column "name" set default ''::text;

alter table "public"."currency" alter column "symbol" set default ''::text;

alter table "public"."price" drop column "curreny";

alter table "public"."product_variant_manufacturer" drop column "currency";

create policy "Allow read only for authenticated users"
on "public"."account"
as permissive
for select
to authenticated
using (true);


create policy "Allow update only for authenticated users"
on "public"."account"
as permissive
for update
to authenticated
using (true);


create policy "Enable read for authenticated users only"
on "public"."product"
as permissive
for select
to authenticated
using (true);


create policy "Enable insert for authenticated users only"
on "public"."account"
as permissive
for insert
to authenticated
with check (true);


create policy "Enable insert for authenticated users only"
on "public"."product"
as permissive
for insert
to authenticated
with check (true);


create policy "Public Profile are viewable by everyone."
on "public"."profile"
as permissive
for select
to public
using ((auth.uid() = id));


create policy "Users can insert their own profile."
on "public"."profile"
as permissive
for insert
to public
with check ((auth.uid() = id));


create policy "Users can update own profile."
on "public"."profile"
as permissive
for update
to public
using ((auth.uid() = id));



