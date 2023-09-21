SELECT route_id, client_id, product_id, prepaid_price_for_client, postpaid_adminfee_total_to_enduser, postpaid_adminfee_share_to_client, 
fee_other_partner, is_pph_applied, is_ppn_applied, is_burst, is_allow_same_denom_many_hit, prepaid_margin_type 
FROM public.route_client_product_vendor WHERE client_id='AAY20030603311';

--CREATE TABLE enduser_balance_product (
--	client_id varchar NOT NULL,
--	accnumber varchar NOT NULL,
--	vendor_id varchar NOT NULL,
--	last_balance numeric(20,5) NOT NULL,
--	balance numeric(20,5) NOT NULL,
--	link text NULL,
--	qr_text text NULL,
--	last_type_usage varchar NULL,
--	updated_at timestamp NULL,
--	last_incoming_cb_time varchar NULL
--);

SELECT uw.username as web_username, uw."password" as web_password, uw.privilege, uw.is_active as web_is_active, uw.full_name, uw.email_address,
ua.username as api_username, ua."password" as api_password, ua.ip_address, ua.client_id, ua.active as api_is_active,
cl.client_name
FROM user_web uw
LEFT JOIN user_api ua ON ua.client_id = uw.client_id
LEFT JOIN client cl ON cl.client_id = ua.client_id
where uw.username = 'adminloketpintar';

SELECT tracecode, trx_datetime, client_id, user_id, reference_code, signature, transaction_code, product_code, acc_number_01, acc_number_02, acc_number_03, final_trx_status, ref01, ref02, ref03, serial_number, billing_period, is_refunded, refunding_tracecode, query_code
FROM "transaction"
where ref01 = '04ca18f9bd144a5e';
