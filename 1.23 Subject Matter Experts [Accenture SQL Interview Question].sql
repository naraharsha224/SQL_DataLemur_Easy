/*
https://datalemur.com/questions/subject-matter-experts

You are trying to identify all Subject Matter Experts at Accenture. An employee is a subject matter expert if they have 8 or more years of work experience in a given domain, or if they have 12 or more years of experience across 2 different domains.

Write a query to return the employee id of all the subject matter experts.

Notes: Question only asks for years of work experience across either 1 or 2 domains. You may disregard cases where an employee has years of experience in more than 2 domains.
*/

-- Solution 1

WITH CTE1 AS (
SELECT employee_id, COUNT(employee_id), SUM(years_of_experience) AS total_exp
FROM employee_expertise
GROUP BY employee_id
HAVING COUNT(employee_id)<3)

SELECT employee_id
FROM CTE1
WHERE total_exp>8


-- Solution 2

select employee_id 
from employee_expertise
group by employee_id
having (sum(years_of_experience) >=8
       and count(domain)=1)
       or (sum(years_of_experience) >=12
       and count(domain)=2)


-- Solution 3

select employee_id 
from employee_expertise
group by employee_id
having sum(years_of_experience) >=8
       and count(domain)=1
UNION 
select employee_id 
from employee_expertise
group by employee_id
having sum(years_of_experience) >=12
       and count(domain)=2
