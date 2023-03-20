/*
https://datalemur.com/questions/linkedin-power-creators

The LinkedIn Creator team is looking for power creators who use their personal profile as a company or influencer page. If someone's LinkedIn page has more followers than the company they work for, we can safely assume that person is a power creator.

Write a query to return the IDs of these LinkedIn power creators ordered by the IDs.

Assumption: Each person with a LinkedIn profile in this database works at one company only.

*/

-- Solution

SELECT pp.profile_id
FROM personal_profiles pp
JOIN company_pages cp ON cp.company_id=pp.employer_id
GROUP BY pp.profile_id, pp.followers, cp.followers
HAVING pp.followers>cp.followers
ORDER BY pp.profile_id

