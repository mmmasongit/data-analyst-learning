USE dc_intermediate_sql;

/*
Update the query by adding ROUND() around the calculation and round to two
decimal places.
*/
SELECT
  title,
  ROUND(duration / 60.0, 2) AS duration_hours
FROM dbo.films;