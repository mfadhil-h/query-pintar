-- DROP TYPE public."payments_status_enum";

CREATE TYPE public."payments_status_enum" AS ENUM (
	PENDING,
	SUCCESS,
	FAILED,
	REVERSAL,
	CANCEL,
	EXPIRED);

-- DROP TYPE public."users_roles_enum";

CREATE TYPE public."users_roles_enum" AS ENUM (
	admin,
	vet,
	pawrent);

-- DROP TYPE public."vouchers_status_enum";

CREATE TYPE public."vouchers_status_enum" AS ENUM (
	ACTIVE,
	INACTIVE,
	EXPIRED);

-- DROP TYPE public."vouchers_voucher_type_enum";

CREATE TYPE public."vouchers_voucher_type_enum" AS ENUM (
	FLAT,
	PERCENTAGE);




-- public.migrations definition

-- Drop table

-- DROP TABLE public.migrations;

CREATE TABLE public.migrations (
	id serial4 NOT NULL,
	"timestamp" int8 NOT NULL,
	"name" varchar NOT NULL,
	CONSTRAINT "PK_8c82d7f526340ab734260ea46be" PRIMARY KEY (id)
);


-- public.orders definition

-- Drop table

-- DROP TABLE public.orders;

CREATE TABLE public.orders (
	id serial4 NOT NULL,
	order_raw text NULL,
	created_at timestamp NOT NULL DEFAULT now(),
	updated_at timestamp NOT NULL DEFAULT now(),
	CONSTRAINT "PK_710e2d4957aa5878dfe94e4ac2f" PRIMARY KEY (id)
);


-- public.problems definition

-- Drop table

-- DROP TABLE public.problems;

CREATE TABLE public.problems (
	"name" varchar NOT NULL,
	created_at timestamp NOT NULL DEFAULT now(),
	updated_at timestamp NOT NULL DEFAULT now(),
	deleted_at timestamp NULL,
	id bigserial NOT NULL,
	CONSTRAINT "PK_b3994afba6ab64a42cda1ccaeff" PRIMARY KEY (id)
);


-- public.users definition

-- Drop table

-- DROP TABLE public.users;

CREATE TABLE public.users (
	phone varchar NOT NULL,
	email varchar NULL,
	"password" varchar NULL,
	picture varchar NULL,
	created_at timestamp NOT NULL DEFAULT now(),
	updated_at timestamp NOT NULL DEFAULT now(),
	deleted_at timestamp NULL,
	id bigserial NOT NULL,
	"name" varchar NULL,
	roles public."_users_roles_enum" NOT NULL DEFAULT {pawrent}::users_roles_enum[],
	CONSTRAINT "PK_a3ffb1c0c8416b9fc6f907b7433" PRIMARY KEY (id),
	CONSTRAINT "UQ_a000cca60bcf04454e727699490" UNIQUE (phone)
);
CREATE UNIQUE INDEX users_email_unique_index ON public.users USING btree (email, deleted_at);
CREATE UNIQUE INDEX users_phone_unique_index ON public.users USING btree (phone, deleted_at);


-- public.vaccines definition

-- Drop table

-- DROP TABLE public.vaccines;

CREATE TABLE public.vaccines (
	"name" varchar NOT NULL,
	"function" varchar NOT NULL,
	start_age int4 NOT NULL,
	end_age int4 NOT NULL,
	animal_type varchar NOT NULL,
	note text NULL,
	created_at timestamp NOT NULL DEFAULT now(),
	updated_at timestamp NOT NULL DEFAULT now(),
	deleted_at timestamp NULL,
	id bigserial NOT NULL,
	CONSTRAINT "PK_195bc56fe32c08445078655ec5a" PRIMARY KEY (id)
);


-- public.vouchers definition

-- Drop table

-- DROP TABLE public.vouchers;

CREATE TABLE public.vouchers (
	id serial4 NOT NULL,
	title varchar NOT NULL,
	voucher varchar NOT NULL,
	description varchar NULL,
	discount int8 NOT NULL,
	"maxDiscount" int4 NOT NULL,
	quantity int4 NOT NULL DEFAULT 0,
	status public."vouchers_status_enum" NOT NULL,
	voucher_type public."vouchers_voucher_type_enum" NOT NULL DEFAULT FLAT::vouchers_voucher_type_enum,
	start_date int8 NOT NULL,
	end_date int8 NOT NULL,
	created_by int4 NOT NULL,
	created_at timestamp NOT NULL DEFAULT now(),
	updated_at timestamp NOT NULL DEFAULT now(),
	CONSTRAINT "PK_ed1b7dd909a696560763acdbc04" PRIMARY KEY (id)
);


-- public.order_details definition

-- Drop table

-- DROP TABLE public.order_details;

CREATE TABLE public.order_details (
	id serial4 NOT NULL,
	item_id int4 NOT NULL,
	item_name varchar NOT NULL,
	quantity int4 NOT NULL,
	price numeric(16, 2) NOT NULL,
	order_id int4 NULL,
	CONSTRAINT "PK_278a6e0f21c9db1653e6f406801" PRIMARY KEY (id),
	CONSTRAINT "FK_3ff3367344edec5de2355a562ee" FOREIGN KEY (order_id) REFERENCES public.orders(id)
);


-- public.pawrent_profiles definition

-- Drop table

-- DROP TABLE public.pawrent_profiles;

CREATE TABLE public.pawrent_profiles (
	address varchar NULL,
	created_at timestamp NOT NULL DEFAULT now(),
	updated_at timestamp NOT NULL DEFAULT now(),
	deleted_at timestamp NULL,
	id int8 NOT NULL,
	"name" varchar NULL,
	CONSTRAINT "PK_2873e2cd0f6f5a4b617f0c3a703" PRIMARY KEY (id),
	CONSTRAINT "UQ_2873e2cd0f6f5a4b617f0c3a703" UNIQUE (id),
	CONSTRAINT "FK_2873e2cd0f6f5a4b617f0c3a703" FOREIGN KEY (id) REFERENCES public.users(id)
);


-- public.payment_logs definition

-- Drop table

-- DROP TABLE public.payment_logs;

CREATE TABLE public.payment_logs (
	id serial4 NOT NULL,
	"type" varchar NOT NULL,
	logs text NOT NULL,
	created_at timestamp NOT NULL DEFAULT now(),
	order_id int4 NULL,
	CONSTRAINT "PK_b5bda25324e539ea41bc09697f6" PRIMARY KEY (id),
	CONSTRAINT "FK_dce266ce9f4bc90221d677fc8a1" FOREIGN KEY (order_id) REFERENCES public.orders(id)
);


-- public.payment_refunds definition

-- Drop table

-- DROP TABLE public.payment_refunds;

CREATE TABLE public.payment_refunds (
	id serial4 NOT NULL,
	reason text NOT NULL,
	created_at timestamp NOT NULL DEFAULT now(),
	order_id int4 NULL,
	CONSTRAINT "PK_c33fe9426d69e3d60080c7d2f06" PRIMARY KEY (id),
	CONSTRAINT "FK_dca07cf3505a1b7ebc46ae8e138" FOREIGN KEY (order_id) REFERENCES public.orders(id)
);


-- public.payments definition

-- Drop table

-- DROP TABLE public.payments;

CREATE TABLE public.payments (
	id serial4 NOT NULL,
	midtrans_token varchar NULL,
	midtrans_snap_url varchar NULL,
	status public."payments_status_enum" NOT NULL,
	request_raw text NULL,
	response_raw text NULL,
	expired_date int8 NOT NULL,
	created_at timestamp NOT NULL DEFAULT now(),
	order_id int4 NOT NULL,
	CONSTRAINT "PK_197ab7af18c93fbb0c9b28b4a59" PRIMARY KEY (id),
	CONSTRAINT "UQ_b2f7b823a21562eeca20e72b006" UNIQUE (order_id),
	CONSTRAINT "FK_b2f7b823a21562eeca20e72b006" FOREIGN KEY (order_id) REFERENCES public.orders(id)
);


-- public.user_attributes definition

-- Drop table

-- DROP TABLE public.user_attributes;

CREATE TABLE public.user_attributes (
	"key" varchar NOT NULL,
	value varchar NOT NULL,
	created_at timestamp NOT NULL DEFAULT now(),
	updated_at timestamp NOT NULL DEFAULT now(),
	id bigserial NOT NULL,
	user_id int8 NOT NULL,
	CONSTRAINT "PK_043020ff63d30b1c03bafed7552" PRIMARY KEY (id),
	CONSTRAINT "FK_561897ae18add15d070f81ae6f0" FOREIGN KEY (user_id) REFERENCES public.users(id)
);
CREATE UNIQUE INDEX user_attributes_user_id_key_unique_index ON public.user_attributes USING btree (key, user_id);


-- public.user_blocks definition

-- Drop table

-- DROP TABLE public.user_blocks;

CREATE TABLE public.user_blocks (
	id bigserial NOT NULL,
	user_id int8 NOT NULL,
	block_ids _int8 NOT NULL,
	created_at timestamp NOT NULL DEFAULT now(),
	updated_at timestamp NOT NULL DEFAULT now(),
	CONSTRAINT "PK_0bae5f5cab7574a84889462187c" PRIMARY KEY (id),
	CONSTRAINT "REL_d4abdbd0c82d04db5b237f2265" UNIQUE (user_id),
	CONSTRAINT "FK_d4abdbd0c82d04db5b237f22658" FOREIGN KEY (user_id) REFERENCES public.users(id)
);


-- public.user_reports definition

-- Drop table

-- DROP TABLE public.user_reports;

CREATE TABLE public.user_reports (
	id bigserial NOT NULL,
	user_id int8 NOT NULL,
	report_id int8 NOT NULL,
	reason text NOT NULL,
	created_at timestamp NOT NULL DEFAULT now(),
	updated_at timestamp NOT NULL DEFAULT now(),
	CONSTRAINT "PK_d727f04c93f97a3d445a647d234" PRIMARY KEY (id),
	CONSTRAINT "REL_7211729f7ceb0a68439bbfc588" UNIQUE (user_id),
	CONSTRAINT "FK_7211729f7ceb0a68439bbfc5888" FOREIGN KEY (user_id) REFERENCES public.users(id)
);


-- public.vet_profiles definition

-- Drop table

-- DROP TABLE public.vet_profiles;

CREATE TABLE public.vet_profiles (
	specialization varchar NULL,
	work_experience varchar NOT NULL,
	sip varchar NOT NULL,
	rating int4 NOT NULL,
	created_at timestamp NOT NULL DEFAULT now(),
	updated_at timestamp NOT NULL DEFAULT now(),
	deleted_at timestamp NULL,
	id int8 NOT NULL,
	"name" varchar NULL,
	CONSTRAINT "PK_81d9ac655fcdbd41bbcea339cf2" PRIMARY KEY (id),
	CONSTRAINT "UQ_81d9ac655fcdbd41bbcea339cf2" UNIQUE (id),
	CONSTRAINT "UQ_ebefbb47466f1c505fef97fc445" UNIQUE (sip),
	CONSTRAINT "FK_81d9ac655fcdbd41bbcea339cf2" FOREIGN KEY (id) REFERENCES public.users(id)
);


-- public.voucher_redeems definition

-- Drop table

-- DROP TABLE public.voucher_redeems;

CREATE TABLE public.voucher_redeems (
	id serial4 NOT NULL,
	"userId" varchar NOT NULL,
	"voucherId" int4 NOT NULL,
	"createdAt" int8 NOT NULL,
	"deletedAt" int8 NULL,
	CONSTRAINT "PK_91098d0e3d7986f1a6d1ba615cb" PRIMARY KEY (id),
	CONSTRAINT "FK_524c4177e37e9d01a75729caffc" FOREIGN KEY ("voucherId") REFERENCES public.vouchers(id)
);


-- public.pawrent_pets definition

-- Drop table

-- DROP TABLE public.pawrent_pets;

CREATE TABLE public.pawrent_pets (
	"name" varchar NOT NULL,
	picture varchar NULL,
	"type" varchar NOT NULL DEFAULT other::character varying,
	race varchar NULL,
	gender varchar NOT NULL DEFAULT female::character varying,
	age int4 NOT NULL DEFAULT 0,
	created_at timestamp NOT NULL DEFAULT now(),
	updated_at timestamp NOT NULL DEFAULT now(),
	deleted_at timestamp NULL,
	id bigserial NOT NULL,
	weight int4 NOT NULL DEFAULT 0,
	parent_id int8 NOT NULL,
	CONSTRAINT "PK_ba4f3d551fd7ee51ab9daecc1ab" PRIMARY KEY (id),
	CONSTRAINT "FK_263b9ccc57b7f013bb4048e7ed7" FOREIGN KEY (parent_id) REFERENCES public.pawrent_profiles(id)
);


-- public.vet_educations_formal definition

-- Drop table

-- DROP TABLE public.vet_educations_formal;

CREATE TABLE public.vet_educations_formal (
	institute varchar NOT NULL,
	"degree" varchar NOT NULL,
	created_at timestamp NOT NULL DEFAULT now(),
	updated_at timestamp NOT NULL DEFAULT now(),
	vet_id int8 NULL,
	id bigserial NOT NULL,
	deleted_at timestamp NULL,
	CONSTRAINT "PK_7fdf7c029e0948e4f57c5630679" PRIMARY KEY (id),
	CONSTRAINT "FK_49242198f27edd0434322057daa" FOREIGN KEY (vet_id) REFERENCES public.vet_profiles(id)
);
CREATE INDEX vet_non_formal_education_index ON public.vet_educations_formal USING btree (vet_id);


-- public.vet_educations_non_formal definition

-- Drop table

-- DROP TABLE public.vet_educations_non_formal;

CREATE TABLE public.vet_educations_non_formal (
	certification varchar NOT NULL,
	organizer varchar NOT NULL,
	created_at timestamp NOT NULL DEFAULT now(),
	updated_at timestamp NOT NULL DEFAULT now(),
	vet_id int8 NULL,
	id bigserial NOT NULL,
	deleted_at timestamp NULL,
	CONSTRAINT "PK_6edc7eb34c141a1316e3be7de0d" PRIMARY KEY (id),
	CONSTRAINT "FK_346db5c902472bc1cd53673769c" FOREIGN KEY (vet_id) REFERENCES public.vet_profiles(id)
);
CREATE INDEX vet_formal_education_index ON public.vet_educations_non_formal USING btree (vet_id);


-- public.consultation_requests definition

-- Drop table

-- DROP TABLE public.consultation_requests;

CREATE TABLE public.consultation_requests (
	id serial4 NOT NULL,
	created_at timestamp NOT NULL DEFAULT now(),
	parent_id int8 NOT NULL,
	pet_id int8 NOT NULL,
	vet_id int8 NOT NULL,
	CONSTRAINT "PK_b241fc32bd9f9f7cb3dd41b1f5b" PRIMARY KEY (id),
	CONSTRAINT "UQ_c4559ad80dbbd6207dfacbaa3da" UNIQUE (vet_id),
	CONSTRAINT "FK_370c271b8818e3b6250f6a0eca4" FOREIGN KEY (pet_id) REFERENCES public.pawrent_pets(id),
	CONSTRAINT "FK_5aa4d996c62cfcf456c101af90d" FOREIGN KEY (parent_id) REFERENCES public.pawrent_profiles(id),
	CONSTRAINT "FK_c4559ad80dbbd6207dfacbaa3da" FOREIGN KEY (vet_id) REFERENCES public.vet_profiles(id)
);


-- public.consultations definition

-- Drop table

-- DROP TABLE public.consultations;

CREATE TABLE public.consultations (
	id uuid NOT NULL,
	status varchar NOT NULL DEFAULT on::character varying,
	suggestion varchar NULL,
	note varchar NULL,
	created_at timestamp NOT NULL DEFAULT now(),
	updated_at timestamp NOT NULL DEFAULT now(),
	deleted_at timestamp NULL,
	problem_id int8 NULL,
	parent_id int8 NOT NULL,
	pet_id int8 NOT NULL,
	vet_id int8 NOT NULL,
	order_id int4 NULL,
	CONSTRAINT "PK_c5b78e9424d9bc68464f6a12103" PRIMARY KEY (id),
	CONSTRAINT "UQ_df1b0fa387357cc66fadd1ac090" UNIQUE (order_id),
	CONSTRAINT "FK_0b61bee575c0b8ddd2dbd1403b4" FOREIGN KEY (pet_id) REFERENCES public.pawrent_pets(id),
	CONSTRAINT "FK_343b41a00e9794533edb320ad22" FOREIGN KEY (parent_id) REFERENCES public.pawrent_profiles(id),
	CONSTRAINT "FK_575f4a33bfec109149f0122f775" FOREIGN KEY (vet_id) REFERENCES public.vet_profiles(id),
	CONSTRAINT "FK_5b452749da14afe815fc32d3570" FOREIGN KEY (problem_id) REFERENCES public.problems(id),
	CONSTRAINT "FK_df1b0fa387357cc66fadd1ac090" FOREIGN KEY (order_id) REFERENCES public.payments(order_id)
);


-- public.medical_histories definition

-- Drop table

-- DROP TABLE public.medical_histories;

CREATE TABLE public.medical_histories (
	clinic varchar NOT NULL,
	suggestion varchar NULL,
	created_at timestamp NOT NULL DEFAULT now(),
	updated_at timestamp NOT NULL DEFAULT now(),
	deleted_at timestamp NULL,
	medical_type varchar NOT NULL,
	medical_date date NOT NULL,
	vet_name varchar NOT NULL,
	vaccine_certificate varchar NULL,
	id bigserial NOT NULL,
	pet_id int8 NOT NULL,
	note varchar NULL,
	CONSTRAINT "PK_8b0170de8abb52639e20c046533" PRIMARY KEY (id),
	CONSTRAINT "FK_9877de84f809db4cd74a4ce41de" FOREIGN KEY (pet_id) REFERENCES public.pawrent_pets(id)
);


-- public.medical_histories_problems definition

-- Drop table

-- DROP TABLE public.medical_histories_problems;

CREATE TABLE public.medical_histories_problems (
	"problemsId" int8 NOT NULL,
	"medicalHistoriesId" int8 NOT NULL,
	CONSTRAINT "PK_206fbf9c1ce698c5773941d2f7f" PRIMARY KEY ("problemsId", "medicalHistoriesId"),
	CONSTRAINT "FK_5e5c023436eb703c04d2cacb469" FOREIGN KEY ("problemsId") REFERENCES public.problems(id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT "FK_aa972adb464a8c4e892315535bc" FOREIGN KEY ("medicalHistoriesId") REFERENCES public.medical_histories(id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE INDEX "IDX_5e5c023436eb703c04d2cacb46" ON public.medical_histories_problems USING btree ("problemsId");
CREATE INDEX "IDX_aa972adb464a8c4e892315535b" ON public.medical_histories_problems USING btree ("medicalHistoriesId");


-- public.medical_histories_vaccines definition

-- Drop table

-- DROP TABLE public.medical_histories_vaccines;

CREATE TABLE public.medical_histories_vaccines (
	"medicalHistoriesId" int8 NOT NULL,
	"vaccinesId" int8 NOT NULL,
	CONSTRAINT "PK_7e6067075e4d5a98ff83a07c37e" PRIMARY KEY ("medicalHistoriesId", "vaccinesId"),
	CONSTRAINT "FK_4257c3dd47e138a6c3fa5ca4c6a" FOREIGN KEY ("vaccinesId") REFERENCES public.vaccines(id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT "FK_4279b10ecf2e2e5fea642905837" FOREIGN KEY ("medicalHistoriesId") REFERENCES public.medical_histories(id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE INDEX "IDX_4257c3dd47e138a6c3fa5ca4c6" ON public.medical_histories_vaccines USING btree ("vaccinesId");
CREATE INDEX "IDX_4279b10ecf2e2e5fea64290583" ON public.medical_histories_vaccines USING btree ("medicalHistoriesId");