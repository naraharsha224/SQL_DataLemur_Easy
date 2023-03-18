/*

https://datalemur.com/questions/sql-page-with-no-likes

Assume you are given the tables below about Facebook pages and page likes. Write a query to return the page IDs of all the Facebook pages that don't have any likes. 
The output should be in ascending order.
*/

-- Solution

SELECT page_id
FROM pages
WHERE page_id NOT IN (SELECT page_id 
                      FROM page_likes)
ORDER BY page_id ASC

/*

1. SELECT page_id: This part of the query specifies the columns we want to select from the pages table. In this case, we only want to select the page_id column.

2. FROM pages: This part of the query specifies the table we want to select data from. In this case, it's the pages table.

3. WHERE page_id NOT IN (SELECT page_id FROM page_likes): This part of the query specifies a condition that each row must meet in order to be included in the result set. 
   In this case, we're only interested in pages whose page_id is not present in the page_id column of the page_likes table. 
   The NOT IN operator checks whether the value of the page_id column in the pages table is not present in the page_id column of the page_likes table.

4. ORDER BY page_id ASC: This part of the query specifies the order in which the rows should be returned.
   In this case, we're ordering the rows by their page_id in ascending order.

5. So, in summary, the SQL query selects the page_id of pages that have not been liked by any user, filters the pages whose page_id is not present in the page_likes table, and sorts the results by page_id in ascending order.

*/
