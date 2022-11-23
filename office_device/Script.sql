SELECT MONTH(date) AS mo, 
       SUM(CASE 
         WHEN YEAR(date) = YEAR(DATE_ADD(now(), INTERVAL -2 YEAR)) THEN sales_total_idr 
         ELSE 0 
       END)          AS y1, 
       SUM(CASE 
         WHEN YEAR(date) = YEAR(DATE_ADD(now(), INTERVAL -1 YEAR)) THEN sales_total_idr 
         ELSE 0 
       END)           AS y2, 
       SUM(CASE 
         WHEN YEAR(date) = YEAR(now()) THEN sales_total_idr 
         ELSE 0 
       END)           AS y3 
FROM test.sales ts
GROUP BY MONTH(date)

SELECT MONTH(s.`date`) AS month, 
       SUM(CASE 
         WHEN YEAR(s.`date`) = 2017 THEN s.sales_total_idr 
         ELSE 0 
       END)          AS '2017', 
       SUM(CASE 
         WHEN YEAR(s.`date`) = 2018 THEN s.sales_total_idr 
         ELSE 0 
       END)           AS '2018'
FROM sales s 
GROUP BY MONTH(s.`date`);

;WITH sales_sum
AS
(
   SELECT s.`date`, SUM(s.sales_total_idr) as total_idr
   FROM test.sales s 
   GROUP BY s.`date`

), sales_sorted AS
(
   SELECT sales_sum.total_idr, sales_sum.`date`, 
   ROW_NUMBER() OVER(ORDER BY sales_sum.`date`) rownum
   FROM sales_sum
) 
SELECT (SELECT SUM(c2.total_idr) FROM sales_sorted c2 WHERE c2.rownum <= c1.rownum) total_increased,
  c1.total_idr, c1.`date`
FROM sales_sorted c1;