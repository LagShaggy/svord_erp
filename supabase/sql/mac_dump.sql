
SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

CREATE SCHEMA IF NOT EXISTS "auth";

ALTER SCHEMA "auth" OWNER TO "supabase_admin";

CREATE SCHEMA IF NOT EXISTS "public";

ALTER SCHEMA "public" OWNER TO "pg_database_owner";

COMMENT ON SCHEMA "public" IS 'standard public schema';

CREATE SCHEMA IF NOT EXISTS "storage";

ALTER SCHEMA "storage" OWNER TO "supabase_admin";

CREATE TYPE "auth"."aal_level" AS ENUM (
    'aal1',
    'aal2',
    'aal3'
);

ALTER TYPE "auth"."aal_level" OWNER TO "supabase_auth_admin";

CREATE TYPE "auth"."code_challenge_method" AS ENUM (
    's256',
    'plain'
);

ALTER TYPE "auth"."code_challenge_method" OWNER TO "supabase_auth_admin";

CREATE TYPE "auth"."factor_status" AS ENUM (
    'unverified',
    'verified'
);

ALTER TYPE "auth"."factor_status" OWNER TO "supabase_auth_admin";

CREATE TYPE "auth"."factor_type" AS ENUM (
    'totp',
    'webauthn'
);

ALTER TYPE "auth"."factor_type" OWNER TO "supabase_auth_admin";

CREATE TYPE "public"."Country" AS ENUM (
    'CH',
    'CN',
    'DE',
    'US',
    'GB'
);

ALTER TYPE "public"."Country" OWNER TO "postgres";

CREATE TYPE "public"."Currency" AS ENUM (
    'USD',
    'RMB',
    'Euro',
    'CHF',
    'GBP'
);

ALTER TYPE "public"."Currency" OWNER TO "postgres";

CREATE OR REPLACE FUNCTION "auth"."email"() RETURNS "text"
    LANGUAGE "sql" STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.email', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'email')
  )::text
$$;

ALTER FUNCTION "auth"."email"() OWNER TO "supabase_auth_admin";

COMMENT ON FUNCTION "auth"."email"() IS 'Deprecated. Use auth.jwt() -> ''email'' instead.';

CREATE OR REPLACE FUNCTION "auth"."jwt"() RETURNS "jsonb"
    LANGUAGE "sql" STABLE
    AS $$
  select 
    coalesce(
        nullif(current_setting('request.jwt.claim', true), ''),
        nullif(current_setting('request.jwt.claims', true), '')
    )::jsonb
$$;

ALTER FUNCTION "auth"."jwt"() OWNER TO "supabase_auth_admin";

CREATE OR REPLACE FUNCTION "auth"."role"() RETURNS "text"
    LANGUAGE "sql" STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.role', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'role')
  )::text
$$;

ALTER FUNCTION "auth"."role"() OWNER TO "supabase_auth_admin";

COMMENT ON FUNCTION "auth"."role"() IS 'Deprecated. Use auth.jwt() -> ''role'' instead.';

CREATE OR REPLACE FUNCTION "auth"."uid"() RETURNS "uuid"
    LANGUAGE "sql" STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.sub', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'sub')
  )::uuid
$$;

ALTER FUNCTION "auth"."uid"() OWNER TO "supabase_auth_admin";

COMMENT ON FUNCTION "auth"."uid"() IS 'Deprecated. Use auth.jwt() -> ''sub'' instead.';

CREATE OR REPLACE FUNCTION "public"."handle_new_user"() RETURNS "trigger"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
begin
  insert into public."Profile" (id)
  values (new.id);
  return new;
end;
$$;

ALTER FUNCTION "public"."handle_new_user"() OWNER TO "postgres";

CREATE OR REPLACE FUNCTION "storage"."can_insert_object"("bucketid" "text", "name" "text", "owner" "uuid", "metadata" "jsonb") RETURNS "void"
    LANGUAGE "plpgsql"
    AS $$
BEGIN
  INSERT INTO "storage"."objects" ("bucket_id", "name", "owner", "metadata") VALUES (bucketid, name, owner, metadata);
  -- hack to rollback the successful insert
  RAISE sqlstate 'PT200' using
  message = 'ROLLBACK',
  detail = 'rollback successful insert';
END
$$;

ALTER FUNCTION "storage"."can_insert_object"("bucketid" "text", "name" "text", "owner" "uuid", "metadata" "jsonb") OWNER TO "supabase_storage_admin";

CREATE OR REPLACE FUNCTION "storage"."extension"("name" "text") RETURNS "text"
    LANGUAGE "plpgsql"
    AS $$
DECLARE
_parts text[];
_filename text;
BEGIN
    select string_to_array(name, '/') into _parts;
    select _parts[array_length(_parts,1)] into _filename;
    -- @todo return the last part instead of 2
    return split_part(_filename, '.', 2);
END
$$;

ALTER FUNCTION "storage"."extension"("name" "text") OWNER TO "supabase_storage_admin";

CREATE OR REPLACE FUNCTION "storage"."filename"("name" "text") RETURNS "text"
    LANGUAGE "plpgsql"
    AS $$
DECLARE
_parts text[];
BEGIN
    select string_to_array(name, '/') into _parts;
    return _parts[array_length(_parts,1)];
END
$$;

ALTER FUNCTION "storage"."filename"("name" "text") OWNER TO "supabase_storage_admin";

CREATE OR REPLACE FUNCTION "storage"."foldername"("name" "text") RETURNS "text"[]
    LANGUAGE "plpgsql"
    AS $$
DECLARE
_parts text[];
BEGIN
    select string_to_array(name, '/') into _parts;
    return _parts[1:array_length(_parts,1)-1];
END
$$;

ALTER FUNCTION "storage"."foldername"("name" "text") OWNER TO "supabase_storage_admin";

CREATE OR REPLACE FUNCTION "storage"."get_size_by_bucket"() RETURNS TABLE("size" bigint, "bucket_id" "text")
    LANGUAGE "plpgsql"
    AS $$
BEGIN
    return query
        select sum((metadata->>'size')::int) as size, obj.bucket_id
        from "storage".objects as obj
        group by obj.bucket_id;
END
$$;

ALTER FUNCTION "storage"."get_size_by_bucket"() OWNER TO "supabase_storage_admin";

CREATE OR REPLACE FUNCTION "storage"."search"("prefix" "text", "bucketname" "text", "limits" integer DEFAULT 100, "levels" integer DEFAULT 1, "offsets" integer DEFAULT 0, "search" "text" DEFAULT ''::"text", "sortcolumn" "text" DEFAULT 'name'::"text", "sortorder" "text" DEFAULT 'asc'::"text") RETURNS TABLE("name" "text", "id" "uuid", "updated_at" timestamp with time zone, "created_at" timestamp with time zone, "last_accessed_at" timestamp with time zone, "metadata" "jsonb")
    LANGUAGE "plpgsql" STABLE
    AS $_$
declare
  v_order_by text;
  v_sort_order text;
begin
  case
    when sortcolumn = 'name' then
      v_order_by = 'name';
    when sortcolumn = 'updated_at' then
      v_order_by = 'updated_at';
    when sortcolumn = 'created_at' then
      v_order_by = 'created_at';
    when sortcolumn = 'last_accessed_at' then
      v_order_by = 'last_accessed_at';
    else
      v_order_by = 'name';
  end case;

  case
    when sortorder = 'asc' then
      v_sort_order = 'asc';
    when sortorder = 'desc' then
      v_sort_order = 'desc';
    else
      v_sort_order = 'asc';
  end case;

  v_order_by = v_order_by || ' ' || v_sort_order;

  return query execute
    'with folders as (
       select path_tokens[$1] as folder
       from storage.objects
         where objects.name ilike $2 || $3 || ''%''
           and bucket_id = $4
           and array_length(regexp_split_to_array(objects.name, ''/''), 1) <> $1
       group by folder
       order by folder ' || v_sort_order || '
     )
     (select folder as "name",
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[$1] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where objects.name ilike $2 || $3 || ''%''
       and bucket_id = $4
       and array_length(regexp_split_to_array(objects.name, ''/''), 1) = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;

ALTER FUNCTION "storage"."search"("prefix" "text", "bucketname" "text", "limits" integer, "levels" integer, "offsets" integer, "search" "text", "sortcolumn" "text", "sortorder" "text") OWNER TO "supabase_storage_admin";

CREATE OR REPLACE FUNCTION "storage"."update_updated_at_column"() RETURNS "trigger"
    LANGUAGE "plpgsql"
    AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW; 
END;
$$;

ALTER FUNCTION "storage"."update_updated_at_column"() OWNER TO "supabase_storage_admin";

SET default_tablespace = '';

SET default_table_access_method = "heap";

CREATE TABLE IF NOT EXISTS "auth"."audit_log_entries" (
    "instance_id" "uuid",
    "id" "uuid" NOT NULL,
    "payload" "json",
    "created_at" timestamp with time zone,
    "ip_address" character varying(64) DEFAULT ''::character varying NOT NULL
);

ALTER TABLE "auth"."audit_log_entries" OWNER TO "supabase_auth_admin";

COMMENT ON TABLE "auth"."audit_log_entries" IS 'Auth: Audit trail for user actions.';

CREATE TABLE IF NOT EXISTS "auth"."flow_state" (
    "id" "uuid" NOT NULL,
    "user_id" "uuid",
    "auth_code" "text" NOT NULL,
    "code_challenge_method" "auth"."code_challenge_method" NOT NULL,
    "code_challenge" "text" NOT NULL,
    "provider_type" "text" NOT NULL,
    "provider_access_token" "text",
    "provider_refresh_token" "text",
    "created_at" timestamp with time zone,
    "updated_at" timestamp with time zone,
    "authentication_method" "text" NOT NULL,
    "auth_code_issued_at" timestamp with time zone
);

ALTER TABLE "auth"."flow_state" OWNER TO "supabase_auth_admin";

COMMENT ON TABLE "auth"."flow_state" IS 'stores metadata for pkce logins';

CREATE TABLE IF NOT EXISTS "auth"."identities" (
    "provider_id" "text" NOT NULL,
    "user_id" "uuid" NOT NULL,
    "identity_data" "jsonb" NOT NULL,
    "provider" "text" NOT NULL,
    "last_sign_in_at" timestamp with time zone,
    "created_at" timestamp with time zone,
    "updated_at" timestamp with time zone,
    "email" "text" GENERATED ALWAYS AS ("lower"(("identity_data" ->> 'email'::"text"))) STORED,
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL
);

ALTER TABLE "auth"."identities" OWNER TO "supabase_auth_admin";

COMMENT ON TABLE "auth"."identities" IS 'Auth: Stores identities associated to a user.';

COMMENT ON COLUMN "auth"."identities"."email" IS 'Auth: Email is a generated column that references the optional email property in the identity_data';

CREATE TABLE IF NOT EXISTS "auth"."instances" (
    "id" "uuid" NOT NULL,
    "uuid" "uuid",
    "raw_base_config" "text",
    "created_at" timestamp with time zone,
    "updated_at" timestamp with time zone
);

ALTER TABLE "auth"."instances" OWNER TO "supabase_auth_admin";

COMMENT ON TABLE "auth"."instances" IS 'Auth: Manages users across multiple sites.';

CREATE TABLE IF NOT EXISTS "auth"."mfa_amr_claims" (
    "session_id" "uuid" NOT NULL,
    "created_at" timestamp with time zone NOT NULL,
    "updated_at" timestamp with time zone NOT NULL,
    "authentication_method" "text" NOT NULL,
    "id" "uuid" NOT NULL
);

ALTER TABLE "auth"."mfa_amr_claims" OWNER TO "supabase_auth_admin";

COMMENT ON TABLE "auth"."mfa_amr_claims" IS 'auth: stores authenticator method reference claims for multi factor authentication';

CREATE TABLE IF NOT EXISTS "auth"."mfa_challenges" (
    "id" "uuid" NOT NULL,
    "factor_id" "uuid" NOT NULL,
    "created_at" timestamp with time zone NOT NULL,
    "verified_at" timestamp with time zone,
    "ip_address" "inet" NOT NULL
);

ALTER TABLE "auth"."mfa_challenges" OWNER TO "supabase_auth_admin";

COMMENT ON TABLE "auth"."mfa_challenges" IS 'auth: stores metadata about challenge requests made';

CREATE TABLE IF NOT EXISTS "auth"."mfa_factors" (
    "id" "uuid" NOT NULL,
    "user_id" "uuid" NOT NULL,
    "friendly_name" "text",
    "factor_type" "auth"."factor_type" NOT NULL,
    "status" "auth"."factor_status" NOT NULL,
    "created_at" timestamp with time zone NOT NULL,
    "updated_at" timestamp with time zone NOT NULL,
    "secret" "text"
);

ALTER TABLE "auth"."mfa_factors" OWNER TO "supabase_auth_admin";

COMMENT ON TABLE "auth"."mfa_factors" IS 'auth: stores metadata about factors';

CREATE TABLE IF NOT EXISTS "auth"."refresh_tokens" (
    "instance_id" "uuid",
    "id" bigint NOT NULL,
    "token" character varying(255),
    "user_id" character varying(255),
    "revoked" boolean,
    "created_at" timestamp with time zone,
    "updated_at" timestamp with time zone,
    "parent" character varying(255),
    "session_id" "uuid"
);

ALTER TABLE "auth"."refresh_tokens" OWNER TO "supabase_auth_admin";

COMMENT ON TABLE "auth"."refresh_tokens" IS 'Auth: Store of tokens used to refresh JWT tokens once they expire.';

CREATE SEQUENCE IF NOT EXISTS "auth"."refresh_tokens_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE "auth"."refresh_tokens_id_seq" OWNER TO "supabase_auth_admin";

ALTER SEQUENCE "auth"."refresh_tokens_id_seq" OWNED BY "auth"."refresh_tokens"."id";

CREATE TABLE IF NOT EXISTS "auth"."saml_providers" (
    "id" "uuid" NOT NULL,
    "sso_provider_id" "uuid" NOT NULL,
    "entity_id" "text" NOT NULL,
    "metadata_xml" "text" NOT NULL,
    "metadata_url" "text",
    "attribute_mapping" "jsonb",
    "created_at" timestamp with time zone,
    "updated_at" timestamp with time zone,
    "name_id_format" "text",
    CONSTRAINT "entity_id not empty" CHECK (("char_length"("entity_id") > 0)),
    CONSTRAINT "metadata_url not empty" CHECK ((("metadata_url" = NULL::"text") OR ("char_length"("metadata_url") > 0))),
    CONSTRAINT "metadata_xml not empty" CHECK (("char_length"("metadata_xml") > 0))
);

ALTER TABLE "auth"."saml_providers" OWNER TO "supabase_auth_admin";

COMMENT ON TABLE "auth"."saml_providers" IS 'Auth: Manages SAML Identity Provider connections.';

CREATE TABLE IF NOT EXISTS "auth"."saml_relay_states" (
    "id" "uuid" NOT NULL,
    "sso_provider_id" "uuid" NOT NULL,
    "request_id" "text" NOT NULL,
    "for_email" "text",
    "redirect_to" "text",
    "created_at" timestamp with time zone,
    "updated_at" timestamp with time zone,
    "flow_state_id" "uuid",
    CONSTRAINT "request_id not empty" CHECK (("char_length"("request_id") > 0))
);

ALTER TABLE "auth"."saml_relay_states" OWNER TO "supabase_auth_admin";

COMMENT ON TABLE "auth"."saml_relay_states" IS 'Auth: Contains SAML Relay State information for each Service Provider initiated login.';

CREATE TABLE IF NOT EXISTS "auth"."schema_migrations" (
    "version" character varying(255) NOT NULL
);

ALTER TABLE "auth"."schema_migrations" OWNER TO "supabase_auth_admin";

COMMENT ON TABLE "auth"."schema_migrations" IS 'Auth: Manages updates to the auth system.';

CREATE TABLE IF NOT EXISTS "auth"."sessions" (
    "id" "uuid" NOT NULL,
    "user_id" "uuid" NOT NULL,
    "created_at" timestamp with time zone,
    "updated_at" timestamp with time zone,
    "factor_id" "uuid",
    "aal" "auth"."aal_level",
    "not_after" timestamp with time zone,
    "refreshed_at" timestamp without time zone,
    "user_agent" "text",
    "ip" "inet",
    "tag" "text"
);

ALTER TABLE "auth"."sessions" OWNER TO "supabase_auth_admin";

COMMENT ON TABLE "auth"."sessions" IS 'Auth: Stores session data associated to a user.';

COMMENT ON COLUMN "auth"."sessions"."not_after" IS 'Auth: Not after is a nullable column that contains a timestamp after which the session should be regarded as expired.';

CREATE TABLE IF NOT EXISTS "auth"."sso_domains" (
    "id" "uuid" NOT NULL,
    "sso_provider_id" "uuid" NOT NULL,
    "domain" "text" NOT NULL,
    "created_at" timestamp with time zone,
    "updated_at" timestamp with time zone,
    CONSTRAINT "domain not empty" CHECK (("char_length"("domain") > 0))
);

ALTER TABLE "auth"."sso_domains" OWNER TO "supabase_auth_admin";

COMMENT ON TABLE "auth"."sso_domains" IS 'Auth: Manages SSO email address domain mapping to an SSO Identity Provider.';

CREATE TABLE IF NOT EXISTS "auth"."sso_providers" (
    "id" "uuid" NOT NULL,
    "resource_id" "text",
    "created_at" timestamp with time zone,
    "updated_at" timestamp with time zone,
    CONSTRAINT "resource_id not empty" CHECK ((("resource_id" = NULL::"text") OR ("char_length"("resource_id") > 0)))
);

ALTER TABLE "auth"."sso_providers" OWNER TO "supabase_auth_admin";

COMMENT ON TABLE "auth"."sso_providers" IS 'Auth: Manages SSO identity provider information; see saml_providers for SAML.';

COMMENT ON COLUMN "auth"."sso_providers"."resource_id" IS 'Auth: Uniquely identifies a SSO provider according to a user-chosen resource ID (case insensitive), useful in infrastructure as code.';

CREATE TABLE IF NOT EXISTS "auth"."users" (
    "instance_id" "uuid",
    "id" "uuid" NOT NULL,
    "aud" character varying(255),
    "role" character varying(255),
    "email" character varying(255),
    "encrypted_password" character varying(255),
    "email_confirmed_at" timestamp with time zone,
    "invited_at" timestamp with time zone,
    "confirmation_token" character varying(255),
    "confirmation_sent_at" timestamp with time zone,
    "recovery_token" character varying(255),
    "recovery_sent_at" timestamp with time zone,
    "email_change_token_new" character varying(255),
    "email_change" character varying(255),
    "email_change_sent_at" timestamp with time zone,
    "last_sign_in_at" timestamp with time zone,
    "raw_app_meta_data" "jsonb",
    "raw_user_meta_data" "jsonb",
    "is_super_admin" boolean,
    "created_at" timestamp with time zone,
    "updated_at" timestamp with time zone,
    "phone" "text" DEFAULT NULL::character varying,
    "phone_confirmed_at" timestamp with time zone,
    "phone_change" "text" DEFAULT ''::character varying,
    "phone_change_token" character varying(255) DEFAULT ''::character varying,
    "phone_change_sent_at" timestamp with time zone,
    "confirmed_at" timestamp with time zone GENERATED ALWAYS AS (LEAST("email_confirmed_at", "phone_confirmed_at")) STORED,
    "email_change_token_current" character varying(255) DEFAULT ''::character varying,
    "email_change_confirm_status" smallint DEFAULT 0,
    "banned_until" timestamp with time zone,
    "reauthentication_token" character varying(255) DEFAULT ''::character varying,
    "reauthentication_sent_at" timestamp with time zone,
    "is_sso_user" boolean DEFAULT false NOT NULL,
    "deleted_at" timestamp with time zone,
    "is_anonymous" boolean DEFAULT false NOT NULL,
    CONSTRAINT "users_email_change_confirm_status_check" CHECK ((("email_change_confirm_status" >= 0) AND ("email_change_confirm_status" <= 2)))
);

ALTER TABLE "auth"."users" OWNER TO "supabase_auth_admin";

COMMENT ON TABLE "auth"."users" IS 'Auth: Stores user login data within a secure schema.';

COMMENT ON COLUMN "auth"."users"."is_sso_user" IS 'Auth: Set this column to true when the account comes from SSO. These accounts can have duplicate emails.';

CREATE TABLE IF NOT EXISTS "public"."account" (
    "id" integer NOT NULL,
    "name" "text" NOT NULL,
    "country" smallint DEFAULT '25'::smallint NOT NULL,
    "email" "text" NOT NULL,
    "website" "text",
    "description" "text",
    "accepted_currencies" "public"."Currency"[]
);

ALTER TABLE "public"."account" OWNER TO "postgres";

CREATE SEQUENCE IF NOT EXISTS "public"."Account_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE "public"."Account_id_seq" OWNER TO "postgres";

ALTER SEQUENCE "public"."Account_id_seq" OWNED BY "public"."account"."id";

CREATE TABLE IF NOT EXISTS "public"."contact" (
    "id" integer NOT NULL,
    "email" character varying(255) NOT NULL,
    "firstName" "text",
    "lastname" "text" NOT NULL,
    "personality" "text"
);

ALTER TABLE "public"."contact" OWNER TO "postgres";

CREATE SEQUENCE IF NOT EXISTS "public"."Contact_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE "public"."Contact_id_seq" OWNER TO "postgres";

ALTER SEQUENCE "public"."Contact_id_seq" OWNED BY "public"."contact"."id";

CREATE TABLE IF NOT EXISTS "public"."post" (
    "id" integer NOT NULL,
    "message" "text" NOT NULL,
    "accountId" integer
);

ALTER TABLE "public"."post" OWNER TO "postgres";

CREATE SEQUENCE IF NOT EXISTS "public"."Post_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE "public"."Post_id_seq" OWNER TO "postgres";

ALTER SEQUENCE "public"."Post_id_seq" OWNED BY "public"."post"."id";

CREATE TABLE IF NOT EXISTS "public"."product_category" (
    "id" bigint NOT NULL,
    "name" character varying NOT NULL,
    "colour_hex" character varying,
    "abbr" "text"
);

ALTER TABLE "public"."product_category" OWNER TO "postgres";

ALTER TABLE "public"."product_category" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."Product_Category_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE IF NOT EXISTS "public"."account_contact" (
    "id" bigint NOT NULL,
    "account_id" integer NOT NULL,
    "contact_id" integer NOT NULL,
    "relationship" smallint NOT NULL,
    "untill" "date",
    "since" "date" DEFAULT "now"() NOT NULL
);

ALTER TABLE "public"."account_contact" OWNER TO "postgres";

ALTER TABLE "public"."account_contact" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."account_contact_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE IF NOT EXISTS "public"."country" (
    "id" smallint NOT NULL,
    "iso" "text" NOT NULL,
    "iso3" "text",
    "name" "text" NOT NULL,
    "nicename" "text" NOT NULL,
    "numcode" smallint,
    "phonecode" smallint
);

ALTER TABLE "public"."country" OWNER TO "postgres";

ALTER TABLE "public"."country" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."country_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE IF NOT EXISTS "public"."currency" (
    "id" smallint NOT NULL,
    "name" "text" DEFAULT ''::"text" NOT NULL,
    "iso" "text" DEFAULT ''::"text" NOT NULL,
    "symbol" "text" DEFAULT ''::"text" NOT NULL
);

ALTER TABLE "public"."currency" OWNER TO "postgres";

ALTER TABLE "public"."currency" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."currency_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE IF NOT EXISTS "public"."price" (
    "id" bigint NOT NULL,
    "price" real NOT NULL,
    "currency" "public"."Currency" DEFAULT 'USD'::"public"."Currency" NOT NULL
);

ALTER TABLE "public"."price" OWNER TO "postgres";

ALTER TABLE "public"."price" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."price_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE IF NOT EXISTS "public"."product" (
    "id" integer NOT NULL,
    "name" "text" DEFAULT ''::"text" NOT NULL,
    "description" "text" DEFAULT ''::"text",
    "category" bigint,
    "active" boolean DEFAULT true NOT NULL,
    "abbreviation" "text" DEFAULT ''::"text" NOT NULL
);

ALTER TABLE "public"."product" OWNER TO "postgres";

CREATE TABLE IF NOT EXISTS "public"."product_component" (
    "id" bigint NOT NULL,
    "main" integer NOT NULL,
    "component" integer NOT NULL
);

ALTER TABLE "public"."product_component" OWNER TO "postgres";

ALTER TABLE "public"."product_component" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."product_component_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

ALTER TABLE "public"."product" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."product_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE IF NOT EXISTS "public"."product_image" (
    "id" bigint NOT NULL,
    "productId" integer NOT NULL,
    "coverImage" boolean DEFAULT false NOT NULL,
    "filePath" "text" NOT NULL
);

ALTER TABLE "public"."product_image" OWNER TO "postgres";

ALTER TABLE "public"."product_image" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."product_image_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE IF NOT EXISTS "public"."product_variant" (
    "id" bigint NOT NULL,
    "product_id" integer NOT NULL,
    "name" "text" NOT NULL,
    "description" "text",
    "weight" integer,
    "dimension" integer,
    "material" integer
);

ALTER TABLE "public"."product_variant" OWNER TO "postgres";

ALTER TABLE "public"."product_variant" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."product_variant_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE IF NOT EXISTS "public"."product_variant_manufacturer" (
    "manufacturer_id" integer NOT NULL,
    "product_variant_id" bigint NOT NULL,
    "price" real DEFAULT '0'::real NOT NULL,
    "currency" "public"."Currency" DEFAULT 'USD'::"public"."Currency" NOT NULL
);

ALTER TABLE "public"."product_variant_manufacturer" OWNER TO "postgres";

ALTER TABLE "public"."product_variant_manufacturer" ALTER COLUMN "product_variant_id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."product_variant_manufacturer_product_variant_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE IF NOT EXISTS "public"."profile" (
    "id" "uuid" NOT NULL,
    "firstname" "text",
    "lastname" "text",
    "avatar_url" "text"
);

ALTER TABLE "public"."profile" OWNER TO "postgres";

CREATE TABLE IF NOT EXISTS "public"."relationship" (
    "id" bigint NOT NULL,
    "name" "text" NOT NULL,
    "description" "text" NOT NULL
);

ALTER TABLE "public"."relationship" OWNER TO "postgres";

ALTER TABLE "public"."relationship" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."relationship_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE IF NOT EXISTS "storage"."buckets" (
    "id" "text" NOT NULL,
    "name" "text" NOT NULL,
    "owner" "uuid",
    "created_at" timestamp with time zone DEFAULT "now"(),
    "updated_at" timestamp with time zone DEFAULT "now"(),
    "public" boolean DEFAULT false,
    "avif_autodetection" boolean DEFAULT false,
    "file_size_limit" bigint,
    "allowed_mime_types" "text"[],
    "owner_id" "text"
);

ALTER TABLE "storage"."buckets" OWNER TO "supabase_storage_admin";

COMMENT ON COLUMN "storage"."buckets"."owner" IS 'Field is deprecated, use owner_id instead';

CREATE TABLE IF NOT EXISTS "storage"."migrations" (
    "id" integer NOT NULL,
    "name" character varying(100) NOT NULL,
    "hash" character varying(40) NOT NULL,
    "executed_at" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE "storage"."migrations" OWNER TO "supabase_storage_admin";

CREATE TABLE IF NOT EXISTS "storage"."objects" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "bucket_id" "text",
    "name" "text",
    "owner" "uuid",
    "created_at" timestamp with time zone DEFAULT "now"(),
    "updated_at" timestamp with time zone DEFAULT "now"(),
    "last_accessed_at" timestamp with time zone DEFAULT "now"(),
    "metadata" "jsonb",
    "path_tokens" "text"[] GENERATED ALWAYS AS ("string_to_array"("name", '/'::"text")) STORED,
    "version" "text",
    "owner_id" "text"
);

ALTER TABLE "storage"."objects" OWNER TO "supabase_storage_admin";

COMMENT ON COLUMN "storage"."objects"."owner" IS 'Field is deprecated, use owner_id instead';

ALTER TABLE ONLY "auth"."refresh_tokens" ALTER COLUMN "id" SET DEFAULT "nextval"('"auth"."refresh_tokens_id_seq"'::"regclass");

ALTER TABLE ONLY "public"."account" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."Account_id_seq"'::"regclass");

ALTER TABLE ONLY "public"."contact" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."Contact_id_seq"'::"regclass");

ALTER TABLE ONLY "public"."post" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."Post_id_seq"'::"regclass");

ALTER TABLE ONLY "auth"."mfa_amr_claims"
    ADD CONSTRAINT "amr_id_pk" PRIMARY KEY ("id");

ALTER TABLE ONLY "auth"."audit_log_entries"
    ADD CONSTRAINT "audit_log_entries_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "auth"."flow_state"
    ADD CONSTRAINT "flow_state_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "auth"."identities"
    ADD CONSTRAINT "identities_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "auth"."identities"
    ADD CONSTRAINT "identities_provider_id_provider_unique" UNIQUE ("provider_id", "provider");

ALTER TABLE ONLY "auth"."instances"
    ADD CONSTRAINT "instances_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "auth"."mfa_amr_claims"
    ADD CONSTRAINT "mfa_amr_claims_session_id_authentication_method_pkey" UNIQUE ("session_id", "authentication_method");

ALTER TABLE ONLY "auth"."mfa_challenges"
    ADD CONSTRAINT "mfa_challenges_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "auth"."mfa_factors"
    ADD CONSTRAINT "mfa_factors_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "auth"."refresh_tokens"
    ADD CONSTRAINT "refresh_tokens_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "auth"."refresh_tokens"
    ADD CONSTRAINT "refresh_tokens_token_unique" UNIQUE ("token");

ALTER TABLE ONLY "auth"."saml_providers"
    ADD CONSTRAINT "saml_providers_entity_id_key" UNIQUE ("entity_id");

ALTER TABLE ONLY "auth"."saml_providers"
    ADD CONSTRAINT "saml_providers_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "auth"."saml_relay_states"
    ADD CONSTRAINT "saml_relay_states_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "auth"."schema_migrations"
    ADD CONSTRAINT "schema_migrations_pkey" PRIMARY KEY ("version");

ALTER TABLE ONLY "auth"."sessions"
    ADD CONSTRAINT "sessions_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "auth"."sso_domains"
    ADD CONSTRAINT "sso_domains_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "auth"."sso_providers"
    ADD CONSTRAINT "sso_providers_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "auth"."users"
    ADD CONSTRAINT "users_phone_key" UNIQUE ("phone");

ALTER TABLE ONLY "auth"."users"
    ADD CONSTRAINT "users_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "public"."account"
    ADD CONSTRAINT "Account_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "public"."contact"
    ADD CONSTRAINT "Contact_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "public"."post"
    ADD CONSTRAINT "Post_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "public"."product_category"
    ADD CONSTRAINT "Product_Category_name_key" UNIQUE ("name");

ALTER TABLE ONLY "public"."product_category"
    ADD CONSTRAINT "Product_Category_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "public"."product"
    ADD CONSTRAINT "Product_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "public"."account_contact"
    ADD CONSTRAINT "account_contact_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "public"."country"
    ADD CONSTRAINT "country_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "public"."currency"
    ADD CONSTRAINT "currency_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "public"."price"
    ADD CONSTRAINT "price_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "public"."product_component"
    ADD CONSTRAINT "product_component_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "public"."product_image"
    ADD CONSTRAINT "product_image_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "public"."product_variant_manufacturer"
    ADD CONSTRAINT "product_variant_manufacturer_pkey" PRIMARY KEY ("manufacturer_id", "product_variant_id");

ALTER TABLE ONLY "public"."product_variant"
    ADD CONSTRAINT "product_variant_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "public"."profile"
    ADD CONSTRAINT "profiles_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "public"."relationship"
    ADD CONSTRAINT "relationship_name_key" UNIQUE ("name");

ALTER TABLE ONLY "public"."relationship"
    ADD CONSTRAINT "relationship_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "storage"."buckets"
    ADD CONSTRAINT "buckets_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "storage"."migrations"
    ADD CONSTRAINT "migrations_name_key" UNIQUE ("name");

ALTER TABLE ONLY "storage"."migrations"
    ADD CONSTRAINT "migrations_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "storage"."objects"
    ADD CONSTRAINT "objects_pkey" PRIMARY KEY ("id");

CREATE INDEX "audit_logs_instance_id_idx" ON "auth"."audit_log_entries" USING "btree" ("instance_id");

CREATE UNIQUE INDEX "confirmation_token_idx" ON "auth"."users" USING "btree" ("confirmation_token") WHERE (("confirmation_token")::"text" !~ '^[0-9 ]*$'::"text");

CREATE UNIQUE INDEX "email_change_token_current_idx" ON "auth"."users" USING "btree" ("email_change_token_current") WHERE (("email_change_token_current")::"text" !~ '^[0-9 ]*$'::"text");

CREATE UNIQUE INDEX "email_change_token_new_idx" ON "auth"."users" USING "btree" ("email_change_token_new") WHERE (("email_change_token_new")::"text" !~ '^[0-9 ]*$'::"text");

CREATE INDEX "factor_id_created_at_idx" ON "auth"."mfa_factors" USING "btree" ("user_id", "created_at");

CREATE INDEX "flow_state_created_at_idx" ON "auth"."flow_state" USING "btree" ("created_at" DESC);

CREATE INDEX "identities_email_idx" ON "auth"."identities" USING "btree" ("email" "text_pattern_ops");

COMMENT ON INDEX "auth"."identities_email_idx" IS 'Auth: Ensures indexed queries on the email column';

CREATE INDEX "identities_user_id_idx" ON "auth"."identities" USING "btree" ("user_id");

CREATE INDEX "idx_auth_code" ON "auth"."flow_state" USING "btree" ("auth_code");

CREATE INDEX "idx_user_id_auth_method" ON "auth"."flow_state" USING "btree" ("user_id", "authentication_method");

CREATE INDEX "mfa_challenge_created_at_idx" ON "auth"."mfa_challenges" USING "btree" ("created_at" DESC);

CREATE UNIQUE INDEX "mfa_factors_user_friendly_name_unique" ON "auth"."mfa_factors" USING "btree" ("friendly_name", "user_id") WHERE (TRIM(BOTH FROM "friendly_name") <> ''::"text");

CREATE INDEX "mfa_factors_user_id_idx" ON "auth"."mfa_factors" USING "btree" ("user_id");

CREATE UNIQUE INDEX "reauthentication_token_idx" ON "auth"."users" USING "btree" ("reauthentication_token") WHERE (("reauthentication_token")::"text" !~ '^[0-9 ]*$'::"text");

CREATE UNIQUE INDEX "recovery_token_idx" ON "auth"."users" USING "btree" ("recovery_token") WHERE (("recovery_token")::"text" !~ '^[0-9 ]*$'::"text");

CREATE INDEX "refresh_tokens_instance_id_idx" ON "auth"."refresh_tokens" USING "btree" ("instance_id");

CREATE INDEX "refresh_tokens_instance_id_user_id_idx" ON "auth"."refresh_tokens" USING "btree" ("instance_id", "user_id");

CREATE INDEX "refresh_tokens_parent_idx" ON "auth"."refresh_tokens" USING "btree" ("parent");

CREATE INDEX "refresh_tokens_session_id_revoked_idx" ON "auth"."refresh_tokens" USING "btree" ("session_id", "revoked");

CREATE INDEX "refresh_tokens_updated_at_idx" ON "auth"."refresh_tokens" USING "btree" ("updated_at" DESC);

CREATE INDEX "saml_providers_sso_provider_id_idx" ON "auth"."saml_providers" USING "btree" ("sso_provider_id");

CREATE INDEX "saml_relay_states_created_at_idx" ON "auth"."saml_relay_states" USING "btree" ("created_at" DESC);

CREATE INDEX "saml_relay_states_for_email_idx" ON "auth"."saml_relay_states" USING "btree" ("for_email");

CREATE INDEX "saml_relay_states_sso_provider_id_idx" ON "auth"."saml_relay_states" USING "btree" ("sso_provider_id");

CREATE INDEX "sessions_not_after_idx" ON "auth"."sessions" USING "btree" ("not_after" DESC);

CREATE INDEX "sessions_user_id_idx" ON "auth"."sessions" USING "btree" ("user_id");

CREATE UNIQUE INDEX "sso_domains_domain_idx" ON "auth"."sso_domains" USING "btree" ("lower"("domain"));

CREATE INDEX "sso_domains_sso_provider_id_idx" ON "auth"."sso_domains" USING "btree" ("sso_provider_id");

CREATE UNIQUE INDEX "sso_providers_resource_id_idx" ON "auth"."sso_providers" USING "btree" ("lower"("resource_id"));

CREATE INDEX "user_id_created_at_idx" ON "auth"."sessions" USING "btree" ("user_id", "created_at");

CREATE UNIQUE INDEX "users_email_partial_key" ON "auth"."users" USING "btree" ("email") WHERE ("is_sso_user" = false);

COMMENT ON INDEX "auth"."users_email_partial_key" IS 'Auth: A partial unique index that applies only when is_sso_user is false';

CREATE INDEX "users_instance_id_email_idx" ON "auth"."users" USING "btree" ("instance_id", "lower"(("email")::"text"));

CREATE INDEX "users_instance_id_idx" ON "auth"."users" USING "btree" ("instance_id");

CREATE INDEX "users_is_anonymous_idx" ON "auth"."users" USING "btree" ("is_anonymous");

CREATE UNIQUE INDEX "Account_email_key" ON "public"."account" USING "btree" ("email");

CREATE UNIQUE INDEX "Contact_email_key" ON "public"."contact" USING "btree" ("email");

CREATE UNIQUE INDEX "bname" ON "storage"."buckets" USING "btree" ("name");

CREATE UNIQUE INDEX "bucketid_objname" ON "storage"."objects" USING "btree" ("bucket_id", "name");

CREATE INDEX "name_prefix_search" ON "storage"."objects" USING "btree" ("name" "text_pattern_ops");

CREATE OR REPLACE TRIGGER "on_auth_user_created" AFTER INSERT ON "auth"."users" FOR EACH ROW EXECUTE FUNCTION "public"."handle_new_user"();

CREATE OR REPLACE TRIGGER "update_objects_updated_at" BEFORE UPDATE ON "storage"."objects" FOR EACH ROW EXECUTE FUNCTION "storage"."update_updated_at_column"();

ALTER TABLE ONLY "auth"."identities"
    ADD CONSTRAINT "identities_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "auth"."users"("id") ON DELETE CASCADE;

ALTER TABLE ONLY "auth"."mfa_amr_claims"
    ADD CONSTRAINT "mfa_amr_claims_session_id_fkey" FOREIGN KEY ("session_id") REFERENCES "auth"."sessions"("id") ON DELETE CASCADE;

ALTER TABLE ONLY "auth"."mfa_challenges"
    ADD CONSTRAINT "mfa_challenges_auth_factor_id_fkey" FOREIGN KEY ("factor_id") REFERENCES "auth"."mfa_factors"("id") ON DELETE CASCADE;

ALTER TABLE ONLY "auth"."mfa_factors"
    ADD CONSTRAINT "mfa_factors_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "auth"."users"("id") ON DELETE CASCADE;

ALTER TABLE ONLY "auth"."refresh_tokens"
    ADD CONSTRAINT "refresh_tokens_session_id_fkey" FOREIGN KEY ("session_id") REFERENCES "auth"."sessions"("id") ON DELETE CASCADE;

ALTER TABLE ONLY "auth"."saml_providers"
    ADD CONSTRAINT "saml_providers_sso_provider_id_fkey" FOREIGN KEY ("sso_provider_id") REFERENCES "auth"."sso_providers"("id") ON DELETE CASCADE;

ALTER TABLE ONLY "auth"."saml_relay_states"
    ADD CONSTRAINT "saml_relay_states_flow_state_id_fkey" FOREIGN KEY ("flow_state_id") REFERENCES "auth"."flow_state"("id") ON DELETE CASCADE;

ALTER TABLE ONLY "auth"."saml_relay_states"
    ADD CONSTRAINT "saml_relay_states_sso_provider_id_fkey" FOREIGN KEY ("sso_provider_id") REFERENCES "auth"."sso_providers"("id") ON DELETE CASCADE;

ALTER TABLE ONLY "auth"."sessions"
    ADD CONSTRAINT "sessions_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "auth"."users"("id") ON DELETE CASCADE;

ALTER TABLE ONLY "auth"."sso_domains"
    ADD CONSTRAINT "sso_domains_sso_provider_id_fkey" FOREIGN KEY ("sso_provider_id") REFERENCES "auth"."sso_providers"("id") ON DELETE CASCADE;

ALTER TABLE ONLY "public"."post"
    ADD CONSTRAINT "Post_accountId_fkey" FOREIGN KEY ("accountId") REFERENCES "public"."account"("id") ON UPDATE CASCADE ON DELETE SET NULL;

ALTER TABLE ONLY "public"."account"
    ADD CONSTRAINT "public_Account_country_fkey" FOREIGN KEY ("country") REFERENCES "public"."country"("id") ON UPDATE CASCADE;

ALTER TABLE ONLY "public"."product"
    ADD CONSTRAINT "public_Product_category_fkey" FOREIGN KEY ("category") REFERENCES "public"."product_category"("id") ON UPDATE CASCADE;

ALTER TABLE ONLY "public"."profile"
    ADD CONSTRAINT "public_Profile_id_fkey" FOREIGN KEY ("id") REFERENCES "auth"."users"("id") ON DELETE CASCADE;

ALTER TABLE ONLY "public"."account_contact"
    ADD CONSTRAINT "public_account_contact_account_id_fkey" FOREIGN KEY ("account_id") REFERENCES "public"."account"("id") ON UPDATE CASCADE ON DELETE SET NULL;

ALTER TABLE ONLY "public"."account_contact"
    ADD CONSTRAINT "public_account_contact_contact_id_fkey" FOREIGN KEY ("contact_id") REFERENCES "public"."contact"("id") ON UPDATE CASCADE ON DELETE SET DEFAULT;

ALTER TABLE ONLY "public"."account_contact"
    ADD CONSTRAINT "public_account_contact_relationship_fkey" FOREIGN KEY ("relationship") REFERENCES "public"."relationship"("id") ON UPDATE CASCADE;

ALTER TABLE ONLY "public"."product_component"
    ADD CONSTRAINT "public_product_component_component_fkey" FOREIGN KEY ("component") REFERENCES "public"."product"("id");

ALTER TABLE ONLY "public"."product_component"
    ADD CONSTRAINT "public_product_component_main_fkey" FOREIGN KEY ("main") REFERENCES "public"."product"("id");

ALTER TABLE ONLY "public"."product_image"
    ADD CONSTRAINT "public_product_image_productId_fkey" FOREIGN KEY ("productId") REFERENCES "public"."product"("id") ON DELETE CASCADE;

ALTER TABLE ONLY "public"."product_variant_manufacturer"
    ADD CONSTRAINT "public_product_variant_manufacturer_manufacturer_id_fkey" FOREIGN KEY ("manufacturer_id") REFERENCES "public"."account"("id");

ALTER TABLE ONLY "public"."product_variant_manufacturer"
    ADD CONSTRAINT "public_product_variant_manufacturer_product_variant_id_fkey" FOREIGN KEY ("product_variant_id") REFERENCES "public"."product_variant"("id");

ALTER TABLE ONLY "public"."product_variant"
    ADD CONSTRAINT "public_product_variant_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "public"."product"("id");

ALTER TABLE ONLY "storage"."objects"
    ADD CONSTRAINT "objects_bucketId_fkey" FOREIGN KEY ("bucket_id") REFERENCES "storage"."buckets"("id");

CREATE POLICY "Allow read only for authenticated users" ON "public"."account" FOR SELECT TO "authenticated" USING (true);

CREATE POLICY "Allow update only for authenticated users" ON "public"."account" FOR UPDATE TO "authenticated" USING (true);

CREATE POLICY "Enable all for authenticated users only" ON "public"."product_component" TO "authenticated" USING (true) WITH CHECK (true);

CREATE POLICY "Enable insert for authenticated users only" ON "public"."account" FOR INSERT TO "authenticated" WITH CHECK (true);

CREATE POLICY "Enable insert for authenticated users only" ON "public"."product" FOR INSERT TO "authenticated" WITH CHECK (true);

CREATE POLICY "Enable read for authenticated users only" ON "public"."product" FOR SELECT TO "authenticated" USING (true);

CREATE POLICY "Only Superuser can delete profiles." ON "public"."profile" FOR DELETE USING (false);

CREATE POLICY "Public Profile are viewable by everyone." ON "public"."profile" FOR SELECT USING (("auth"."uid"() = "id"));

CREATE POLICY "Users can insert their own profile." ON "public"."profile" FOR INSERT WITH CHECK (("auth"."uid"() = "id"));

CREATE POLICY "Users can update own profile." ON "public"."profile" FOR UPDATE USING (("auth"."uid"() = "id"));

ALTER TABLE "public"."account" ENABLE ROW LEVEL SECURITY;

ALTER TABLE "public"."account_contact" ENABLE ROW LEVEL SECURITY;

CREATE POLICY "allow authenitcated Users do all operations" ON "public"."product_image" TO "authenticated" USING (true);

CREATE POLICY "allow for authenticated" ON "public"."contact" USING (true);

CREATE POLICY "allow for authenticated" ON "public"."country" TO "authenticated" USING (true);

CREATE POLICY "allow for authenticated" ON "public"."product_category" FOR SELECT USING (true);

ALTER TABLE "public"."contact" ENABLE ROW LEVEL SECURITY;

ALTER TABLE "public"."country" ENABLE ROW LEVEL SECURITY;

ALTER TABLE "public"."currency" ENABLE ROW LEVEL SECURITY;

CREATE POLICY "permissive for authenticated" ON "public"."post" TO "authenticated" USING (true);

ALTER TABLE "public"."post" ENABLE ROW LEVEL SECURITY;

ALTER TABLE "public"."price" ENABLE ROW LEVEL SECURITY;

ALTER TABLE "public"."product" ENABLE ROW LEVEL SECURITY;

ALTER TABLE "public"."product_category" ENABLE ROW LEVEL SECURITY;

ALTER TABLE "public"."product_component" ENABLE ROW LEVEL SECURITY;

ALTER TABLE "public"."product_image" ENABLE ROW LEVEL SECURITY;

ALTER TABLE "public"."product_variant" ENABLE ROW LEVEL SECURITY;

ALTER TABLE "public"."product_variant_manufacturer" ENABLE ROW LEVEL SECURITY;

ALTER TABLE "public"."profile" ENABLE ROW LEVEL SECURITY;

ALTER TABLE "public"."relationship" ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Give access to authenticated users" ON "storage"."objects" TO "authenticated" USING (true);

CREATE POLICY "Give access to storage buckets to authenticated users" ON "storage"."buckets" TO "authenticated" USING (true);

ALTER TABLE "storage"."buckets" ENABLE ROW LEVEL SECURITY;

ALTER TABLE "storage"."migrations" ENABLE ROW LEVEL SECURITY;

ALTER TABLE "storage"."objects" ENABLE ROW LEVEL SECURITY;

GRANT USAGE ON SCHEMA "auth" TO "anon";
GRANT USAGE ON SCHEMA "auth" TO "authenticated";
GRANT USAGE ON SCHEMA "auth" TO "service_role";
GRANT ALL ON SCHEMA "auth" TO "supabase_auth_admin";
GRANT ALL ON SCHEMA "auth" TO "dashboard_user";
GRANT ALL ON SCHEMA "auth" TO "postgres";

GRANT USAGE ON SCHEMA "public" TO "postgres";
GRANT USAGE ON SCHEMA "public" TO "anon";
GRANT USAGE ON SCHEMA "public" TO "authenticated";
GRANT USAGE ON SCHEMA "public" TO "service_role";

GRANT ALL ON SCHEMA "storage" TO "postgres";
GRANT USAGE ON SCHEMA "storage" TO "anon";
GRANT USAGE ON SCHEMA "storage" TO "authenticated";
GRANT USAGE ON SCHEMA "storage" TO "service_role";
GRANT ALL ON SCHEMA "storage" TO "supabase_storage_admin";
GRANT ALL ON SCHEMA "storage" TO "dashboard_user";

GRANT ALL ON FUNCTION "auth"."email"() TO "dashboard_user";

GRANT ALL ON FUNCTION "auth"."jwt"() TO "postgres";
GRANT ALL ON FUNCTION "auth"."jwt"() TO "dashboard_user";

GRANT ALL ON FUNCTION "auth"."role"() TO "dashboard_user";

GRANT ALL ON FUNCTION "auth"."uid"() TO "dashboard_user";

GRANT ALL ON FUNCTION "public"."handle_new_user"() TO "anon";
GRANT ALL ON FUNCTION "public"."handle_new_user"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."handle_new_user"() TO "service_role";

GRANT ALL ON TABLE "auth"."audit_log_entries" TO "dashboard_user";
GRANT ALL ON TABLE "auth"."audit_log_entries" TO "postgres";

GRANT ALL ON TABLE "auth"."flow_state" TO "postgres";
GRANT ALL ON TABLE "auth"."flow_state" TO "dashboard_user";

GRANT ALL ON TABLE "auth"."identities" TO "postgres";
GRANT ALL ON TABLE "auth"."identities" TO "dashboard_user";

GRANT ALL ON TABLE "auth"."instances" TO "dashboard_user";
GRANT ALL ON TABLE "auth"."instances" TO "postgres";

GRANT ALL ON TABLE "auth"."mfa_amr_claims" TO "postgres";
GRANT ALL ON TABLE "auth"."mfa_amr_claims" TO "dashboard_user";

GRANT ALL ON TABLE "auth"."mfa_challenges" TO "postgres";
GRANT ALL ON TABLE "auth"."mfa_challenges" TO "dashboard_user";

GRANT ALL ON TABLE "auth"."mfa_factors" TO "postgres";
GRANT ALL ON TABLE "auth"."mfa_factors" TO "dashboard_user";

GRANT ALL ON TABLE "auth"."refresh_tokens" TO "dashboard_user";
GRANT ALL ON TABLE "auth"."refresh_tokens" TO "postgres";

GRANT ALL ON SEQUENCE "auth"."refresh_tokens_id_seq" TO "dashboard_user";
GRANT ALL ON SEQUENCE "auth"."refresh_tokens_id_seq" TO "postgres";

GRANT ALL ON TABLE "auth"."saml_providers" TO "postgres";
GRANT ALL ON TABLE "auth"."saml_providers" TO "dashboard_user";

GRANT ALL ON TABLE "auth"."saml_relay_states" TO "postgres";
GRANT ALL ON TABLE "auth"."saml_relay_states" TO "dashboard_user";

GRANT ALL ON TABLE "auth"."schema_migrations" TO "dashboard_user";
GRANT ALL ON TABLE "auth"."schema_migrations" TO "postgres";

GRANT ALL ON TABLE "auth"."sessions" TO "postgres";
GRANT ALL ON TABLE "auth"."sessions" TO "dashboard_user";

GRANT ALL ON TABLE "auth"."sso_domains" TO "postgres";
GRANT ALL ON TABLE "auth"."sso_domains" TO "dashboard_user";

GRANT ALL ON TABLE "auth"."sso_providers" TO "postgres";
GRANT ALL ON TABLE "auth"."sso_providers" TO "dashboard_user";

GRANT ALL ON TABLE "auth"."users" TO "dashboard_user";
GRANT ALL ON TABLE "auth"."users" TO "postgres";

GRANT ALL ON TABLE "public"."account" TO "anon";
GRANT ALL ON TABLE "public"."account" TO "authenticated";
GRANT ALL ON TABLE "public"."account" TO "service_role";

GRANT ALL ON SEQUENCE "public"."Account_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."Account_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."Account_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."contact" TO "anon";
GRANT ALL ON TABLE "public"."contact" TO "authenticated";
GRANT ALL ON TABLE "public"."contact" TO "service_role";

GRANT ALL ON SEQUENCE "public"."Contact_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."Contact_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."Contact_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."post" TO "anon";
GRANT ALL ON TABLE "public"."post" TO "authenticated";
GRANT ALL ON TABLE "public"."post" TO "service_role";

GRANT ALL ON SEQUENCE "public"."Post_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."Post_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."Post_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."product_category" TO "anon";
GRANT ALL ON TABLE "public"."product_category" TO "authenticated";
GRANT ALL ON TABLE "public"."product_category" TO "service_role";

GRANT ALL ON SEQUENCE "public"."Product_Category_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."Product_Category_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."Product_Category_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."account_contact" TO "anon";
GRANT ALL ON TABLE "public"."account_contact" TO "authenticated";
GRANT ALL ON TABLE "public"."account_contact" TO "service_role";

GRANT ALL ON SEQUENCE "public"."account_contact_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."account_contact_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."account_contact_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."country" TO "anon";
GRANT ALL ON TABLE "public"."country" TO "authenticated";
GRANT ALL ON TABLE "public"."country" TO "service_role";

GRANT ALL ON SEQUENCE "public"."country_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."country_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."country_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."currency" TO "anon";
GRANT ALL ON TABLE "public"."currency" TO "authenticated";
GRANT ALL ON TABLE "public"."currency" TO "service_role";

GRANT ALL ON SEQUENCE "public"."currency_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."currency_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."currency_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."price" TO "anon";
GRANT ALL ON TABLE "public"."price" TO "authenticated";
GRANT ALL ON TABLE "public"."price" TO "service_role";

GRANT ALL ON SEQUENCE "public"."price_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."price_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."price_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."product" TO "anon";
GRANT ALL ON TABLE "public"."product" TO "authenticated";
GRANT ALL ON TABLE "public"."product" TO "service_role";

GRANT ALL ON TABLE "public"."product_component" TO "anon";
GRANT ALL ON TABLE "public"."product_component" TO "authenticated";
GRANT ALL ON TABLE "public"."product_component" TO "service_role";

GRANT ALL ON SEQUENCE "public"."product_component_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."product_component_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."product_component_id_seq" TO "service_role";

GRANT ALL ON SEQUENCE "public"."product_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."product_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."product_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."product_image" TO "anon";
GRANT ALL ON TABLE "public"."product_image" TO "authenticated";
GRANT ALL ON TABLE "public"."product_image" TO "service_role";

GRANT ALL ON SEQUENCE "public"."product_image_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."product_image_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."product_image_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."product_variant" TO "anon";
GRANT ALL ON TABLE "public"."product_variant" TO "authenticated";
GRANT ALL ON TABLE "public"."product_variant" TO "service_role";

GRANT ALL ON SEQUENCE "public"."product_variant_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."product_variant_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."product_variant_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."product_variant_manufacturer" TO "anon";
GRANT ALL ON TABLE "public"."product_variant_manufacturer" TO "authenticated";
GRANT ALL ON TABLE "public"."product_variant_manufacturer" TO "service_role";

GRANT ALL ON SEQUENCE "public"."product_variant_manufacturer_product_variant_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."product_variant_manufacturer_product_variant_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."product_variant_manufacturer_product_variant_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."profile" TO "anon";
GRANT ALL ON TABLE "public"."profile" TO "authenticated";
GRANT ALL ON TABLE "public"."profile" TO "service_role";

GRANT ALL ON TABLE "public"."relationship" TO "anon";
GRANT ALL ON TABLE "public"."relationship" TO "authenticated";
GRANT ALL ON TABLE "public"."relationship" TO "service_role";

GRANT ALL ON SEQUENCE "public"."relationship_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."relationship_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."relationship_id_seq" TO "service_role";

GRANT ALL ON TABLE "storage"."buckets" TO "anon";
GRANT ALL ON TABLE "storage"."buckets" TO "authenticated";
GRANT ALL ON TABLE "storage"."buckets" TO "service_role";
GRANT ALL ON TABLE "storage"."buckets" TO "postgres";

GRANT ALL ON TABLE "storage"."migrations" TO "anon";
GRANT ALL ON TABLE "storage"."migrations" TO "authenticated";
GRANT ALL ON TABLE "storage"."migrations" TO "service_role";
GRANT ALL ON TABLE "storage"."migrations" TO "postgres";

GRANT ALL ON TABLE "storage"."objects" TO "anon";
GRANT ALL ON TABLE "storage"."objects" TO "authenticated";
GRANT ALL ON TABLE "storage"."objects" TO "service_role";
GRANT ALL ON TABLE "storage"."objects" TO "postgres";

ALTER DEFAULT PRIVILEGES FOR ROLE "supabase_auth_admin" IN SCHEMA "auth" GRANT ALL ON SEQUENCES  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "supabase_auth_admin" IN SCHEMA "auth" GRANT ALL ON SEQUENCES  TO "dashboard_user";

ALTER DEFAULT PRIVILEGES FOR ROLE "supabase_auth_admin" IN SCHEMA "auth" GRANT ALL ON FUNCTIONS  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "supabase_auth_admin" IN SCHEMA "auth" GRANT ALL ON FUNCTIONS  TO "dashboard_user";

ALTER DEFAULT PRIVILEGES FOR ROLE "supabase_auth_admin" IN SCHEMA "auth" GRANT ALL ON TABLES  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "supabase_auth_admin" IN SCHEMA "auth" GRANT ALL ON TABLES  TO "dashboard_user";

ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "service_role";

ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "service_role";

ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "service_role";

ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "storage" GRANT ALL ON SEQUENCES  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "storage" GRANT ALL ON SEQUENCES  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "storage" GRANT ALL ON SEQUENCES  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "storage" GRANT ALL ON SEQUENCES  TO "service_role";

ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "storage" GRANT ALL ON FUNCTIONS  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "storage" GRANT ALL ON FUNCTIONS  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "storage" GRANT ALL ON FUNCTIONS  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "storage" GRANT ALL ON FUNCTIONS  TO "service_role";

ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "storage" GRANT ALL ON TABLES  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "storage" GRANT ALL ON TABLES  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "storage" GRANT ALL ON TABLES  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "storage" GRANT ALL ON TABLES  TO "service_role";

RESET ALL;
