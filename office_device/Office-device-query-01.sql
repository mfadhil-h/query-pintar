-- public.etalaze_product definition

-- Drop table

 DROP TABLE public.etalaze_product;

CREATE TABLE public.etalaze_product (
	id bigserial NOT NULL,
	product_name varchar NULL,
	category varchar NULL,
	price numeric NULL,
	CONSTRAINT etalaze_product_pk PRIMARY KEY (id)
);


-- public.etalaze_product foreign keys

ALTER TABLE public.etalaze_product ADD CONSTRAINT etalaze_product_fk FOREIGN KEY (category) REFERENCES public.etalaze_category(category_name);

INSERT INTO public.etalaze_product (id, product_name, category, price) VALUES(1, 'SMS SINGLE', 'SMS', 120000);
INSERT INTO public.etalaze_product (id, product_name, category, price) VALUES(2, 'SMS PERSONALIZE', 'SMS', 200000);
INSERT INTO public.etalaze_product (id, product_name, category, price) VALUES(3, 'WHATSAPP PUSH', 'WHATSAPP', 150000);
INSERT INTO public.etalaze_product (id, product_name, category, price) VALUES(4, 'VOICE SINGLE', 'VOICE', 140000);
INSERT INTO public.etalaze_product (id, product_name, category, price) VALUES(5, 'VOICE PERSONALIZE', 'VOICE', 240000);

-- public.etalaze_user_use_product definition

-- Drop table

-- DROP TABLE public.etalaze_user_use_product;

CREATE TABLE public.etalaze_user_use_product (
	user_id bigserial NOT NULL,
	product_id bigserial NOT NULL,
	is_enable bool NULL,
	CONSTRAINT etalaze_user_use_product_pk PRIMARY KEY (user_id, product_id)
);

sELECT * FROM "user_api"
where username = 'Gr3nPkG1';

sELECT tsd.* FROM transaction_sms_dlr tsd
left join transaction_sms ts on ts.message_id = tsd.message_id 
where tsd.dlr_status = '000' and ts.receiver_type = 'SMPP' order by dlr_date_time desc limit 10;