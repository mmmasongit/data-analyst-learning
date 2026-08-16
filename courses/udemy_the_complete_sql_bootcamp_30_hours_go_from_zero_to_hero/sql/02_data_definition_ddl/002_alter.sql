USE udemy_the_complete_sql_bootcamp_30_hours_go_from_zero_to_hero;

-- Add a new column called email to the persons table
ALTER TABLE dbo.persons
ADD email VARCHAR(50) NOT NULL;

-- Retrieve all columns from persons
SELECT *
FROM dbo.persons;

-- Remove the column phone from the persons table
ALTER TABLE dbo.persons
DROP COLUMN phone;

-- Retrieve all columns from persons
SELECT *
FROM dbo.persons;