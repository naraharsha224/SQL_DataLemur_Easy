/*

https://datalemur.com/questions/laptop-mobile-viewership

Assume that you are given the table below containing information on viewership by device type (where the three types are laptop, tablet, and phone). 
Define “mobile” as the sum of tablet and phone viewership numbers. 
Write a query to compare the viewership on laptops versus mobile devices.

Output the total viewership for laptop and mobile devices in the format of "laptop_views" and "mobile_views".
*/

-- Solution 1

SELECT 
SUM(CASE WHEN device_type='laptop' 
         THEN 1 ELSE 0 END) laptop_views,
SUM(CASE WHEN device_type IN ('tablet','phone')
         THEN 1 ELSE 0 END) mobile_views
FROM viewership

/*
Explanation
This is a SQL query that retrieves the total number of views for two different device types (laptops and mobile devices) from the "viewership" table.
The query uses the "SUM" function along with the "CASE" statement to calculate the number of views for each device type. 
The "CASE" statement is used to check whether each viewer's device type matches either 'laptop' or 'tablet'/'phone' values. 
If it does, then the "SUM" function counts that viewer as a view for that device type by adding either a 1 (if the device type matches) or a 0 (if it does not match).

The result of this query will show two columns: "laptop_views" and "mobile_views". 
The "laptop_views" column will display the total number of views from viewers using laptops, while the "mobile_views" column will display the total number of views from viewers using either tablets or phones.
*/

-- Solution 2

SELECT 
COUNT(CASE WHEN device_type='laptop' 
           THEN 1 ELSE NULL END) laptop_views,
COUNT(CASE WHEN device_type IN ('tablet','phone')
           THEN 1 ELSE NULL END) mobile_views
FROM viewership


-- Solution 3

SELECT 
    COUNT(*) FILTER (WHERE device_type='laptop') AS laptop_views,
    COUNT(*) FILTER (WHERE device_type IN ('tablet','phone')) AS mobile_views
FROM viewership;

/*

The FILTER clause applies a condition to an aggregate function, so that only the rows that satisfy the condition are used for the calculation.

In this case, we use two COUNT(*) functions to count the total number of rows that match each device type condition. 
The FILTER clause is used to count only the rows that match each condition, i.e. those where the device_type is either 'laptop' or 'tablet'/'phone'. 
The results are displayed in two columns, "laptop_views" and "mobile_views".

*/

