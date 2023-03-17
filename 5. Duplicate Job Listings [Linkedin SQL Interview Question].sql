/*

https://datalemur.com/questions/duplicate-job-listings

Assume you are given the table below that shows job postings for all companies on the LinkedIn platform. 
Write a query to get the number of companies that have posted duplicate job listings.

Clarification: Duplicate job listings refer to two jobs at the same company with the same title and description.

*/

-- Solution

SELECT COUNT(duplicate) AS co_w_duplicate_jobs
FROM(
     SELECT COUNT(company_id) AS duplicate
     FROM job_listings
     GROUP BY company_id, title, description) A
WHERE duplicate >= 2

/*

The query starts by selecting the count of duplicates in job listings and assigning it an alias name "co_w_duplicate_jobs". 
The SELECT statement consists of only one column, which is the COUNT() function applied to the column named "duplicate".

The column named "duplicate" is created by using a subquery. The subquery selects the count of job listings for each combination of company_id, title, and description. It groups the results by those three columns using the GROUP BY clause.

The subquery is given an alias "A". It is used in the outer query to filter the results that have duplicate records. 
The outer query uses the WHERE clause to specify that only records with a count of duplicates greater than or equal to 2 should be counted.

*/
