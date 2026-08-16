USE udemy_the_complete_sql_bootcamp_30_hours_go_from_zero_to_hero;

-- Delete all customers with an ID greater than 5.
DELETE FROM dbo.customers
WHERE id > 5;

-- Delete all data from table persons.
DELETE FROM dbo.persons;

-- Delete all data from table person without checks or logging.
TRUNCATE TABLE dbo.persons;

-- Retrieve all columns from customers
SELECT *
FROM dbo.customers;

-- Retrieve all columns from persons
SELECT *
FROM dbo.persons;