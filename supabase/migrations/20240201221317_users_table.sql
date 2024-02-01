create type "public"."user_role" as enum ('admin');

create sequence "public"."user_id_seq";

create table "public"."user" (
    "id" integer not null default nextval('user_id_seq'::regclass),
    "name" character varying not null,
    "email" character varying not null,
    "role" user_role not null,
    "organization_id" integer not null,
    "created_at" timestamp without time zone default now()
);


alter sequence "public"."user_id_seq" owned by "public"."user"."id";

CREATE UNIQUE INDEX user_email_key ON public."user" USING btree (email);

CREATE UNIQUE INDEX user_pkey ON public."user" USING btree (id);

alter table "public"."user" add constraint "user_pkey" PRIMARY KEY using index "user_pkey";

alter table "public"."user" add constraint "user_email_key" UNIQUE using index "user_email_key";

alter table "public"."user" add constraint "user_organization_id_fkey" FOREIGN KEY (organization_id) REFERENCES organization(id) not valid;

alter table "public"."user" validate constraint "user_organization_id_fkey";

grant delete on table "public"."user" to "anon";

grant insert on table "public"."user" to "anon";

grant references on table "public"."user" to "anon";

grant select on table "public"."user" to "anon";

grant trigger on table "public"."user" to "anon";

grant truncate on table "public"."user" to "anon";

grant update on table "public"."user" to "anon";

grant delete on table "public"."user" to "authenticated";

grant insert on table "public"."user" to "authenticated";

grant references on table "public"."user" to "authenticated";

grant select on table "public"."user" to "authenticated";

grant trigger on table "public"."user" to "authenticated";

grant truncate on table "public"."user" to "authenticated";

grant update on table "public"."user" to "authenticated";

grant delete on table "public"."user" to "service_role";

grant insert on table "public"."user" to "service_role";

grant references on table "public"."user" to "service_role";

grant select on table "public"."user" to "service_role";

grant trigger on table "public"."user" to "service_role";

grant truncate on table "public"."user" to "service_role";

grant update on table "public"."user" to "service_role";


