USE udemy_the_complete_sql_bootcamp_30_hours_go_from_zero_to_hero;

/*
Find the average score for each country considering only customers with a score
not equal to 0. Return only those countries with an average score greater than
430.
*/
SELECT
  country,
  AVG(score) AS average_score
FROM dbo.customers
WHERE score != 0
GROUP BY country
HAVING AVG(score) > 430;