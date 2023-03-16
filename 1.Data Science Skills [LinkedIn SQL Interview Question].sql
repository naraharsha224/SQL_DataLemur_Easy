/*

Question URL : https://datalemur.com/questions/matching-skills

Given a table of candidates and their skills, you're tasked with finding the candidates best suited for an open Data Science job. 
You want to find candidates who are proficient in Python, Tableau, and PostgreSQL.

Write a query to list the candidates who possess all of the required skills for the job. Sort the output by candidate ID in ascending order.

Assumption: There are no duplicates in the candidates table.
*/



--Solution
SELECT candidate_id
FROM candidates
WHERE skill IN ('Python','Tableau','PostgreSQL')
GROUP BY candidate_id
HAVING COUNT(skill)=3
ORDER BY candidate_id ASC

/*
Explanation

1. SELECT candidate_id: This part of the query specifies the columns we want to select from the candidates table. 
     In this case, we only want to select the candidate_id column.

2. FROM candidates: This part of the query specifies the table we want to select data from. In this case, it's the candidates table.

3. WHERE skill IN ('Python', 'Tableau', 'PostgreSQL'): This part of the query specifies a condition that each row must meet in order to be included in the result set. 
     In this case, we're only interested in candidates who have skills in Python, Tableau, and PostgreSQL. 
     The IN operator checks whether the value of the skill column is contained within the list of skills we're interested in.

4. GROUP BY candidate_id: This part of the query groups the rows in the candidates table by their candidate_id. 
     This means that any rows with the same candidate_id will be considered as part of the same group.

5. HAVING COUNT(skill) = 3: This part of the query specifies a condition that each group must meet in order to be included in the result set. 
     In this case, we're only interested in groups that have exactly three different skills. 
     The COUNT function counts the number of distinct values in the skill column for each group.

6. ORDER BY candidate_id ASC: This part of the query specifies the order in which the rows should be returned. 
     In this case, we're ordering the rows by their candidate_id in ascending order.

So, in summary, the SQL query selects the candidate_id of candidates who have expertise in all three specified skills (Python, Tableau, and PostgreSQL), groups the candidates by their candidate_id, keeps only the groups that have exactly three skills, and sorts the results by candidate_id in ascending order.

*/



