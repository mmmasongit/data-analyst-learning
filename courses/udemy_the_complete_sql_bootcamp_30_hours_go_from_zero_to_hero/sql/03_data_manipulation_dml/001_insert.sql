USE udemy_the_complete_sql_bootcamp_30_hours_go_from_zero_to_hero;

-- Insert data into customers table
INSERT INTO dbo.customers
  (
  id,
  first_name,
  country,
  score
  )
VALUES
  (6, 'Anna', 'USA', NULL),
  (7, 'Sam', NULL, 100);

INSERT INTO dbo.customers
  (
  id,
  first_name,
  country,
  score
  )
VALUES
  (8, 'USA', 'MAX', NULL);

INSERT INTO dbo.customers
VALUES
  (9, 'Andreas', 'Germany', NULL);

INSERT INTO dbo.customers
  (
  id,
  first_name
  )
VALUES
  (10, 'Sahra');

-- Copy data from 'customers' table into 'persons'
INSERT INTO dbo.persons
  (
  id,
  person_name,
  birth_date,
  phone
  )
SELECT
  id,
  first_name,
  NULL AS birth_date,
  'Unknown' AS phone
FROM dbo.customers;

-- Retrieve all columns from customers
SELECT *
FROM dbo.customers;

-- Retrieve all columns from persons
SELECT *
FROM dbo.persons;