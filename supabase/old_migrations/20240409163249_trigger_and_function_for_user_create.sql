alter table "public"."Profile" drop constraint "profiles_id_fkey";

alter table "public"."Profile" enable row level security;

alter table "public"."Profile" add constraint "public_Profile_id_fkey" FOREIGN KEY (id) REFERENCES auth.users(id) ON DELETE CASCADE not valid;

alter table "public"."Profile" validate constraint "public_Profile_id_fkey";

set check_function_bodies = off;

CREATE OR REPLACE FUNCTION public.handle_new_user()
 RETURNS trigger
 LANGUAGE plpgsql
 SECURITY DEFINER
 SET search_path TO 'public'
AS $function$
begin
  insert into public."Profile" (id)
  values (new.id);
  return new;
end;
$function$
;

create policy "Only Superuser can delete profiles."
on "public"."Profile"
as permissive
for delete
to public
using (false);


create policy "Public Profile are viewable by everyone."
on "public"."Profile"
as permissive
for select
to public
using (true);


create policy "Users can insert their own profile."
on "public"."Profile"
as permissive
for insert
to public
with check ((auth.uid() = id));


create policy "Users can update own profile."
on "public"."Profile"
as permissive
for update
to public
using ((auth.uid() = id));



