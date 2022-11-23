-- public.autogen_a_number definition

-- Drop table

-- DROP TABLE public.autogen_a_number;

CREATE TABLE public.autogen_a_number (
	batch_id varchar(50) NOT NULL,
	username varchar(50) NOT NULL,
	delivery_status varchar(5) NOT NULL,
	no_of_records int4 NOT NULL,
	no_of_sms_each int4 NOT NULL,
	message text NOT NULL,
	client_cost_each numeric(10, 2) NOT NULL,
	message_encoding varchar(5) NOT NULL,
	b_number_filename varchar(500) NOT NULL,
	message_length int4 NOT NULL,
	no_of_sms_total varchar NOT NULL,
	is_processed bool NOT NULL,
	country_code varchar NOT NULL,
	date_time timestamp NOT NULL,
	CONSTRAINT autogen_a_number_pkey PRIMARY KEY (batch_id)
);

-- public.master_privilege definition

-- Drop table

-- DROP TABLE public.master_privilege;

CREATE TABLE public.master_privilege (
	privilege_id varchar(50) NOT NULL,
	privilege_name varchar(100) NOT NULL,
	CONSTRAINT master_privilege_pkey PRIMARY KEY (privilege_id)
);


-- public.batchtogo_sms_personalized definition

-- Drop table

-- DROP TABLE public.batchtogo_sms_personalized;

CREATE TABLE public.batchtogo_sms_personalized (
	batch_id varchar(50) NOT NULL,
	sms_type varchar(50) NOT NULL,
	client_sender_id varchar(50) NOT NULL,
	personalized_file varchar(200) NOT NULL,
	"encoding" varchar(5) NOT NULL,
	sms_content varchar(1000) NOT NULL,
	is_processed bool NOT NULL,
	client_id varchar(50) NOT NULL,
	remote_ip_address varchar(50) NULL,
	api_username varchar(50) NOT NULL,
	upline_client_id varchar(50) NULL,
	schedule varchar(100) NULL,
	CONSTRAINT batchtogo_sms_personalize_pkey PRIMARY KEY (batch_id)
);


-- public.batchtogo_sms_single definition

-- Drop table

-- DROP TABLE public.batchtogo_sms_single;

CREATE TABLE public.batchtogo_sms_single (
	batch_id varchar(50) NOT NULL,
	sms_type varchar(50) NOT NULL,
	client_sender_id varchar(50) NOT NULL,
	destination_type varchar(50) NOT NULL,
	b_number_file varchar(100) NULL,
	msisdns text NULL,
	address_book_group_id varchar(50) NULL,
	"encoding" varchar(5) NOT NULL,
	schedule timestamp NOT NULL,
	sms_content varchar(10000) NOT NULL,
	is_processed bool NOT NULL,
	processed_datetime timestamp NULL,
	client_id varchar(50) NOT NULL,
	remote_ip_address varchar(100) NULL,
	api_username varchar(100) NOT NULL,
	upline_client_id varchar(50) NULL,
	message_type varchar(50) NULL,
	CONSTRAINT batchtogo_sms_single_pkey PRIMARY KEY (batch_id)
);


-- public.client_group definition

-- Drop table

-- DROP TABLE public.client_group;

CREATE TABLE public.client_group (
	group_id varchar(50) NOT NULL,
	group_name varchar(50) NOT NULL,
	description varchar(100) NOT NULL,
	sysadmin_username varchar(50) NULL,
	CONSTRAINT client_group_pkey PRIMARY KEY (group_id)
);


-- public.currency definition

-- Drop table

-- DROP TABLE public.currency;

CREATE TABLE public.currency (
	currency_id varchar(10) NOT NULL,
	currency_name varchar(50) NOT NULL,
	currency_description varchar(100) NOT NULL,
	is_active bool NULL,
	CONSTRAINT currency_pkey PRIMARY KEY (currency_id)
);


-- public.transaction_sms_receiver definition

-- Drop table

-- DROP TABLE public.transaction_sms_receiver;

CREATE TABLE public.transaction_sms_receiver (
	message_id varchar(50) NOT NULL,
	receiver_date_time timestamp NULL,
	receiver_data varchar(1000) NULL,
	receiver_client_response varchar(1000) NULL,
	client_ip_address varchar(500) NOT NULL,
	receiver_client_response_date_time timestamp NULL,
	CONSTRAINT transaction_sms_receiver_pkey PRIMARY KEY (message_id)
);


-- public.transaction_status definition

-- Drop table

-- DROP TABLE public.transaction_status;

CREATE TABLE public.transaction_status (
	status_code varchar(5) NOT NULL,
	description varchar(50) NOT NULL,
	is_deducting_bill bool NOT NULL,
	CONSTRAINT "TransactionStatus_pkey" PRIMARY KEY (status_code)
);


-- public.user_web definition

-- Drop table

-- DROP TABLE public.user_web;

CREATE TABLE public.user_web (
	username varchar(50) NOT NULL,
	"password" varchar(100) NOT NULL,
	privilege varchar(10) NOT NULL,
	client_id varchar(50) NULL,
	is_active bool NOT NULL,
	full_name varchar(100) NULL,
	email_address varchar(200) NULL,
	group_id varchar(50) NULL,
	last_failed_attempt_datetime timestamp NULL,
	last_failed_count int4 NULL,
	product_access varchar(500) NULL,
	CONSTRAINT "UserWeb_pkey" PRIMARY KEY (username)
);


-- public.user_web_privilege definition

-- Drop table

-- DROP TABLE public.user_web_privilege;

CREATE TABLE public.user_web_privilege (
	privilege_id varchar(50) NOT NULL,
	privilege_name varchar(50) NOT NULL,
	description varchar(100) NULL,
	CONSTRAINT user_web_privilege_pkey PRIMARY KEY (privilege_id)
);


-- public.vendor_sms definition

-- Drop table

-- DROP TABLE public.vendor_sms;

CREATE TABLE public.vendor_sms (
	vendor_id varchar(50) NOT NULL,
	vendor_name varchar(50) NOT NULL,
	vendor_address varchar(50) NULL,
	vendor_city varchar(50) NULL,
	vendor_region varchar(50) NULL,
	vendor_country varchar(10) NULL,
	vendor_phone_number varchar(50) NULL,
	vendor_email varchar(50) NULL,
	pic_name varchar(50) NULL,
	pic_phone_number varchar(50) NULL,
	pic_email varchar(50) NULL,
	is_active bool NULL,
	queue_name varchar(500) NULL,
	client_group_id varchar(50) NULL,
	vendor_tps int4 NULL,
	CONSTRAINT "VendorSMS_pkey" PRIMARY KEY (vendor_id)
);


-- public.country definition

-- Drop table

-- DROP TABLE public.country;

CREATE TABLE public.country (
	country_id varchar(10) NOT NULL,
	country_name varchar(50) NOT NULL,
	currency_code varchar(10) NOT NULL,
	CONSTRAINT "Country_pkey" PRIMARY KEY (country_id),
	CONSTRAINT country_currency_code_fkey FOREIGN KEY (currency_code) REFERENCES public.currency(currency_id)
);


-- public.transaction_sms definition

-- Drop table

-- DROP TABLE public.transaction_sms;

CREATE TABLE public.transaction_sms (
	message_id varchar(50) NOT NULL,
	transaction_date timestamp(4) NOT NULL,
	msisdn varchar(30) NOT NULL,
	message varchar(10000) NOT NULL,
	country_code varchar(10) NOT NULL,
	telecom_id varchar(10) NOT NULL,
	prefix varchar(10) NOT NULL,
	status_code bpchar(5) NOT NULL,
	receiver_type bpchar(5) NOT NULL,
	application_id varchar(32) NOT NULL,
	client_id varchar(50) NOT NULL,
	currency varchar(10) NOT NULL,
	message_encodng varchar(10) NOT NULL,
	message_length int4 NOT NULL,
	sms_count int4 NOT NULL,
	client_price_per_unit numeric(20, 5) NOT NULL,
	client_price_total numeric(20, 5) NOT NULL,
	client_sender_id varchar(50) NOT NULL,
	batch_id varchar(50) NULL,
	api_username varchar(50) NULL,
	call_duration int4 NULL,
	message_type text NULL,
	CONSTRAINT "TransactionSMS_pkey" PRIMARY KEY (message_id),
	CONSTRAINT "TransactionSMS_statusCode_fkey" FOREIGN KEY (status_code) REFERENCES public.transaction_status(status_code)
);
CREATE INDEX clientid_transaction_date ON public.transaction_sms USING btree (client_id, transaction_date);
CREATE INDEX idx_app_clientid ON public.transaction_sms USING btree (client_id);
CREATE INDEX idx_app_currency ON public.transaction_sms USING btree (currency);
CREATE INDEX idx_app_trxdate ON public.transaction_sms USING btree (transaction_date);
CREATE INDEX idx_transaction_sms_batch_id ON public.transaction_sms USING btree (batch_id);
CREATE INDEX transaction_sms_summary_telecom_total_sms_and_price ON public.transaction_sms USING btree (message_id, transaction_date, client_id, telecom_id, sms_count, client_price_total, status_code);
CREATE INDEX transaction_sms_summary_total_sms_and_price ON public.transaction_sms USING btree (message_id, transaction_date, client_id, sms_count, client_price_total, status_code);
CREATE INDEX transaction_transaction_date ON public.transaction_sms USING btree (transaction_date);
CREATE INDEX transaction_transaction_date_msisdn ON public.transaction_sms USING btree (transaction_date, msisdn);


-- public.transaction_sms_status definition

-- Drop table

-- DROP TABLE public.transaction_sms_status;

CREATE TABLE public.transaction_sms_status (
	message_id varchar(50) NOT NULL,
	final_status varchar(10) NOT NULL,
	transaction_date_time timestamp NULL,
	CONSTRAINT transaction_sms_status_pkey PRIMARY KEY (message_id),
	CONSTRAINT transaction_sms_status_final_status_fkey FOREIGN KEY (final_status) REFERENCES public.transaction_status(status_code) ON DELETE CASCADE ON UPDATE CASCADE
);


-- public.transaction_sms_vendor definition

-- Drop table

-- DROP TABLE public.transaction_sms_vendor;

CREATE TABLE public.transaction_sms_vendor (
	message_id varchar(50) NOT NULL,
	vendor_id varchar(50) NOT NULL,
	vendor_hit_date_time timestamp NOT NULL,
	vendor_hit_request varchar(100000) NOT NULL,
	vendor_hit_resp_date_time timestamp NOT NULL,
	vendor_hit_response varchar(100000) NOT NULL,
	vendor_message_id varchar(50) NULL,
	vendor_callback_date_time timestamp NULL,
	vendor_callback varchar(100000) NULL,
	router_to_transaceiver_date_time timestamp NOT NULL,
	vendor_trx_status varchar(50) NULL,
	CONSTRAINT transaction_sms_vendor_callback_pkey PRIMARY KEY (message_id),
	CONSTRAINT transaction_sms_vendor_callback_vendor_id_fkey FOREIGN KEY (vendor_id) REFERENCES public.vendor_sms(vendor_id)
);
CREATE INDEX idx_vendor_message_id_trx_sms_vendor ON public.transaction_sms_vendor USING btree (vendor_message_id, vendor_id);


-- public.vendor_senderid_sms definition

-- Drop table

-- DROP TABLE public.vendor_senderid_sms;

CREATE TABLE public.vendor_senderid_sms (
	vendor_sender_id_id varchar(70) NOT NULL,
	sender_id varchar(20) NOT NULL,
	vendor_id varchar(50) NOT NULL,
	masking varchar(20) NOT NULL,
	is_active bool NOT NULL,
	CONSTRAINT "VendorSenderIdSMS_pkey" PRIMARY KEY (vendor_sender_id_id),
	CONSTRAINT "VendorSenderIdSMS_vendorId_fkey" FOREIGN KEY (vendor_id) REFERENCES public.vendor_sms(vendor_id)
);


-- public.client definition

-- Drop table

-- DROP TABLE public.client;

CREATE TABLE public.client (
	client_id varchar(50) NOT NULL,
	client_name varchar(100) NOT NULL,
	client_address varchar(500) NULL,
	client_city varchar(50) NULL,
	client_region varchar(50) NULL,
	client_country varchar(10) NOT NULL,
	client_phone_number varchar(50) NULL,
	client_email varchar(50) NULL,
	pic_name varchar(50) NULL,
	pic_phone_number varchar(50) NULL,
	pic_email varchar(50) NULL,
	currency_id varchar(10) NOT NULL,
	is_active bool NOT NULL,
	business_model varchar(10) NOT NULL,
	client_group_id varchar(50) NOT NULL,
	is_reseller bool NULL,
	upline_client_id varchar(50) NULL,
	CONSTRAINT "Client_pkey" PRIMARY KEY (client_id),
	CONSTRAINT client_client_country_fkey FOREIGN KEY (client_country) REFERENCES public.country(country_id),
	CONSTRAINT client_client_group_id_fkey FOREIGN KEY (client_group_id) REFERENCES public.client_group(group_id),
	CONSTRAINT client_currency_id_fkey FOREIGN KEY (currency_id) REFERENCES public.currency(currency_id)
);
CREATE INDEX idx_app_groupid ON public.client USING btree (client_group_id);


-- public.client_senderid_sms definition

-- Drop table

-- DROP TABLE public.client_senderid_sms;

CREATE TABLE public.client_senderid_sms (
	client_sender_id_id varchar(70) NOT NULL,
	sender_id varchar(50) NOT NULL,
	client_id varchar(50) NOT NULL,
	masking varchar(50) NOT NULL,
	is_active bool NOT NULL,
	CONSTRAINT "SenderIdSMS_pkey" PRIMARY KEY (client_sender_id_id),
	CONSTRAINT client_senderid_sms_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.client(client_id) ON DELETE RESTRICT ON UPDATE CASCADE
);


-- public.user_api definition

-- Drop table

-- DROP TABLE public.user_api;

CREATE TABLE public.user_api (
	username varchar(50) NOT NULL,
	"password" varchar(100) NOT NULL,
	client_id varchar(50) NOT NULL,
	access_type varchar(100) NOT NULL,
	registered_ip_address varchar(500) NOT NULL,
	is_active bool NULL,
	"token" varchar(50) NULL,
	token_expired timestamp NULL,
	CONSTRAINT "UserAPI_pkey" PRIMARY KEY (username),
	CONSTRAINT user_api_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.client(client_id)
);


-- public.users definition

-- Drop table

-- DROP TABLE public.users;

CREATE TABLE public.users (
	id bigserial NOT NULL,
	"name" varchar(255) NOT NULL,
	email varchar(255) NOT NULL,
	email_verified_at timestamp(0) NULL,
	"password" varchar(255) NOT NULL,
	remember_token varchar(100) NULL,
	created_at timestamp(0) NULL,
	updated_at timestamp(0) NULL,
	privilege varchar(50) NOT NULL,
	client_id varchar(50) NULL,
	group_id varchar(50) NULL,
	is_active bool NOT NULL,
	is_client_reseller bool NOT NULL,
	can_neuapix bool NULL,
	phone_number varchar(50) NULL,
	username varchar(100) NULL,
	google2fa_secret varchar(255) NULL,
	CONSTRAINT users_email_unique UNIQUE (email),
	CONSTRAINT users_pkey PRIMARY KEY (id)
);


-- public.users foreign keys

ALTER TABLE public.users ADD CONSTRAINT users_client_idx FOREIGN KEY (client_id) REFERENCES public.client(client_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE public.users ADD CONSTRAINT users_privilege_id_fkey FOREIGN KEY (privilege) REFERENCES public.master_privilege(privilege_id) ON DELETE CASCADE ON UPDATE CASCADE;

-- public.report_request_transaction_sms definition

-- Drop table

-- DROP TABLE public.report_request_transaction_sms;

CREATE TABLE public.report_request_transaction_sms (
	request_id varchar(100) NOT NULL,
	request_datetime timestamp NOT NULL,
	username varchar(50) NOT NULL,
	start_datetime timestamp NOT NULL,
	end_datetime timestamp NOT NULL,
	client_id varchar(50) NOT NULL,
	search_keyword varchar(500) NULL,
	search_parameter varchar(100) NULL,
	is_generated bool NOT NULL,
	file_path varchar(500) NULL,
	is_generated_2 bool NULL,
	file_path_2 varchar(500) NULL,
	CONSTRAINT report_request_transaction_sms_pkey PRIMARY KEY (request_id)
);

-- public.transaction_sms_financial definition

-- Drop table

-- DROP TABLE public.transaction_sms_financial;

CREATE TABLE public.transaction_sms_financial (
	message_id varchar(50) NOT NULL,
	usage_type varchar(10) NOT NULL,
	usage_by varchar(50) NOT NULL,
	client_id varchar(50) NOT NULL,
	transaction_datetime timestamp NOT NULL,
	description varchar(200) NOT NULL,
	previous_balance numeric(20, 5) NOT NULL,
	"usage" numeric(20, 5) NOT NULL,
	after_balance numeric(20, 5) NOT NULL,
	vendor_id varchar(50) NULL,
	vendor_price numeric(20, 5) NULL,
	vendor_currency varchar(10) NULL
);
CREATE INDEX idx_message_id_trx_sms_financial ON public.transaction_sms_financial USING btree (message_id);


-- public.transaction_sms_financial foreign keys

ALTER TABLE public.transaction_sms_financial ADD CONSTRAINT transaction_financial_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.client(client_id) ON DELETE CASCADE ON UPDATE CASCADE;

-- public.routing_table_sms definition

-- Drop table

-- DROP TABLE public.routing_table_sms;

CREATE TABLE public.routing_table_sms (
	routing_id varchar(100) NOT NULL,
	client_id varchar(50) NOT NULL,
	client_sender_id_id varchar(70) NOT NULL,
	telecom_id varchar(10) NOT NULL,
	vendor_id varchar(50) NOT NULL,
	vendor_sender_id_id varchar(70) NOT NULL,
	vendor_parameter_json varchar(1000) NULL,
	client_price_per_submit float8 NOT NULL,
	vendor_price_per_submit float8 NOT NULL,
	currency_id varchar(10) NOT NULL,
	is_active bool NOT NULL,
	fake_dr bool NULL,
	client_user_api varchar(50) NOT NULL,
	is_charged_per_dr bool NULL,
	client_price_per_delivery float8 NOT NULL,
	vendor_price_per_delivery float8 NOT NULL,
	voice_unit_second int4 NULL,
	voice_price_per_unit float8 NULL,
	CONSTRAINT routing_table_sms_pkey PRIMARY KEY (routing_id)
);


-- public.routing_table_sms foreign keys

ALTER TABLE public.routing_table_sms ADD CONSTRAINT routing_table_sms_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.client(client_id);
ALTER TABLE public.routing_table_sms ADD CONSTRAINT routing_table_sms_client_sender_id_id_fkey FOREIGN KEY (client_sender_id_id) REFERENCES public.client_senderid_sms(client_sender_id_id);
ALTER TABLE public.routing_table_sms ADD CONSTRAINT routing_table_sms_currency_id_fkey FOREIGN KEY (currency_id) REFERENCES public.currency(currency_id);
ALTER TABLE public.routing_table_sms ADD CONSTRAINT routing_table_sms_telecom_id_fkey FOREIGN KEY (telecom_id) REFERENCES public.telecom(telecom_id);
ALTER TABLE public.routing_table_sms ADD CONSTRAINT routing_table_sms_vendor_id_fkey FOREIGN KEY (vendor_id) REFERENCES public.vendor_sms(vendor_id);
ALTER TABLE public.routing_table_sms ADD CONSTRAINT routing_table_sms_vendor_sender_id_id_fkey FOREIGN KEY (vendor_sender_id_id) REFERENCES public.vendor_senderid_sms(vendor_sender_id_id);

-- public.telecom definition

-- Drop table

-- DROP TABLE public.telecom;

CREATE TABLE public.telecom (
	telecom_id varchar(10) NOT NULL,
	telecom_name varchar(50) NOT NULL,
	telecom_country_code varchar(5) NOT NULL,
	is_active bool NULL,
	CONSTRAINT "Telecom_pkey" PRIMARY KEY (telecom_id)
);


-- public.telecom foreign keys

ALTER TABLE public.telecom ADD CONSTRAINT "Telecom_telecomCountryCode_fkey" FOREIGN KEY (telecom_country_code) REFERENCES public.country(country_id);