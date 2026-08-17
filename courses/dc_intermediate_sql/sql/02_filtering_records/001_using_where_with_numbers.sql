USE dc_intermediate_sql;

/*
Select the film_id and imdb_score from the reviews table and filter on scores
higher than 7.0.
*/
SELECT
  film_id,
  imdb_score
FROM dbo.reviews
WHERE imdb_score > 7.0;

/*
Select the film_id and facebook_likes of the first ten records with less than
1000 likes from the reviews table.
*/
SELECT TOP(10)
  film_id,
  facebook_likes
FROM dbo.reviews
WHERE facebook_likes < 1000;

/*
Count how many records have a num_votes of at least 100,000; use the alias
films_over_100K_votes.
*/
SELECT
  COUNT(*) AS films_over_100k_votes
FROM dbo.reviews
WHERE num_votes >= 100000;