/*
https://datalemur.com/questions/teams-power-users

Write a query to find the top 2 power users who sent the most messages on Microsoft Teams in August 2022. 
Display the IDs of these 2 users along with the total number of messages they sent. Output the results in descending count of the messages.

Assumption: No two users has sent the same number of messages in August 2022.

*/

-- Solution 1

SELECT sender_id,
       COUNT(*) AS message_count
FROM messages
WHERE sent_date BETWEEN '08/01/2022' AND '08/31/2022'
GROUP BY sender_id
ORDER BY message_count DESC
LIMIT 2

-- Solution 2

SELECT sender_id,
       COUNT(*) AS message_count
FROM messages
WHERE EXTRACT('YEAR' FROM sent_date)=2022 AND EXTRACT('MONTH' FROM sent_date)=08
GROUP BY sender_id
ORDER BY message_count DESC
LIMIT 2
