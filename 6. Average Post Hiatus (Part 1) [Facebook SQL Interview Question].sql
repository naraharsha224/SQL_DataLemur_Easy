/*

https://datalemur.com/questions/sql-average-post-hiatus-1

Given a table of Facebook posts, for each user who posted at least twice in 2021, 
write a query to find the number of days between each user’s first post of the year and last post of the year in the year 2021. 
Output the user and number of the days between each user's first and last post.

*/


-- Solution 1

SELECT user_id,
       MAX(DATE(post_date)) - MIN(DATE(post_date)) AS days_between
FROM posts
WHERE EXTRACT('YEAR' FROM post_date) = 2021
GROUP BY user_id
HAVING COUNT(post_id)>=2

/*

SELECT user_id, MAX(DATE(post_date)) - MIN(DATE(post_date)) AS days_between: This selects the user_id and the number of days between the earliest and latest post_date in 2021 for each user who has at least 2 posts in 2021.
                                                                             The MAX function gets the latest post_date, the MIN function gets the earliest post_date, and the DATE function is used to extract the date part from the post_date timestamp. The result of MAX(DATE(post_date)) - MIN(DATE(post_date)) is the number of days between these two dates.

FROM posts: This specifies the table posts from which we are selecting data.

WHERE EXTRACT('YEAR' FROM post_date) = 2021: This filters the data to only include posts from 2021. The EXTRACT function is used to extract the year part from the post_date timestamp.

GROUP BY user_id: This groups the data by user_id, so that we get one row per user.

HAVING COUNT(post_id) >= 2: This filters the data to only include users who have at least 2 posts in 2021. The COUNT function is used to count the number of posts per user. The HAVING clause is used instead of WHERE because COUNT is an aggregate function that counts the number of rows in each group, and HAVING is used to filter the groups based on this count.


*/


-- Solution 2

SELECT user_id,
       EXTRACT('DAYS' FROM (MAX(post_date) - MIN(post_date))) AS days_between
FROM posts
WHERE post_date BETWEEN '01/01/2021' AND '12/31/2021'
GROUP BY user_id
HAVING COUNT(post_id)>=2
