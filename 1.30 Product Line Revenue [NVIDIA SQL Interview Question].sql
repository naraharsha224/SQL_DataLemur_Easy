/*
https://datalemur.com/questions/revenue-by-product-line

As a business analyst on the revenue forecasting team at NVIDIA, you are given a table of NVIDIA transactions in 2021.

Write a query to summarize the total sales revenue for each product line. The product line with the highest revenue should be at the top of the results.

Assumption: There will be at least one sale of each product line.
*/

-- Solution 1

SELECT p.product_line,
       SUM(t.amount) AS total_revenue
FROM product_info p  
JOIN transactions t ON p.product_id=t.product_id
GROUP BY p.product_line
ORDER BY total_revenue DESC


-- Solution 2

SELECT DISTINCT
       p.product_line,
       SUM(t.amount) OVER(PARTITION BY p.product_line) AS total_revenue
FROM product_info p  
JOIN transactions t ON p.product_id=t.product_id
ORDER BY total_revenue DESC
