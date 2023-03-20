/*
https://datalemur.com/questions/ad-campaign-roas

Google marketing managers are analyzing the performance of various advertising accounts over the last month. They need your help to gather the relevant data.

Write a query to calculate the return on ad spend (ROAS) for each advertiser across all ad campaigns. Round your answer to 2 decimal places, and order your output by the advertiser_id.

Hint: ROAS = Ad Revenue / Ad Spend

*/

-- Solution

SELECT advertiser_id,
       ROUND(CAST((SUM(revenue)/SUM(spend)) AS numeric),2)
FROM ad_campaigns 
GROUP BY advertiser_id
ORDER BY advertiser_id

