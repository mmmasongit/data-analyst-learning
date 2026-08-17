USE dc_intermediate_sql;

-- Count the number of records contained in the reviews table.
SELECT
  COUNT(film_id) AS count_film_id
FROM dbo.reviews;