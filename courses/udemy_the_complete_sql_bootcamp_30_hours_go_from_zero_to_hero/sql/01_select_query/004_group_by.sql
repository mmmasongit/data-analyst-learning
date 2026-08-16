USE udemy_the_complete_sql_bootcamp_30_hours_go_from_zero_to_hero;

-- Find the total score for each country
SELECT
  country,
  SUM(score) AS total_score
FROM dbo.customers
GROUP BY country;

-- Find the total score and total number of customers for each country
SELECT
  country,
  SUM(score) AS total_score,
  COUNT(id) AS total_customers
FROM dbo.customers
GROUP BY country;