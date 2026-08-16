USE udemy_the_complete_sql_bootcamp_30_hours_go_from_zero_to_hero;

-- Retrieve all customers whose score falls in the range between 100 and 500.
SELECT *
FROM dbo.customers
WHERE score BETWEEN 100 AND 500;