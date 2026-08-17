USE dc_intermediate_sql;

/*
Select the release_year, country, and the maximum budget aliased as max_budget
for each year and each country; sort your results by release_year and country.
*/
SELECT
  release_year,
  country,
  MAX(budget) AS max_budget
FROM dbo.films
GROUP BY
  release_year,
  country;