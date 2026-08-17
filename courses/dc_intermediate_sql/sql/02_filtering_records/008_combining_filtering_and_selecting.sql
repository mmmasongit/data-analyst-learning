USE dc_intermediate_sql;

/*
Count the unique titles from the films database and use the alias provided.
Filter to include only movies with a release_year from 1990 to 1999, inclusive.
Add another filter narrowing your query down to English-language films.
Add a final filter to select only films with 'G', 'PG', 'PG-13' certifications.
*/
SELECT
  COUNT(DISTINCT(title)) AS nineties_english_films_for_teens
FROM dbo.films
WHERE
  certification IN ('G', 'PG', 'PG-13')
  AND
  language = 'English'
  AND
  release_year BETWEEN 1990 AND 1999;