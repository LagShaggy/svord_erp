create table "public"."Profile" (
    "id" uuid not null,
    "firstname" text,
    "lastname" text,
    "avatar_url" text
);


CREATE UNIQUE INDEX profiles_pkey ON public."Profile" USING btree (id);

alter table "public"."Profile" add constraint "profiles_pkey" PRIMARY KEY using index "profiles_pkey";

alter table "public"."Profile" add constraint "profiles_id_fkey" FOREIGN KEY (id) REFERENCES auth.users(id) not valid;

alter table "public"."Profile" validate constraint "profiles_id_fkey";

grant delete on table "public"."Profile" to "anon";

grant insert on table "public"."Profile" to "anon";

grant references on table "public"."Profile" to "anon";

grant select on table "public"."Profile" to "anon";

grant trigger on table "public"."Profile" to "anon";

grant truncate on table "public"."Profile" to "anon";

grant update on table "public"."Profile" to "anon";

grant delete on table "public"."Profile" to "authenticated";

grant insert on table "public"."Profile" to "authenticated";

grant references on table "public"."Profile" to "authenticated";

grant select on table "public"."Profile" to "authenticated";

grant trigger on table "public"."Profile" to "authenticated";

grant truncate on table "public"."Profile" to "authenticated";

grant update on table "public"."Profile" to "authenticated";

grant delete on table "public"."Profile" to "service_role";

grant insert on table "public"."Profile" to "service_role";

grant references on table "public"."Profile" to "service_role";

grant select on table "public"."Profile" to "service_role";

grant trigger on table "public"."Profile" to "service_role";

grant truncate on table "public"."Profile" to "service_role";

grant update on table "public"."Profile" to "service_role";


