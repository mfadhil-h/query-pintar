select * from "transaction" t 
where 
client_id = 'DANG20220113194845'
--product_code = 'BPJSKS'
--and user_id = 'danamon'
--product_code = 'HPTSELHALO'
--reference_code = '22450f7ea00d4a7186c23ce5fb3e5ac5'
--tracecode = '74715b195c2740b8b1fcd3b4693838b1'
--trx_datetime >= '2022-11-01'
--and final_trx_status = '402'
--tracecode = '0742f9fe612b4bf7b8222c73e064e51c'
--product_code = 'HPTSEL'
--and client_id = 'PAKE20220320151918'
--order by trx_datetime desc limit 50;


select * from postpaid_inquiry pi2 
where 
--pi2.inquiry_id  = '1832cc0477aa4d2695a59269308fe1d0'
pi2.pasti_product_code = 'HPTSELHALO'
--and username = 'LOKETPINTAR'
and is_paid = true

-- public.report_transaction_danamon definition

-- Drop table

-- DROP TABLE public.report_transaction_danamon;

CREATE TABLE public.report_transaction_danamon (
	id varchar(100) NOT NULL,
	datetime timestamp NOT NULL,
	username varchar(50) NOT NULL,
	start_datetime timestamp NOT NULL,
	end_datetime timestamp NOT NULL,
	client_id varchar(50) NOT NULL,
	search_keyword varchar(500) NULL,
	search_parameter varchar(100) NULL,
	is_generated bool NOT NULL,
	file_path varchar(500) NULL,
	CONSTRAINT report_transaction_danamon_pkey PRIMARY KEY (request_id)
);

-- public.bapenda_branchtype definition

-- Drop table

-- DROP TABLE public.bapenda_branchtype;

CREATE TABLE public.bapenda_branchtype (
	bt_id serial4 NOT NULL,
	bt_desc varchar NOT NULL,
	bt_kode_pajak varchar NULL,
	created date NULL DEFAULT now(),
	modified date NULL DEFAULT now(),
	CONSTRAINT bapenda_branchtype_pk PRIMARY KEY (bt_id)
);


-- public.bapenda_detail definition

-- Drop table

-- DROP TABLE public.bapenda_detail;

CREATE TABLE public.bapenda_detail (
	id int4 NOT NULL,
	header_id int4 NOT NULL,
	bill_no varchar(255) NULL,
	item_name varchar(255) NULL,
	item_type varchar(255) NULL,
	item_price varchar(255) NULL,
	quantity varchar(255) NULL,
	item_amount varchar(255) NULL,
	created timestamp NULL,
	modified timestamp NULL
);


-- public.bapenda_kecamatan definition

-- Drop table

-- DROP TABLE public.bapenda_kecamatan;

CREATE TABLE public.bapenda_kecamatan (
	kec_id serial,
	suban_id int4 NULL,
	kec_name varchar NULL,
	created date NULL DEFAULT now(),
	modified date NULL DEFAULT now()
);


-- public.bapenda_merchant definition

-- Drop table

-- DROP TABLE public.bapenda_merchant;

CREATE TABLE public.bapenda_merchant (
	merchant_id serial4 NOT NULL,
	merchant_name varchar NULL,
	shared_key varchar NULL,
	date_format varchar NULL,
	no_tlp varchar NULL,
	email varchar NULL,
	created date NOT NULL DEFAULT now(),
	modified date NOT NULL DEFAULT now(),
	owner_name varchar NULL,
	owner_location varchar NULL,
	pos_code varchar NULL,
	rt varchar NULL,
	rw varchar NULL,
	CONSTRAINT bapenda_merchant_pk PRIMARY KEY (merchant_id)
);


-- public.bapenda_branch definition

-- Drop table

-- DROP TABLE public.bapenda_branch;

CREATE TABLE public.bapenda_branch (
	id serial4 NOT NULL,
	merchant_id int4 NULL,
	branch_id int4 NULL,
	kec_id int4 NULL,
	bt_id int4 NULL,
	branch_name varchar NULL DEFAULT ''::character varying,
	npwp varchar NULL DEFAULT ''::character varying,
	nopd varchar NULL,
	"location" varchar NULL,
	pos_code varchar NULL,
	pic varchar NULL,
	no_tlp varchar NULL,
	email varchar NULL,
	rekening_number varchar NULL,
	created date NULL DEFAULT now(),
	modified date NULL DEFAULT now(),
	CONSTRAINT bapenda_branch_pk PRIMARY KEY (id),
	CONSTRAINT bapenda_branch_fk FOREIGN KEY (merchant_id) REFERENCES public.bapenda_merchant(merchant_id),
	CONSTRAINT bapenda_branchtype_fk FOREIGN KEY (bt_id) REFERENCES public.bapenda_branchtype(bt_id)
);