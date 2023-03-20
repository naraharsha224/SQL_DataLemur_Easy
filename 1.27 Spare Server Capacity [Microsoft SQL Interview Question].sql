/*
https://datalemur.com/questions/sql-spare-server-capacity

Microsoft Azure's capacity planning team wants to understand how much data its customers are using, and how much spare capacity is left in each of its data centers. You’re given three tables: customers, data centers, and forecasted_demand.

Write a query to find each data centre’s total unused server capacity. Output the data center id in ascending order and the total spare capacity.

Definitions:
monthly_capacity is the total monthly server capacity for each centers.
monthly_demand is the server demand for each customer.

*/

-- Solution

SELECT dc.datacenter_id,
       dc.monthly_capacity-SUM(monthly_demand)  AS spare_capacity
FROM datacenters dc  
JOIN forecasted_demand fd ON fd.datacenter_id=dc.datacenter_id
GROUP BY dc.datacenter_id, dc.monthly_capacity
ORDER BY dc.datacenter_id ASC
