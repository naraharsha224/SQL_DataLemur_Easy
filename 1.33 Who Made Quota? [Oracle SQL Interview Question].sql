/*
https://datalemur.com/questions/oracle-sales-quota

As a data analyst on the Oracle Sales Operations team, you are given a list of salespeople’s deals, and the annual quota they need to hit.

Write a query that outputs each employee id and whether they hit the quota or not ('yes' or 'no'). Order the results by employee id in ascending order.

Definitions:
deal_size: Deals acquired by a salesperson in the year. Each salesperson may have more than 1 deal.
quota: Total annual quota for each salesperson.

*/

-- Solution

WITH CTE1 AS (
SELECT employee_id, SUM(deal_size) AS deal_total
FROM deals 
GROUP BY employee_id)

SELECT s.employee_id,
       CASE WHEN deal_total>=quota THEN 'yes' ELSE 'no' END AS made_quota
FROM sales_quotas s  
JOIN CTE1 ON CTE1.employee_id=s.employee_id
ORDER BY s.employee_id
