USE udemy_the_complete_sql_bootcamp_30_hours_go_from_zero_to_hero;

-- Retrieve customers with a score not equal to 0
SELECT *
FROM dbo.customers
WHERE score != 0;

-- Retrieve customers from Germany
SELECT *
FROM dbo.customers
WHERE country = 'Germany';