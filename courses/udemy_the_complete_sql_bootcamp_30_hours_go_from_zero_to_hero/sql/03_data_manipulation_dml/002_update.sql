USE udemy_the_complete_sql_bootcamp_30_hours_go_from_zero_to_hero;

-- Change the score of customer with ID 6 to 0.
UPDATE dbo.customers
SET score = 6
WHERE id = 6;

-- Change the score of customer with ID 10 to 0 and update the country to 'UK'.
UPDATE dbo.customers
SET
  country = 'UK',
  score = 0
WHERE id = 10;

-- Update all customers with a NULL score by setting their score to 0.
UPDATE dbo.customers
SET score = 0
WHERE score IS NULL;

-- Retrieve all columns from customers
SELECT *
FROM dbo.customers;