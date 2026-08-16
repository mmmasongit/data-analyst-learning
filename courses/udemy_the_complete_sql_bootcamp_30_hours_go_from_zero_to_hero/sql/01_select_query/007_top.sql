USE udemy_the_complete_sql_bootcamp_30_hours_go_from_zero_to_hero;

-- Retrieve only 3 customers
SELECT TOP(3)
  *
FROM dbo.customers;

-- Retrieve the top 3 customers with the highest scores
SELECT TOP(3)
  *
FROM dbo.customers
ORDER BY score DESC;

-- Retrieve the lowest 2 customers based on the score
SELECT TOP(2)
  *
FROM dbo.customers
ORDER BY score ASC;

-- Get the two most recent orders
SELECT TOP(2)
  *
FROM dbo.orders
ORDER BY order_date DESC;