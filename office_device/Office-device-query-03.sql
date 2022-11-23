-- Create New Table First

-- "member-schema"."member" definition

-- Drop table

-- DROP TABLE "member-schema"."member";

CREATE TABLE "member-schema"."member" (
	id uuid NOT NULL DEFAULT public.uuid_generate_v4(),
	username varchar NULL,
	email varchar NOT NULL,
	"password" varchar NOT NULL,
	phone varchar NOT NULL,
	status bool NOT NULL DEFAULT false,
	subscribe bool NOT NULL DEFAULT true,
	is_deleted bool NOT NULL DEFAULT false,
	"createdAt" timestamp NOT NULL DEFAULT now(),
	"updatedAt" timestamp NOT NULL DEFAULT now(),
	CONSTRAINT "PK_573310c365a046a5f5fbd206f13" PRIMARY KEY (id),
	CONSTRAINT "UQ_a84aa3876dea4deb53d4a6febbf" UNIQUE (email)
);

-- "member-schema".profile definition

-- Drop table

-- DROP TABLE "member-schema".profile;

CREATE TABLE "member-schema".profile (
	id serial NOT NULL,
	fullname varchar NOT NULL,
	gender int4 NOT NULL,
	birthdate date NOT NULL,
	city varchar NOT NULL,
	occupation int4 NULL,
	"createdAt" timestamp NOT NULL DEFAULT now(),
	"updatedAt" timestamp NOT NULL DEFAULT now(),
	"memberId" uuid NULL,
	CONSTRAINT "PK_f347efaae3e57cafb4dbc108138" PRIMARY KEY (id),
	CONSTRAINT "REL_43606ba774e2bdcc923a107f8b" UNIQUE ("memberId")
);


-- "member-schema".profile foreign keys

ALTER TABLE "member-schema".profile ADD CONSTRAINT "FK_43606ba774e2bdcc923a107f8b4" FOREIGN KEY ("memberId") REFERENCES "member-schema"."member"(id);

-- "member-schema"."memberInterest" definition

-- Drop table

-- DROP TABLE "member-schema"."memberInterest";

CREATE TABLE "member-schema"."memberInterest" (
	"profileId" int4 NOT NULL,
	"interestId" int4 NOT NULL,
	CONSTRAINT "PK_14839a7311ea8ba86089a39a082" PRIMARY KEY ("profileId", "interestId")
);


-- "member-schema"."memberInterest" foreign keys

ALTER TABLE "member-schema"."memberInterest" ADD CONSTRAINT "FK_ada6f0cd5705b8a1a2851aca4ae" FOREIGN KEY ("profileId") REFERENCES "member-schema".profile(id);
ALTER TABLE "member-schema"."memberInterest" ADD CONSTRAINT "FK_b001c51666bd951a20c6479e307" FOREIGN KEY ("interestId") REFERENCES "member-schema".interest(id);

-- Create temp Table

-- "member-schema".old_member_temp definition

-- Drop table

-- DROP TABLE "member-schema".old_member_temp;

CREATE TABLE "member-schema".old_member_temp (
	member_id uuid NULL DEFAULT public.uuid_generate_v4(),
	member_email varchar NULL,
	member_phone varchar NULL,
	member_firstname varchar NULL,
	member_lastname varchar NULL,
	member_city varchar NULL,
	created_at timestamp NULL DEFAULT now(),
	updated_at timestamp NULL DEFAULT now(),
	member_password varchar NULL,
	member_username varchar NULL,
	member_is_active bool NULL DEFAULT false,
	member_date_of_birth date NULL,
	member_interests varchar NULL,
	member_subscribe bool NULL DEFAULT true,
	member_gender int4 NULL,
	CONSTRAINT member_email_1 UNIQUE (member_email),
	CONSTRAINT member_phone_1 UNIQUE (member_phone),
	CONSTRAINT member_username_1 UNIQUE (member_username)
);

INSERT INTO "member-schema".old_member_temp 
(member_email, member_phone, member_firstname, member_lastname, member_city, created_at, updated_at, member_password, member_username, member_is_active, member_date_of_birth, member_interests, member_subscribe, member_gender) 
SELECT member_email, member_phone, member_firstname, member_lastname, member_city, created_at, updated_at, member_password, member_username, cast (member_is_active as bool), member_date_of_birth, member_interests, cast (member_subscribe as bool), member_gender 
FROM "member-schema".old_member;

INSERT INTO "member-schema".member
(id, username, email, "password", phone, status, subscribe, "createdAt", "updatedAt") 
SELECT member_id, member_username, member_email, member_password, member_phone, member_is_active, member_subscribe, created_at, updated_at
FROM "member-schema".old_member_temp;

-- "member-schema".profile_interest_temp definition

-- Drop table

-- DROP TABLE "member-schema".profile_interest_temp;

CREATE TABLE "member-schema".profile_interest_temp (
	id serial NOT NULL,
	fullname varchar NOT NULL,
	gender int4 NOT NULL,
	birthdate date NOT NULL,
	city varchar NOT NULL,
	occupation int4 NULL,
	"createdAt" timestamp NOT NULL DEFAULT now(),
	"updatedAt" timestamp NOT NULL DEFAULT now(),
	"memberId" uuid NULL,
	interests varchar NULL
);

INSERT INTO "member-schema".profile_interest_temp 
(fullname, gender, birthdate, city, "createdAt", "updatedAt", "memberId", interests) 
SELECT concat(member_firstname, member_lastname), member_gender, member_date_of_birth, member_city, created_at, updated_at, member_id, member_interests
FROM "member-schema".old_member_temp;

INSERT INTO "member-schema".memberInterest 
("profileId", "interestId") 
select s.id, cast(trim(unnest(string_to_array(s.interests, ','))) as integer) as interest from profile_interest_next s;



