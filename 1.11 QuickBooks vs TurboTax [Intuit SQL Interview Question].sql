/*
https://datalemur.com/questions/quickbooks-vs-turbotax

Intuit offers several tax filing products, such as TurboTax and QuickBooks, which come in multiple versions.
Write a query to find the total number of filings that used TurboTax, and the total number of filings that used QuickBooks.

Assumption:As reflected in the table, a user can only file taxes once a year using one product.

*/

-- Solution

SELECT 
SUM(CASE WHEN product LIKE '%TurboTax%' THEN 1 ELSE 0 END) AS turbotax_total,
SUM(CASE WHEN product LIKE '%QuickBooks%' THEN 1 ELSE 0 END) AS quickbooks_total
FROM filed_taxes
