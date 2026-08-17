USE dc_intermediate_sql;

/*
Select the title of every film that doesn't have a budget associated with it and
use the alias no_budget_info.
*/
SELECT
  title AS no_budget_info
FROM dbo.films
WHERE budget IS NULL;

/*
Count the number of films with a language associated with them and use the alias
count_language_known.
*/
SELECT
  COUNT(*) as count_language_known
FROM dbo.films
WHERE language IS NOT NULL;