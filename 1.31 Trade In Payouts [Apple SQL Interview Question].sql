/*
https://datalemur.com/questions/trade-in-payouts

Apple has a trade-in program where their customers can return the old iPhone device to Apple and Apple gives the customers the trade-in value (known as payout) of the device in cash.

For each store, write a query of the total revenue from the trade-in. Order the result by the descending order.

*/

-- Solution 1

SELECT tt.store_id,
       SUM(payout_amount) AS payout_total
FROM trade_in_transactions tt  
JOIN trade_in_payouts tp ON tt.model_id=tp.model_id
GROUP BY tt.store_id
ORDER BY payout_total DESC


-- Solution 2

SELECT DISTINCT
       tt.store_id,
       SUM(payout_amount) OVER(PARTITION BY tt.store_id) AS payout_total
FROM trade_in_transactions tt  
JOIN trade_in_payouts tp ON tt.model_id=tp.model_id
ORDER BY payout_total DESC
