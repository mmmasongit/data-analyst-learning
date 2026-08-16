USE udemy_the_complete_sql_bootcamp_30_hours_go_from_zero_to_hero;

-- Retrieve all customers from Germany.
SELECT *
FROM dbo.customers
WHERE country = 'Germany';

-- Retrieve all customers who are not from Germany.
SELECT *
FROM dbo.customers
WHERE country != 'Germany';

-- Retrieve all customers with a score greater than 500.
SELECT *
FROM dbo.customers
WHERE score > 500;

-- Retrieve all customers with a score of 500 or more.
SELECT *
FROM dbo.customers
WHERE score >= 500;

-- Retrieve all customers with a score less than 500.
SELECT *
FROM dbo.customers
WHERE score < 500;

-- Retrieve all customers with a score of 500 or less.
SELECT *
FROM dbo.customers
WHERE score <= 500;