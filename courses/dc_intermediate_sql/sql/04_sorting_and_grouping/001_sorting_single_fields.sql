USE dc_intermediate_sql;

-- Select the name of each person in the people table, sorted alphabetically.
SELECT name
FROM dbo.people
ORDER BY name;

/*
Select the title and duration for every film, from longest duration to shortest.
*/
SELECT
  title,
  duration
FROM dbo.films
ORDER BY duration DESC;