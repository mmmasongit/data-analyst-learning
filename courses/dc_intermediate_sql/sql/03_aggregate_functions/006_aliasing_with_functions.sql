USE dc_intermediate_sql;

/*
Select the title and duration in hours for all films and alias as
duration_hours; since the current durations are in minutes, you'll need to
divide duration by 60.0.
*/
SELECT
  title,
  duration / 60.0 AS duration_hours
FROM dbo.films;

/*
Calculate the percentage of people who are no longer alive and alias the result
as percentage_dead.
*/
SELECT COUNT(deathdate) * 100.0 / COUNT(*) AS percentage_dead
FROM dbo.people;

/*
Find how many decades (period of ten years) the films table covers by using
MIN() and MAX(); alias as number_of_decades.
*/
SELECT (MAX(release_year) - MIN(release_year)) / 10.0 AS number_of_decades
FROM dbo.films;