select *
from transaction_sms_receiver tsr 
where 
tsr.message_id in ('6a239165acf04315a8602862290a0095', '8d53ca55b41940b39bb326ca227b9773');

select ts.*
from transaction_sms ts 
where 
ts.client_id = 'C16201122051125'
--and ts.status_code != '002'
and ts.transaction_date between '2022-09-06' and '2022-09-07';

select ts.message_id, ts.transaction_date, ts.msisdn, ts.message, ts.country_code, ts.prefix,
ts.status_code, ts2.description, ts.receiver_type, c.client_name, ts.currency, 
ts.message_encodng, ts.message_length, ts.sms_count, ts.client_price_per_unit,
ts.client_price_total, ts.client_sender_id, ts.batch_id, tsf.previous_balance, tsf."usage",
tsf.after_balance, tsr.client_ip_address, tsr.receiver_data, tsr.receiver_client_response
from transaction_sms ts
left join transaction_sms_financial tsf on ts.message_id = tsf.message_id 
left join transaction_status ts2 on ts.status_code = ts2.status_code 
left join client c on ts.client_id = c.client_id 
left join transaction_sms_receiver tsr on ts.message_id = tsr.message_id 
where 
ts.client_id = 'VTP191218031201'
--lower(c.client_name) like '%vfirst%'
and ts.transaction_date between '2022-10-01' and '2022-11-01'
order by ts.transaction_date desc;

select distinct (vs.*)
from routing_table_sms rts 
left join client c on c.client_id = rts.client_id 
left join vendor_sms vs on vs.vendor_id = rts.vendor_id 
where
c.client_name like '%THK%'
--and rts.vendor_parameter_json != ''
;

select c.client_name, ua.username, ttp.telin_url 
from transceiver_telin_property ttp 
left join user_api ua on ua.username = ttp.api_username 
left join client c on c.client_id = ua.client_id 
where 
c.client_name like '%THK%';

select ts.message_id, ts.transaction_date, ts.client_id, ts.telecom_id, ts.sms_count, ts.client_price_total, ts.status_code, tsv.vendor_id, tsv.vendor_trx_status 
from transaction_sms ts 
left join transaction_sms_vendor tsv 
where ts.transaction_date 
between '2022-09-13' and '2022-09-14' order by ts.transaction_date asc

select trx.message_id, trx.transaction_date, trx.msisdn, trx.message, cnt.country_name, trx.prefix,
coalesce(tss.final_status, trx.status_code) as status_code, coalesce(stx.description, sts.description) as description, trx.receiver_type, clt.client_name, tel.telecom_name, trx.api_username, trx.currency, trx.message_encodng, 
trx.message_length, trx.sms_count, trx.client_price_per_unit, trx.client_price_total, trx.client_sender_id, 
trx.batch_id, trf.previous_balance, trf.usage, trf.after_balance from transaction_sms as trx left join country as cnt on trx.country_code = cnt.country_id 
left join client as clt on trx.client_id = clt.client_id left join transaction_status as sts on 
trx.status_code = sts.status_code left join transaction_sms_status as tss on tss.message_id = trx.message_id 
left join transaction_status as stx on tss.final_status = stx.status_code 
left join transaction_sms_financial as trf on trx.message_id = trf.message_id 
left join telecom as tel on tel.telecom_id = trx.telecom_id 
where trx.transaction_date >= '2020-11-30 00:00:00' and trx.transaction_date <= '2021-11-15 23:59:59' 
and (clt.upline_client_id = 'ZLT20112200501' or trx.client_id = 'ZLT20112200501');

select date_trunc('day', tx.transaction_date) as transaction_day, tx.client_id, cc.client_name, vs.vendor_name, tx.telecom_id,
sum(tx.sms_count) as sms_count, sum(tx.client_price_total) as price_total, tx.status_code, tx.vendor_trx_status 
from summary_trx_sms_vendor as tx left join client as cc on tx.client_id = cc.client_id 
left join vendor_sms as vs on tx.vendor_id = vs.vendor_id 
where transaction_date between '2022-09-13 00:00:00' and '2022-09-14 00:00:00' 
group by transaction_day, tx.client_id, cc.client_name, vs.vendor_name, tx.telecom_id, tx.status_code, 
tx.vendor_trx_status order by transaction_day desc;

select * 
from transaction_sms ts
where 
lower(api_username) like '%clp%'
and client_sender_id like '%*AUTOGEN62*%'
--and transaction_date >= '2021-07-01' and transaction_date <= '2021-12-31'
--order by transaction_date desc 
limit 30;

select r.routing_id, r.client_id, c.client_name, r.client_sender_id_id, cs.sender_id as client_sender_id,
r.telecom_id, t.telecom_name, r.vendor_id, v.vendor_name, r.vendor_sender_id_id, vs.sender_id as vendor_sender_id,
r.vendor_parameter_json, r.client_price_per_submit, r.client_price_per_delivery, r.vendor_price_per_submit,
r.vendor_price_per_delivery, r.currency_id, r.client_user_api, r.fake_dr, r.is_charged_per_dr, r.voice_unit_second,
r.voice_price_per_unit
from routing_table_sms as r
left join client as c on r.client_id = c.client_id
left join client_senderid_sms as cs on r.client_sender_id_id = cs.client_sender_id_id
left join telecom as t on r.telecom_id = t.telecom_id
left join vendor_sms as v on r.vendor_id = v.vendor_id
left join vendor_senderid_sms as vs on r.vendor_sender_id_id = vs.vendor_sender_id_id
where r.is_active = true order by r.routing_id;

select ts.read_admin_flag as read,ts.transaction_date, ts.message_id, ts.msisdn,
ts2.description as status, c.client_name, ts.client_price_total
from transaction_sms ts 
left join transaction_status ts2 on ts.status_code = ts2.status_code 
left join client c on ts.client_id = c.client_id 
order by ts.transaction_date limit 100;

select count(*) from transaction_sms ts limit 100;