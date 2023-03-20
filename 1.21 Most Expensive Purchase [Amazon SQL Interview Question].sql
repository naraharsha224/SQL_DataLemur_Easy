/*
https://datalemur.com/questions/most-expensive-purchase

Amazon is trying to identify their high-end customers. To do so, they first need your help to write a query that obtains the most expensive purchase made by each customer. 
Order the results by the most expensive purchase first.

*/

-- Solution 1

SELECT customer_id,
       MAX(purchase_amount) AS purchased_amount
FROM transactions
GROUP BY customer_id
ORDER BY purchased_amount DESC


-- Solution 2

SELECT DISTINCT customer_id,
       MAX(purchase_amount) OVER(PARTITION BY customer_id) AS purchased_amount
FROM transactions
GROUP BY customer_id, purchase_amount
ORDER BY purchased_amount DESC


