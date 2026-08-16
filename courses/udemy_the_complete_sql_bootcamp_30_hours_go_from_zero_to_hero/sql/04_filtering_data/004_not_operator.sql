USE udemy_the_complete_sql_bootcamp_30_hours_go_from_zero_to_hero;

-- Retrieve all customers with a score NOT less than 500
SELECT *
FROM dbo.customers
WHERE NOT score < 500;