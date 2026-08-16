USE udemy_the_complete_sql_bootcamp_30_hours_go_from_zero_to_hero;

-- Retrieve all customers and sort the results by the highest score first
SELECT *
FROM dbo.customers
ORDER BY score DESC;

-- Retrieve all customers and sort the results by the lowest score first
-- ASC is default
SELECT *
FROM dbo.customers
ORDER BY score ASC;

/* 
Retrieve all customers and sort the results by the country and then by the
highest score. 
*/
SELECT *
FROM dbo.customers
ORDER BY
  country ASC,
  score DESC;