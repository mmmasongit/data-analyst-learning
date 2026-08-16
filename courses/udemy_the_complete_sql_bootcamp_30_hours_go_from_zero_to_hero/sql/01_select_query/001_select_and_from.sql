USE udemy_the_complete_sql_bootcamp_30_hours_go_from_zero_to_hero;

-- Retrieve All Customer Data
SELECT *
FROM dbo.customers;

-- Retrieve All Order Data
SELECT *
FROM dbo.orders;

-- Retrieve each customer's name, country, and score
SELECT
  first_name,
  country,
  score
FROM dbo.customers;