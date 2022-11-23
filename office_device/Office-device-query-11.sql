SELECT pur.TrxId as trxid, OrderId as merchanttrxid, DateCreated as trxtime, SubscriberNumber as accountnumber, 
mer.MerchantName as merchantname, arfm.ARMName as merchantowner, jp.JatisProductName as product, bil.BillerName as billername,
arfb.ARMName as billerowner, bip.BillerProductName as billerproduct, BillerFee as baseprice, AddedPrice as addedprice, 
AdminFee as adminfee, JatisFee as jatisfee, BillerProductPrice as productfee, MerchantFee as merchantfee, TrxAmount as trxamount,
TotalTrxAmount as totaltrxamount, ps.PurchaseStatusDescription as billerstatus, coalesce('','') as paymentstatus, 
ps.BillerPurchaseStatus as billerrc, ps.BillerPurchaseStatusDescription as billerrd, ps.BillInfo as bill_info,
ps.BillerRealResponse as adddata
FROM switching.purchase as pur
left join (select MerchantSId, MerchantName, ARMId from merchant) as mer on pur.MerchantId = mer.MerchantId
left join (select BillerId, BillerName, ARMId from biller) as bil on pur.BillerId = bil.BillerId
left join (select ARMId, ARMName from arm) as arfm on mer.ARMId = arfm.ARMId
left join (select ARMId, ARMName from arm) as arfb on bil.ARMId = arfb.ARMId
left join (select BillerProductCode, BillerProductName from billerproduct) as bip on pur.BillerProductCode = bip.BillerProductCode
left join (select JatisProductCode, JatisProductName from jatisproduct) as jp on pur.JatisProductCode = jp.JatisProductCode
left join (select TrxId, PurchaseStatusDescription, BillerRealResponse, BillerPurchaseStatus, BillerPurchaseStatusDescription, BillInfo 
	from purchasestatus) as ps on pur.TrxId = ps.TrxId
where 
DateCreated between '2021-09-30 00:00:00' and '2021-10-09 23:59:59' and 
pur.JatisProductCode = 'BPJSKS' and 
ps.PurchaseStatusDescription = 'success'
order by DateCreated asc;
