/*
https://datalemur.com/questions/final-account-balance

Given a table of bank deposits and withdrawals, return the final balance for each account.
Assumption: All the transactions performed for each account are present in the table; no transactions are missing.
*/

-- Solution 1

SELECT account_id,
SUM(CASE WHEN transaction_type='Deposit' THEN amount
         WHEN transaction_type='Withdrawal' THEN (-amount) END) AS final_balance
FROM transactions
GROUP BY account_id


-- Solution 2

WITH CTE AS 
(SELECT account_id,
       SUM(CASE WHEN transaction_type='Deposit' THEN amount END) AS deposits,
       SUM(CASE WHEN transaction_type='Withdrawal' THEN amount END) AS withdrawals
FROM transactions
GROUP BY account_id)

SELECT account_id,
       (deposits-withdrawals) AS final_balance
FROM CTE 


-- Solution 3

SELECT account_id,
SUM(CASE WHEN transaction_type = 'Deposit' THEN amount ELSE 0 END)
- SUM(CASE WHEN transaction_type = 'Withdrawal' THEN amount ELSE 0 END) AS final_balance
FROM transactions
GROUP BY account_id
