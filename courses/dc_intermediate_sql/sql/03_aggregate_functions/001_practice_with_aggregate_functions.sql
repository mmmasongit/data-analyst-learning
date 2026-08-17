USE dc_intermediate_sql;

/*
Use the SUM() function to calculate the total duration of all films and alias
with total_duration.
*/
SELECT SUM(duration) AS total_duration
FROM dbo.films;

-- Calculate the average duration of all films and alias with average_duration.
SELECT AVG(duration) as average_duration
FROM dbo.films;

/*
Find the most recent release_year in the films table, aliasing as latest_year.
*/
SELECT MAX(release_year) AS latest_year
FROM dbo.films;

-- Find the duration of the shortest film and use the alias shortest_film.
SELECT MIN(duration) AS shortest_film
FROM dbo.films;