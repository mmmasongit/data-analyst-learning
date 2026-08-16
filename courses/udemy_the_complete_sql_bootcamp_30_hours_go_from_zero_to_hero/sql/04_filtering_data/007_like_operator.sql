USE udemy_the_complete_sql_bootcamp_30_hours_go_from_zero_to_hero;

-- Find all customers whose first name ends with 'n'.
SELECT *
FROM dbo.customers
WHERE first_name LIKE '%n';

-- Find all customers whose first name contains 'r'.
SELECT *
FROM dbo.customers
WHERE first_name LIKE '%r%';

-- Find all customers whose first name has 'r' in the 3rd position.
SELECT *
FROM dbo.customers
WHERE first_name LIKE '__r%';