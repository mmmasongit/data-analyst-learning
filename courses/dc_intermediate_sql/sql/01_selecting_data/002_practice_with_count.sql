USE dc_intermediate_sql;

/*
Count the total number of records in the people table, aliasing the result as
count_records.
*/
SELECT
  COUNT(*) as count_records
FROM dbo.people;

-- Count the number of birthdates in the people table.
SELECT
  COUNT(birthdate) as count_birthdate
FROM dbo.people;

-- Count the records for languages and countries represented in the films table.
SELECT
  COUNT(language) AS count_languages,
  COUNT(country) AS count_countries
FROM dbo.films;