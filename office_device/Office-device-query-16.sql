CREATE TABLE public.bapenda_branch (
	id serial NOT NULL,
	merchant_id integer NULL,
	branch_id integer NULL,
	kec_id integer NULL,
	bt_id integer NULL,
	branch_name varchar NULL DEFAULT '',
	npwp varchar NULL DEFAULT '',
	nopd varchar NULL,
	"location" varchar NULL,
	pos_code varchar NULL,
	pic varchar NULL,
	no_tlp varchar NULL,
	email varchar NULL,
	rekening_number varchar NULL,
	created date NULL DEFAULT now(),
	modified date NULL DEFAULT now()
);
