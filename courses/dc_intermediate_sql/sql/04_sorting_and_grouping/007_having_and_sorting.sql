USE dc_intermediate_sql;

/*
Select the country and the average budget as average_budget, rounded to two
decimal, from films.
Group the results by country.
Filter the results to countries with an average budget of more than one billion (1000000000).
Sort by descending order of the average_budget.
*/
SELECT
  country,
  ROUND(AVG(budget), 2) AS average_budget
FROM dbo.films
GROUP BY country
HAVING AVG(budget) > 1000000000
ORDER BY average_budget DESC;