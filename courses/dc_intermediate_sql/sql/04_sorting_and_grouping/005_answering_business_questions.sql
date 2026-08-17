USE dc_intermediate_sql;

-- Using the films table: which release_year had the most language diversity?
SELECT
  release_year,
  COUNT(DISTINCT(language)) AS count_language
FROM dbo.films
GROUP BY release_year
ORDER BY count_language DESC;