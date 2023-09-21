--SELECT SUM(f6 + f7::numeric) FROM ydata
--WHERE process_id = d6244f9a7abb413e92b12c4a65f5aa8b


-- public.yformula_v3 definition

--CREATE TABLE public.yformula_v3 (
--	formula_id varchar(255) NOT NULL,
--	client_id varchar(255) NOT NULL,
--	formula_name varchar(255) NULL,
--	fields varchar(255)[] NULL,
--	formula text NULL,
--	formula_type varchar(255) NULL,
--	formula_time time(6) NULL,
--	formula_create_datetime timestamp(6) NULL,
--	formula_update_datetime timestamp(6) NULL,
--	is_active bool NULL
--);

SELECT datas, data_id, data_receive_datetime FROM ydata_v2 WHERE is_process = false AND client_id = %incClientID% AND formula_id = $2