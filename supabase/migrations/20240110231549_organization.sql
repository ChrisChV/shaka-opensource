create type "public"."organization_type" as enum ('free', 'pay', 'enterprise');

create sequence "public"."organization_id_seq";

create table "public"."organization" (
    "id" integer not null default nextval('organization_id_seq'::regclass),
    "name" text,
    "type" organization_type,
    "created_at" timestamp without time zone default now()
);


alter table "public"."organization" enable row level security;

alter sequence "public"."organization_id_seq" owned by "public"."organization"."id";

CREATE UNIQUE INDEX organization_pkey ON public.organization USING btree (id);

alter table "public"."organization" add constraint "organization_pkey" PRIMARY KEY using index "organization_pkey";

grant delete on table "public"."organization" to "anon";

grant insert on table "public"."organization" to "anon";

grant references on table "public"."organization" to "anon";

grant select on table "public"."organization" to "anon";

grant trigger on table "public"."organization" to "anon";

grant truncate on table "public"."organization" to "anon";

grant update on table "public"."organization" to "anon";

grant delete on table "public"."organization" to "authenticated";

grant insert on table "public"."organization" to "authenticated";

grant references on table "public"."organization" to "authenticated";

grant select on table "public"."organization" to "authenticated";

grant trigger on table "public"."organization" to "authenticated";

grant truncate on table "public"."organization" to "authenticated";

grant update on table "public"."organization" to "authenticated";

grant delete on table "public"."organization" to "service_role";

grant insert on table "public"."organization" to "service_role";

grant references on table "public"."organization" to "service_role";

grant select on table "public"."organization" to "service_role";

grant trigger on table "public"."organization" to "service_role";

grant truncate on table "public"."organization" to "service_role";

grant update on table "public"."organization" to "service_role";


