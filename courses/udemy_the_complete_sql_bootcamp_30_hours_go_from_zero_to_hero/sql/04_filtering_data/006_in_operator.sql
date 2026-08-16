USE udemy_the_complete_sql_bootcamp_30_hours_go_from_zero_to_hero;

-- Retrieve all customers from either Germany OR USA.
SELECT *
FROM dbo.customers
WHERE country IN ('Germany', 'USA');