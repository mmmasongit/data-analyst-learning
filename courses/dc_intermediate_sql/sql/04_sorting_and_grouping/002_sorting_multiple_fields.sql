USE dc_intermediate_sql;

/*
Select the release_year, duration, and title of films ordered by their release
year and duration, in that order.
*/
SELECT
  release_year,
  duration,
  title
FROM dbo.films
ORDER BY
  release_year,
  duration;

/*
Select the certification, release_year, and title from films ordered first by
certification (alphabetically) and second by release year, starting with the
most recent year.
*/
SELECT
  certification,
  release_year,
  title
FROM dbo.films
ORDER BY
    certification,
    release_year;