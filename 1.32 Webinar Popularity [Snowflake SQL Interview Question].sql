/*
https://datalemur.com/questions/snowflake-webinar-popularity

As a Data Analyst on Snowflake's Marketing Analytics team, you're analyzing the CRM to determine what percent of marketing touches were of type "webinar" in April 2022. Round your percentage to the nearest integer.

Did you know? Marketing touches, also known as touch points are the brand's (Snowflake's) point of contact with the customers, from start to finish.

*/

-- Solution 
SELECT 
ROUND(100.0*SUM(CASE WHEN event_type='webinar' THEN 1 ELSE 0 END)/COUNT(*),0) AS webinar_pct
FROM marketing_touches
WHERE EXTRACT(YEAR FROM event_date)=2022 AND
      EXTRACT(MONTH FROM event_date)=04
      
