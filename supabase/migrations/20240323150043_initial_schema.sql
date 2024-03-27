create type "public"."Country" as enum ('CH', 'CN', 'DE', 'US', 'GB');

create type "public"."Currency" as enum ('USD', 'RMB', 'Euro', 'CHF', 'GBP');

create sequence "public"."Account_id_seq";

create sequence "public"."Contact_id_seq";

create sequence "public"."Post_id_seq";

create sequence "public"."Product_id_seq";

create table "public"."Account" (
    "id" integer not null default nextval('"Account_id_seq"'::regclass),
    "name" character varying(255) not null,
    "country" character varying(255) not null,
    "email" character varying(255),
    "website" character varying(255),
    "description" character varying,
    "accepted_currencies" "Currency"[]
);


alter table "public"."Account" enable row level security;

create table "public"."Contact" (
    "id" integer not null default nextval('"Contact_id_seq"'::regclass),
    "email" character varying(255) not null,
    "accountId" integer,
    "account_id" integer not null
);


create table "public"."Post" (
    "id" integer not null default nextval('"Post_id_seq"'::regclass),
    "message" text not null,
    "accountId" integer
);


create table "public"."Product" (
    "id" integer not null default nextval('"Product_id_seq"'::regclass),
    "name" character varying(255) not null,
    "description" character varying
);


alter sequence "public"."Account_id_seq" owned by "public"."Account"."id";

alter sequence "public"."Contact_id_seq" owned by "public"."Contact"."id";

alter sequence "public"."Post_id_seq" owned by "public"."Post"."id";

alter sequence "public"."Product_id_seq" owned by "public"."Product"."id";

CREATE UNIQUE INDEX "Account_email_key" ON public."Account" USING btree (email);

CREATE UNIQUE INDEX "Account_pkey" ON public."Account" USING btree (id);

CREATE UNIQUE INDEX "Contact_email_key" ON public."Contact" USING btree (email);

CREATE UNIQUE INDEX "Contact_pkey" ON public."Contact" USING btree (id);

CREATE UNIQUE INDEX "Post_pkey" ON public."Post" USING btree (id);

CREATE UNIQUE INDEX "Product_pkey" ON public."Product" USING btree (id);

alter table "public"."Account" add constraint "Account_pkey" PRIMARY KEY using index "Account_pkey";

alter table "public"."Contact" add constraint "Contact_pkey" PRIMARY KEY using index "Contact_pkey";

alter table "public"."Post" add constraint "Post_pkey" PRIMARY KEY using index "Post_pkey";

alter table "public"."Product" add constraint "Product_pkey" PRIMARY KEY using index "Product_pkey";

alter table "public"."Contact" add constraint "Contact_account_id_fkey" FOREIGN KEY (account_id) REFERENCES "Account"(id) ON UPDATE CASCADE ON DELETE RESTRICT not valid;

alter table "public"."Contact" validate constraint "Contact_account_id_fkey";

alter table "public"."Post" add constraint "Post_accountId_fkey" FOREIGN KEY ("accountId") REFERENCES "Account"(id) ON UPDATE CASCADE ON DELETE SET NULL not valid;

alter table "public"."Post" validate constraint "Post_accountId_fkey";

grant delete on table "public"."Account" to "anon";

grant insert on table "public"."Account" to "anon";

grant references on table "public"."Account" to "anon";

grant select on table "public"."Account" to "anon";

grant trigger on table "public"."Account" to "anon";

grant truncate on table "public"."Account" to "anon";

grant update on table "public"."Account" to "anon";

grant delete on table "public"."Account" to "authenticated";

grant insert on table "public"."Account" to "authenticated";

grant references on table "public"."Account" to "authenticated";

grant select on table "public"."Account" to "authenticated";

grant trigger on table "public"."Account" to "authenticated";

grant truncate on table "public"."Account" to "authenticated";

grant update on table "public"."Account" to "authenticated";

grant delete on table "public"."Account" to "service_role";

grant insert on table "public"."Account" to "service_role";

grant references on table "public"."Account" to "service_role";

grant select on table "public"."Account" to "service_role";

grant trigger on table "public"."Account" to "service_role";

grant truncate on table "public"."Account" to "service_role";

grant update on table "public"."Account" to "service_role";

grant delete on table "public"."Contact" to "anon";

grant insert on table "public"."Contact" to "anon";

grant references on table "public"."Contact" to "anon";

grant select on table "public"."Contact" to "anon";

grant trigger on table "public"."Contact" to "anon";

grant truncate on table "public"."Contact" to "anon";

grant update on table "public"."Contact" to "anon";

grant delete on table "public"."Contact" to "authenticated";

grant insert on table "public"."Contact" to "authenticated";

grant references on table "public"."Contact" to "authenticated";

grant select on table "public"."Contact" to "authenticated";

grant trigger on table "public"."Contact" to "authenticated";

grant truncate on table "public"."Contact" to "authenticated";

grant update on table "public"."Contact" to "authenticated";

grant delete on table "public"."Contact" to "service_role";

grant insert on table "public"."Contact" to "service_role";

grant references on table "public"."Contact" to "service_role";

grant select on table "public"."Contact" to "service_role";

grant trigger on table "public"."Contact" to "service_role";

grant truncate on table "public"."Contact" to "service_role";

grant update on table "public"."Contact" to "service_role";

grant delete on table "public"."Post" to "anon";

grant insert on table "public"."Post" to "anon";

grant references on table "public"."Post" to "anon";

grant select on table "public"."Post" to "anon";

grant trigger on table "public"."Post" to "anon";

grant truncate on table "public"."Post" to "anon";

grant update on table "public"."Post" to "anon";

grant delete on table "public"."Post" to "authenticated";

grant insert on table "public"."Post" to "authenticated";

grant references on table "public"."Post" to "authenticated";

grant select on table "public"."Post" to "authenticated";

grant trigger on table "public"."Post" to "authenticated";

grant truncate on table "public"."Post" to "authenticated";

grant update on table "public"."Post" to "authenticated";

grant delete on table "public"."Post" to "service_role";

grant insert on table "public"."Post" to "service_role";

grant references on table "public"."Post" to "service_role";

grant select on table "public"."Post" to "service_role";

grant trigger on table "public"."Post" to "service_role";

grant truncate on table "public"."Post" to "service_role";

grant update on table "public"."Post" to "service_role";

grant delete on table "public"."Product" to "anon";

grant insert on table "public"."Product" to "anon";

grant references on table "public"."Product" to "anon";

grant select on table "public"."Product" to "anon";

grant trigger on table "public"."Product" to "anon";

grant truncate on table "public"."Product" to "anon";

grant update on table "public"."Product" to "anon";

grant delete on table "public"."Product" to "authenticated";

grant insert on table "public"."Product" to "authenticated";

grant references on table "public"."Product" to "authenticated";

grant select on table "public"."Product" to "authenticated";

grant trigger on table "public"."Product" to "authenticated";

grant truncate on table "public"."Product" to "authenticated";

grant update on table "public"."Product" to "authenticated";

grant delete on table "public"."Product" to "service_role";

grant insert on table "public"."Product" to "service_role";

grant references on table "public"."Product" to "service_role";

grant select on table "public"."Product" to "service_role";

grant trigger on table "public"."Product" to "service_role";

grant truncate on table "public"."Product" to "service_role";

grant update on table "public"."Product" to "service_role";

create policy "Enable insert for authenticated users only"
on "public"."Account"
as permissive
for insert
to authenticated
with check (true);



