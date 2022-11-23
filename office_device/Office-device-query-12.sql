--create function trx_sms
CREATE OR REPLACE FUNCTION trx_sms_insert_trigger_func()
  RETURNS trigger AS
$$
begin
	INSERT INTO summary_trx_sms_vendor (message_id, transaction_date, client_id, telecom_id, sms_count, client_price_total, status_code)
		VALUES(NEW.message_id, NEW.transaction_date, NEW.client_id, NEW.telecom_id, NEW.sms_count, NEW.client_price_total, NEW.status_code)
	ON CONFLICT (message_id) 
	DO 
		UPDATE SET transaction_date=excluded.transaction_date, client_id=excluded.client_id, telecom_id=excluded.telecom_id, 
			sms_count=excluded.sms_count, client_price_total=excluded.client_price_total, status_code=excluded.status_code;
RETURN NEW;
END;
$$
LANGUAGE 'plpgsql';
--create trigger trx_sms
CREATE TRIGGER trx_sms_insert_trigger
	AFTER insert
	ON transaction_sms
	FOR EACH row
		EXECUTE PROCEDURE trx_sms_insert_trigger_func();
--drop trigger trx_sms
drop trigger trx_sms_insert_trigger on transaction_sms;
--create function trx_sms_vendor
CREATE OR REPLACE FUNCTION trx_sms_vendor_insert_trigger_func()
  RETURNS trigger AS
$$
begin
	INSERT INTO summary_trx_sms_vendor (message_id, vendor_id, vendor_trx_status)
		VALUES(NEW.message_id, NEW.vendor_id, NEW.vendor_trx_status)
	ON CONFLICT (message_id) 
	DO 
		UPDATE SET vendor_id=excluded.vendor_id, vendor_trx_status=excluded.vendor_trx_status;
RETURN NEW;
END;
$$
LANGUAGE 'plpgsql';
--create trigger trx_sms_vendor
CREATE TRIGGER trx_sms_insert_trigger
	AFTER insert
	ON transaction_sms_vendor
	FOR EACH row
		EXECUTE PROCEDURE trx_sms_vendor_insert_trigger_func();
--drop trigger trx_sms
drop trigger trx_sms_insert_trigger on transaction_sms_vendor;