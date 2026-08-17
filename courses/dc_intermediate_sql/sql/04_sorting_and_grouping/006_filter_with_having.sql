USE dc_intermediate_sql;

/*
Select country from the films table, and get the distinct count of certification
aliased as certification_count.
Group the results by country.
Filter the unique count of certifications to only results greater than 10.
*/
SELECT
  country,
  COUNT(DISTINCT(certification)) AS certification_count
FROM dbo.films
GROUP BY country
HAVING COUNT(DISTINCT(certification)) > 10;