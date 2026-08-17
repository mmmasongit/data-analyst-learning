USE dc_intermediate_sql;

/*
Select the release_year and count of films released in each year aliased as\
film_count.
*/
SELECT
  release_year,
  COUNT(*) AS film_count
FROM dbo.films
GROUP BY release_year;

/*
Select the release_year and average duration aliased as avg_duration of all
films, grouped by release_year.
*/
SELECT
  release_year,
  AVG(duration) AS avg_duration
FROM dbo.films
GROUP BY release_year;