select *--tracecode, trx_datetime, final_trx_status, acc_number_01, acc_number_02, serial_number 
from "transaction"
where trx_datetime between '2021-10-31 00:00:00' and '2021-11-30 23:59:59' and
client_id = 'ARRA20210531102137'
order by trx_datetime; 

select * from report_request_transaction rrt order by request_datetime desc limit 50;

select * from "transaction" t where client_id = 'PNK201118011115' 
order by trx_datetime desc limit 50;

select * from "transaction" t 
where product_code similar to '%(50|100)%'
order by t.trx_datetime asc;

select t.tracecode, t.trx_datetime, t.final_trx_status, t.acc_number_01, pi2.accnumber2 
from postpaid_inquiry pi2 
left join user_api ua on ua.username = pi2.username 
left join client c on c.client_id = ua.client_id 
left join "transaction" t on t.tracecode = pi2.tracecode 
where 
--c.client_name = 'Arthasera' 
--or 
c.client_id  = 'Danamon01'
and t.final_trx_status = '000'
--and t.trx_datetime between '2021-12-31 00:00:00' and '2022-01-15 23:59:59'
and t.trx_datetime between '2022-06-30 00:00:00' and '2022-07-31 23:59:59'
order by t.trx_datetime asc;

select trx_datetime, trx.client_id, trx.tracecode, acc_number_01, query_code, serial_number, client_name 
from "transaction" as trx
left join client as cl on trx.client_id = cl.client_id
where product_code in ('ASRBPJSKES','BPJSKS')
and acc_number_01 = '8888801260858418'
--and transaction_code = 'pasti-pembayaran'
--and final_trx_status = '000'
and user_id != 'PastiOke'
--and t.trx_datetime between '2022-01-11 00:00:00' and '2022-01-11 23:59:59'
order by t.trx_datetime asc;

select p.* from product p 
left join biller_product_category bpc on bpc.category_id = p.biller_product_category 
where
bpc.product_type = 'PREPAID_WITH_INQUIRY';

select ua.username, ua.password, ua.ip_address, ua.client_id, cc.client_group from user_api as ua 
left join client as cc on ua.client_id = cc.client_id where ua.active = true and cc.active = true
