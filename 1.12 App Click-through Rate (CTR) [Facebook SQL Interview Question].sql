/*
https://datalemur.com/questions/click-through-rate

Assume you have an events table on app analytics. Write a query to get the app’s click-through rate (CTR %) in 2022. 
Output the results in percentages rounded to 2 decimal places.

Notes:
Percentage of click-through rate = 100.0 * Number of clicks / Number of impressions
To avoid integer division, you should multiply the click-through rate by 100.0, not 100.

*/

-- Solution

SELECT app_id,
ROUND((100.0*SUM(CASE WHEN event_type='click' THEN 1 ELSE 0 END)/SUM(CASE WHEN event_type='impression' THEN 1 ELSE 0 END)),2) AS ctr
FROM events
WHERE EXTRACT('YEAR' FROM timestamp)=2022
GROUP BY app_id
