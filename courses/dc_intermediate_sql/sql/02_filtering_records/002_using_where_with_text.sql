USE dc_intermediate_sql;

/*
Select and count the language field using the alias count_spanish.
Apply a filter to select only Spanish from the language field.
*/
SELECT
  COUNT(language) AS count_spanish
FROM dbo.films
WHERE language = 'Spanish';