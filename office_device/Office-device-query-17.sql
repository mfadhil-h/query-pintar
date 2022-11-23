select count(*) from batchtogo_voice_personalized bvp 

select distinct c.client_name, uw.email_address, uw.username
FROM user_web uw 
left join client c on c.client_id = uw.client_id 
left join routing_table_sms rts on c.client_id = rts.client_id 
where rts.telecom_id in ('86003', '86004')
and (lower(uw.username) like 'clp%' or lower(uw.username) like 'thk%')