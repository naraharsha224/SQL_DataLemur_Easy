/*
https://datalemur.com/questions/second-day-confirmation

New TikTok users sign up with their emails and each user receives a text confirmation to activate their account. 
Assume you are given the below tables about emails and texts.
Write a query to display the ids of the users who did not confirm on the first day of sign-up, but confirmed on the second day.

Assumption: action_date is the date when the user activated their account and confirmed their sign-up through the text.

*/

-- Solution 1

SELECT e.user_id
FROM emails e  
JOIN texts t ON t.email_id=e.email_id
WHERE t.action_date = (e.signup_date + interval '1 days') AND 
      t.signup_action = 'Confirmed'
      
 -- Solution 2
 
SELECT user_id FROM emails
inner join 
texts
on emails.email_id = texts.email_id 
where signup_action = 'Confirmed' and 
      cast(action_date as date) = cast(signup_date as date) + 1
