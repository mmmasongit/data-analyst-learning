USE dc_intermediate_sql;

/*
Select the title and release_year of all films released between 1990 and 2000
(inclusive) using BETWEEN.
*/
SELECT
  title,
  release_year
FROM dbo.films
WHERE release_year BETWEEN 1990 AND 2000;

/*
Build on your previous query to select only films with a budget over $100
million.
*/
SELECT
  title,
  release_year
FROM dbo.films
WHERE
  budget > 100000000
  AND
  release_year BETWEEN 1990 AND 2000;

-- Now, restrict the query to only return Spanish-language films.
SELECT
  title,
  release_year
FROM dbo.films
WHERE
  budget > 100000000
  AND
  language = 'Spanish'
  AND
  release_year BETWEEN 1990 AND 2000;

/*
Finally, amend the query to include all Spanish-language or French-language
films with the same criteria.
*/
SELECT
  title,
  release_year
FROM
  films
WHERE 
  budget > 100000000
  AND
  language IN ('Spanish','French')
  AND
  release_year BETWEEN 1990 AND 2000;