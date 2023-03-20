/*
https://datalemur.com/questions/sql-top-businesses

Assume you are given the table below containing information on user reviews. Write a query to obtain the number and percentage of businesses that are top rated. A top-rated busines is defined as one whose reviews contain only 4 or 5 stars.

Output the number of businesses and percentage of top rated businesses rounded to the nearest integer.

Assumption:

Each business has only one review (which is the business' average rating).

*/

-- Solution

WITH CTE1 AS (
SELECT COUNT(*) AS total_count
FROM reviews),
CTE2 AS (
SELECT COUNT(*) AS high_review_count
FROM reviews
WHERE review_stars IN (4,5))

SELECT high_review_count, 
ROUND(100.0*high_review_count/total_count,0) AS top_rated_pct
FROM CTE1, CTE2
