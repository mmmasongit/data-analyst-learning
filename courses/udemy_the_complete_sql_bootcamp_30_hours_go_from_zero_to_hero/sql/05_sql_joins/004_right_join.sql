USE udemy_the_complete_sql_bootcamp_30_hours_go_from_zero_to_hero;

--
SELECT
  c.id,
  c.first_name,
  o.order_id,
  o.sales
FROM dbo.customers AS c
  RIGHT JOIN dbo.orders AS o
  ON c.id = o.customer_id;

-- Retrieve all data from customers and orders in two different results.
SELECT *
FROM dbo.customers;
SELECT *
FROM dbo.orders;