drop policy "Allow read only for authenticated users" on "public"."Account";

drop policy "Allow update only for authenticated users" on "public"."Account";

drop policy "Enable insert for authenticated users only" on "public"."Account";

drop policy "allow for authenticated" on "public"."Contact";

drop policy "permissive for authenticated" on "public"."Post";

drop policy "allow for authenticated" on "public"."Product_Category";

drop policy "Only Superuser can delete profiles." on "public"."Profile";

drop policy "Public Profile are viewable by everyone." on "public"."Profile";

drop policy "Users can insert their own profile." on "public"."Profile";

drop policy "Users can update own profile." on "public"."Profile";

revoke delete on table "public"."Account" from "anon";

revoke insert on table "public"."Account" from "anon";

revoke references on table "public"."Account" from "anon";

revoke select on table "public"."Account" from "anon";

revoke trigger on table "public"."Account" from "anon";

revoke truncate on table "public"."Account" from "anon";

revoke update on table "public"."Account" from "anon";

revoke delete on table "public"."Account" from "authenticated";

revoke insert on table "public"."Account" from "authenticated";

revoke references on table "public"."Account" from "authenticated";

revoke select on table "public"."Account" from "authenticated";

revoke trigger on table "public"."Account" from "authenticated";

revoke truncate on table "public"."Account" from "authenticated";

revoke update on table "public"."Account" from "authenticated";

revoke delete on table "public"."Account" from "service_role";

revoke insert on table "public"."Account" from "service_role";

revoke references on table "public"."Account" from "service_role";

revoke select on table "public"."Account" from "service_role";

revoke trigger on table "public"."Account" from "service_role";

revoke truncate on table "public"."Account" from "service_role";

revoke update on table "public"."Account" from "service_role";

revoke delete on table "public"."Contact" from "anon";

revoke insert on table "public"."Contact" from "anon";

revoke references on table "public"."Contact" from "anon";

revoke select on table "public"."Contact" from "anon";

revoke trigger on table "public"."Contact" from "anon";

revoke truncate on table "public"."Contact" from "anon";

revoke update on table "public"."Contact" from "anon";

revoke delete on table "public"."Contact" from "authenticated";

revoke insert on table "public"."Contact" from "authenticated";

revoke references on table "public"."Contact" from "authenticated";

revoke select on table "public"."Contact" from "authenticated";

revoke trigger on table "public"."Contact" from "authenticated";

revoke truncate on table "public"."Contact" from "authenticated";

revoke update on table "public"."Contact" from "authenticated";

revoke delete on table "public"."Contact" from "service_role";

revoke insert on table "public"."Contact" from "service_role";

revoke references on table "public"."Contact" from "service_role";

revoke select on table "public"."Contact" from "service_role";

revoke trigger on table "public"."Contact" from "service_role";

revoke truncate on table "public"."Contact" from "service_role";

revoke update on table "public"."Contact" from "service_role";

revoke delete on table "public"."Post" from "anon";

revoke insert on table "public"."Post" from "anon";

revoke references on table "public"."Post" from "anon";

revoke select on table "public"."Post" from "anon";

revoke trigger on table "public"."Post" from "anon";

revoke truncate on table "public"."Post" from "anon";

revoke update on table "public"."Post" from "anon";

revoke delete on table "public"."Post" from "authenticated";

revoke insert on table "public"."Post" from "authenticated";

revoke references on table "public"."Post" from "authenticated";

revoke select on table "public"."Post" from "authenticated";

revoke trigger on table "public"."Post" from "authenticated";

revoke truncate on table "public"."Post" from "authenticated";

revoke update on table "public"."Post" from "authenticated";

revoke delete on table "public"."Post" from "service_role";

revoke insert on table "public"."Post" from "service_role";

revoke references on table "public"."Post" from "service_role";

revoke select on table "public"."Post" from "service_role";

revoke trigger on table "public"."Post" from "service_role";

revoke truncate on table "public"."Post" from "service_role";

revoke update on table "public"."Post" from "service_role";

revoke delete on table "public"."Product_Category" from "anon";

revoke insert on table "public"."Product_Category" from "anon";

revoke references on table "public"."Product_Category" from "anon";

revoke select on table "public"."Product_Category" from "anon";

revoke trigger on table "public"."Product_Category" from "anon";

revoke truncate on table "public"."Product_Category" from "anon";

revoke update on table "public"."Product_Category" from "anon";

revoke delete on table "public"."Product_Category" from "authenticated";

revoke insert on table "public"."Product_Category" from "authenticated";

revoke references on table "public"."Product_Category" from "authenticated";

revoke select on table "public"."Product_Category" from "authenticated";

revoke trigger on table "public"."Product_Category" from "authenticated";

revoke truncate on table "public"."Product_Category" from "authenticated";

revoke update on table "public"."Product_Category" from "authenticated";

revoke delete on table "public"."Product_Category" from "service_role";

revoke insert on table "public"."Product_Category" from "service_role";

revoke references on table "public"."Product_Category" from "service_role";

revoke select on table "public"."Product_Category" from "service_role";

revoke trigger on table "public"."Product_Category" from "service_role";

revoke truncate on table "public"."Product_Category" from "service_role";

revoke update on table "public"."Product_Category" from "service_role";

revoke delete on table "public"."Profile" from "anon";

revoke insert on table "public"."Profile" from "anon";

revoke references on table "public"."Profile" from "anon";

revoke select on table "public"."Profile" from "anon";

revoke trigger on table "public"."Profile" from "anon";

revoke truncate on table "public"."Profile" from "anon";

revoke update on table "public"."Profile" from "anon";

revoke delete on table "public"."Profile" from "authenticated";

revoke insert on table "public"."Profile" from "authenticated";

revoke references on table "public"."Profile" from "authenticated";

revoke select on table "public"."Profile" from "authenticated";

revoke trigger on table "public"."Profile" from "authenticated";

revoke truncate on table "public"."Profile" from "authenticated";

revoke update on table "public"."Profile" from "authenticated";

revoke delete on table "public"."Profile" from "service_role";

revoke insert on table "public"."Profile" from "service_role";

revoke references on table "public"."Profile" from "service_role";

revoke select on table "public"."Profile" from "service_role";

revoke trigger on table "public"."Profile" from "service_role";

revoke truncate on table "public"."Profile" from "service_role";

revoke update on table "public"."Profile" from "service_role";

alter table "public"."Account" drop constraint "public_Account_country_fkey";

alter table "public"."Post" drop constraint "Post_accountId_fkey";

alter table "public"."Product_Category" drop constraint "Product_Category_name_key";

alter table "public"."Profile" drop constraint "public_Profile_id_fkey";

alter table "public"."account_contact" drop constraint "public_account_contact_account_id_fkey";

alter table "public"."account_contact" drop constraint "public_account_contact_contact_id_fkey";

alter table "public"."product" drop constraint "public_Product_category_fkey";

alter table "public"."product_variant_manufacturer" drop constraint "public_product_variant_manufacturer_manufacturer_id_fkey";

alter table "public"."Account" drop constraint "Account_pkey";

alter table "public"."Contact" drop constraint "Contact_pkey";

alter table "public"."Post" drop constraint "Post_pkey";

alter table "public"."Product_Category" drop constraint "Product_Category_pkey";

alter table "public"."Profile" drop constraint "profiles_pkey";

drop index if exists "public"."Account_email_key";

drop index if exists "public"."Account_pkey";

drop index if exists "public"."Contact_email_key";

drop index if exists "public"."Contact_pkey";

drop index if exists "public"."Post_pkey";

drop index if exists "public"."Product_Category_name_key";

drop index if exists "public"."Product_Category_pkey";

drop index if exists "public"."profiles_pkey";

drop table "public"."Account";

drop table "public"."Contact";

drop table "public"."Post";

drop table "public"."Product_Category";

drop table "public"."Profile";

create table "public"."account" (
    "id" integer not null default nextval('"Account_id_seq"'::regclass),
    "name" text not null,
    "country" smallint not null default '25'::smallint,
    "email" text not null,
    "website" text,
    "description" text,
    "accepted_currencies" "Currency"[]
);


alter table "public"."account" enable row level security;

create table "public"."contact" (
    "id" integer not null default nextval('"Contact_id_seq"'::regclass),
    "email" character varying(255) not null,
    "firstName" text,
    "lastname" text not null,
    "personality" text
);


alter table "public"."contact" enable row level security;

create table "public"."post" (
    "id" integer not null default nextval('"Post_id_seq"'::regclass),
    "message" text not null,
    "accountId" integer
);


alter table "public"."post" enable row level security;

create table "public"."product_category" (
    "id" bigint generated by default as identity not null,
    "name" character varying not null,
    "colour_hex" character varying,
    "abbr" text
);


alter table "public"."product_category" enable row level security;

create table "public"."profile" (
    "id" uuid not null,
    "firstname" text,
    "lastname" text,
    "avatar_url" text
);


alter table "public"."profile" enable row level security;

alter sequence "public"."Account_id_seq" owned by "public"."account"."id";

alter sequence "public"."Contact_id_seq" owned by "public"."contact"."id";

alter sequence "public"."Post_id_seq" owned by "public"."post"."id";

CREATE UNIQUE INDEX "Account_email_key" ON public.account USING btree (email);

CREATE UNIQUE INDEX "Account_pkey" ON public.account USING btree (id);

CREATE UNIQUE INDEX "Contact_email_key" ON public.contact USING btree (email);

CREATE UNIQUE INDEX "Contact_pkey" ON public.contact USING btree (id);

CREATE UNIQUE INDEX "Post_pkey" ON public.post USING btree (id);

CREATE UNIQUE INDEX "Product_Category_name_key" ON public.product_category USING btree (name);

CREATE UNIQUE INDEX "Product_Category_pkey" ON public.product_category USING btree (id);

CREATE UNIQUE INDEX profiles_pkey ON public.profile USING btree (id);

alter table "public"."account" add constraint "Account_pkey" PRIMARY KEY using index "Account_pkey";

alter table "public"."contact" add constraint "Contact_pkey" PRIMARY KEY using index "Contact_pkey";

alter table "public"."post" add constraint "Post_pkey" PRIMARY KEY using index "Post_pkey";

alter table "public"."product_category" add constraint "Product_Category_pkey" PRIMARY KEY using index "Product_Category_pkey";

alter table "public"."profile" add constraint "profiles_pkey" PRIMARY KEY using index "profiles_pkey";

alter table "public"."account" add constraint "public_Account_country_fkey" FOREIGN KEY (country) REFERENCES country(id) ON UPDATE CASCADE not valid;

alter table "public"."account" validate constraint "public_Account_country_fkey";

alter table "public"."post" add constraint "Post_accountId_fkey" FOREIGN KEY ("accountId") REFERENCES account(id) ON UPDATE CASCADE ON DELETE SET NULL not valid;

alter table "public"."post" validate constraint "Post_accountId_fkey";

alter table "public"."product_category" add constraint "Product_Category_name_key" UNIQUE using index "Product_Category_name_key";

alter table "public"."profile" add constraint "public_Profile_id_fkey" FOREIGN KEY (id) REFERENCES auth.users(id) ON DELETE CASCADE not valid;

alter table "public"."profile" validate constraint "public_Profile_id_fkey";

alter table "public"."account_contact" add constraint "public_account_contact_account_id_fkey" FOREIGN KEY (account_id) REFERENCES account(id) ON UPDATE CASCADE ON DELETE SET NULL not valid;

alter table "public"."account_contact" validate constraint "public_account_contact_account_id_fkey";

alter table "public"."account_contact" add constraint "public_account_contact_contact_id_fkey" FOREIGN KEY (contact_id) REFERENCES contact(id) ON UPDATE CASCADE ON DELETE SET DEFAULT not valid;

alter table "public"."account_contact" validate constraint "public_account_contact_contact_id_fkey";

alter table "public"."product" add constraint "public_Product_category_fkey" FOREIGN KEY (category) REFERENCES product_category(id) ON UPDATE CASCADE not valid;

alter table "public"."product" validate constraint "public_Product_category_fkey";

alter table "public"."product_variant_manufacturer" add constraint "public_product_variant_manufacturer_manufacturer_id_fkey" FOREIGN KEY (manufacturer_id) REFERENCES account(id) not valid;

alter table "public"."product_variant_manufacturer" validate constraint "public_product_variant_manufacturer_manufacturer_id_fkey";

grant delete on table "public"."account" to "anon";

grant insert on table "public"."account" to "anon";

grant references on table "public"."account" to "anon";

grant select on table "public"."account" to "anon";

grant trigger on table "public"."account" to "anon";

grant truncate on table "public"."account" to "anon";

grant update on table "public"."account" to "anon";

grant delete on table "public"."account" to "authenticated";

grant insert on table "public"."account" to "authenticated";

grant references on table "public"."account" to "authenticated";

grant select on table "public"."account" to "authenticated";

grant trigger on table "public"."account" to "authenticated";

grant truncate on table "public"."account" to "authenticated";

grant update on table "public"."account" to "authenticated";

grant delete on table "public"."account" to "service_role";

grant insert on table "public"."account" to "service_role";

grant references on table "public"."account" to "service_role";

grant select on table "public"."account" to "service_role";

grant trigger on table "public"."account" to "service_role";

grant truncate on table "public"."account" to "service_role";

grant update on table "public"."account" to "service_role";

grant delete on table "public"."contact" to "anon";

grant insert on table "public"."contact" to "anon";

grant references on table "public"."contact" to "anon";

grant select on table "public"."contact" to "anon";

grant trigger on table "public"."contact" to "anon";

grant truncate on table "public"."contact" to "anon";

grant update on table "public"."contact" to "anon";

grant delete on table "public"."contact" to "authenticated";

grant insert on table "public"."contact" to "authenticated";

grant references on table "public"."contact" to "authenticated";

grant select on table "public"."contact" to "authenticated";

grant trigger on table "public"."contact" to "authenticated";

grant truncate on table "public"."contact" to "authenticated";

grant update on table "public"."contact" to "authenticated";

grant delete on table "public"."contact" to "service_role";

grant insert on table "public"."contact" to "service_role";

grant references on table "public"."contact" to "service_role";

grant select on table "public"."contact" to "service_role";

grant trigger on table "public"."contact" to "service_role";

grant truncate on table "public"."contact" to "service_role";

grant update on table "public"."contact" to "service_role";

grant delete on table "public"."post" to "anon";

grant insert on table "public"."post" to "anon";

grant references on table "public"."post" to "anon";

grant select on table "public"."post" to "anon";

grant trigger on table "public"."post" to "anon";

grant truncate on table "public"."post" to "anon";

grant update on table "public"."post" to "anon";

grant delete on table "public"."post" to "authenticated";

grant insert on table "public"."post" to "authenticated";

grant references on table "public"."post" to "authenticated";

grant select on table "public"."post" to "authenticated";

grant trigger on table "public"."post" to "authenticated";

grant truncate on table "public"."post" to "authenticated";

grant update on table "public"."post" to "authenticated";

grant delete on table "public"."post" to "service_role";

grant insert on table "public"."post" to "service_role";

grant references on table "public"."post" to "service_role";

grant select on table "public"."post" to "service_role";

grant trigger on table "public"."post" to "service_role";

grant truncate on table "public"."post" to "service_role";

grant update on table "public"."post" to "service_role";

grant delete on table "public"."product_category" to "anon";

grant insert on table "public"."product_category" to "anon";

grant references on table "public"."product_category" to "anon";

grant select on table "public"."product_category" to "anon";

grant trigger on table "public"."product_category" to "anon";

grant truncate on table "public"."product_category" to "anon";

grant update on table "public"."product_category" to "anon";

grant delete on table "public"."product_category" to "authenticated";

grant insert on table "public"."product_category" to "authenticated";

grant references on table "public"."product_category" to "authenticated";

grant select on table "public"."product_category" to "authenticated";

grant trigger on table "public"."product_category" to "authenticated";

grant truncate on table "public"."product_category" to "authenticated";

grant update on table "public"."product_category" to "authenticated";

grant delete on table "public"."product_category" to "service_role";

grant insert on table "public"."product_category" to "service_role";

grant references on table "public"."product_category" to "service_role";

grant select on table "public"."product_category" to "service_role";

grant trigger on table "public"."product_category" to "service_role";

grant truncate on table "public"."product_category" to "service_role";

grant update on table "public"."product_category" to "service_role";

grant delete on table "public"."profile" to "anon";

grant insert on table "public"."profile" to "anon";

grant references on table "public"."profile" to "anon";

grant select on table "public"."profile" to "anon";

grant trigger on table "public"."profile" to "anon";

grant truncate on table "public"."profile" to "anon";

grant update on table "public"."profile" to "anon";

grant delete on table "public"."profile" to "authenticated";

grant insert on table "public"."profile" to "authenticated";

grant references on table "public"."profile" to "authenticated";

grant select on table "public"."profile" to "authenticated";

grant trigger on table "public"."profile" to "authenticated";

grant truncate on table "public"."profile" to "authenticated";

grant update on table "public"."profile" to "authenticated";

grant delete on table "public"."profile" to "service_role";

grant insert on table "public"."profile" to "service_role";

grant references on table "public"."profile" to "service_role";

grant select on table "public"."profile" to "service_role";

grant trigger on table "public"."profile" to "service_role";

grant truncate on table "public"."profile" to "service_role";

grant update on table "public"."profile" to "service_role";

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


create policy "Enable insert for authenticated users only"
on "public"."account"
as permissive
for insert
to authenticated
with check (true);


create policy "allow for authenticated"
on "public"."contact"
as permissive
for all
to public
using (true);


create policy "permissive for authenticated"
on "public"."post"
as permissive
for all
to authenticated
using (true);


create policy "allow for authenticated"
on "public"."product_category"
as permissive
for select
to public
using (true);


create policy "Only Superuser can delete profiles."
on "public"."profile"
as permissive
for delete
to public
using (false);


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



