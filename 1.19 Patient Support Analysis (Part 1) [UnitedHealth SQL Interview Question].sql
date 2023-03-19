/*
https://datalemur.com/questions/frequent-callers

UnitedHealth has a program called Advocate4Me, which allows members to call an advocate and receive support for their health care needs – whether that's behavioural, clinical, well-being, health care financing, benefits, claims or pharmacy help.

Write a query to find how many UHG members made 3 or more calls. case_id column uniquely identifies each call made.

*/

-- Solution

WITH CTE1 AS (
SELECT COUNT(policy_holder_id) AS call_count
FROM callers
GROUP BY policy_holder_id
HAVING COUNT(policy_holder_id) >= 3)

SELECT COUNT(call_count) AS member_count
FROM CTE1
