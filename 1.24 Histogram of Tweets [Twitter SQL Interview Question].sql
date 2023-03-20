/*
https://datalemur.com/questions/sql-histogram-tweets

Assume you are given the table below containing tweet data. Write a query to obtain a histogram of tweets posted per user in 2022. 
Output the tweet count per user as the bucket, and then the number of Twitter users who fall into that bucket.

*/

-- Solution

WITH CTE1 AS (
SELECT user_id, 
       COUNT(user_id) AS no_of_tweets
FROM tweets
WHERE EXTRACT(YEAR FROM tweet_date)=2022
GROUP BY user_id)

SELECT no_of_tweets AS tweet_bucket,
       COUNT(no_of_tweets) AS users_num
FROM CTE1 
GROUP BY no_of_tweets
