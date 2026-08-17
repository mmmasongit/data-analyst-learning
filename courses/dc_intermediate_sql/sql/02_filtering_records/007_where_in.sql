USE dc_intermediate_sql;

/*
Select the title and release_year of all films released in 1990 or 2000 that
were longer than two hours.
*/
SELECT
  title,
  release_year
FROM dbo.films
WHERE
  duration > 120
  AND
  release_year IN (1990, 2000);

/*
Select the title and language of all films in English, Spanish, or French using
IN.
*/
SELECT
  title,
  language
FROM dbo.films
WHERE language IN ('English', 'Spanish', 'French');

/*
Select the title, certification and language of all films certified NC-17 or R
that are in English, Italian, or Greek.
*/
SELECT
  title,
  certification,
  language
FROM
  films
WHERE
  certification IN ('NC-17', 'R')
  AND
  language IN ('English', 'Italian', 'Greek');