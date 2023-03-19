/*
https://datalemur.com/questions/uncategorized-calls-percentage

UnitedHealth Group has a program called Advocate4Me, which allows members to call an advocate and receive support for their health care needs – whether that's behavioural, clinical, well-being, health care financing, benefits, claims or pharmacy help.

Calls to the Advocate4Me call centre are categorised, but sometimes they can't fit neatly into a category. These uncategorised calls are labelled “n/a”, or are just empty (when a support agent enters nothing into the category field).

Write a query to find the percentage of calls that cannot be categorised. Round your answer to 1 decimal place.
*/

-- Solution 1

SELECT 
ROUND((1.0*SUM(CASE WHEN call_category='n/a' THEN 1
     WHEN call_category IS NULL THEN 1 END)/COUNT(case_id))*100,1) AS call_percentage
FROM callers


-- Solution 2

WITH nullCte AS (
SELECT COUNT(*) AS nullCount
FROM callers
WHERE call_category IS NULL OR call_category = 'n/a'),
total_count AS (
SELECT COUNT(*) AS total_count
FROM callers)

SELECT ROUND((1.0*nullCount/total_count)*100,1)
FROM nullCte, total_count
