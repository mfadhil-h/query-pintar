select DATE_FORMAT(head.bill_date, "%d %M %Y") as date_transaction, merchant.merchant_name AS merchant_name,
branch.branch_name AS branch_name, SUM(head.`ppn`) AS daily_tax, COUNT(head.`bill_no`) AS daily_transaction
from header as head
join merchant on head.merchant_id = merchant.merchant_id
join branch on head.merchant_id = branch.merchant_id and head.branch_id = branch.branch_id
left join kecamatan on branch.kec_id = kecamatan.kec_id
where 
MONTH(head.bill_date) = '08' and
YEAR(head.bill_date) = '2021'
group by merchant_name, branch_name, date_transaction;