select m.merchant_name as 'Wajib Pajak', b.branch_name as 'Outlet', b.npwp as 'NPWP', b.nopd as 'NOPD', 
DATE_FORMAT(h.bill_date, '%d %M %Y') as 'Tanggal', FORMAT(h.total_amount, 2) as 'Total Amount', 
FORMAT(h.service, 2) as 'Service Charge', FORMAT(h.ppn, 2) as 'PPN', 
FORMAT(h.total_trx_amount , 2) as 'Total Trx Amount', h.payment_type as 'Payment Type'
from header h 
left join merchant m on m.merchant_id = h.merchant_id 
left join branch b on b.branch_id = h.branch_id and b.merchant_id = h.merchant_id 
where h.bill_date >= '2021-12-01 00:00:00' and h.bill_date <= '2022-01-01 00:00:00' 
-- where h.bill_date >= '2022-01-01 00:00:00' and h.bill_date <= '2022-02-01 00:00:00' 
order by 'Wajib Pajak', 'Tanggal' asc;