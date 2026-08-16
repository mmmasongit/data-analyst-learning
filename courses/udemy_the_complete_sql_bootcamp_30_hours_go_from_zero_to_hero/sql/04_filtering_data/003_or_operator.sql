USE udemy_the_complete_sql_bootcamp_30_hours_go_from_zero_to_hero;

/*
Retrieve all customers who are either from USA or have a score greater than 500
*/
SELECT *
FROM dbo.customers
WHERE
  country = 'USA'
  OR
  score > 500;