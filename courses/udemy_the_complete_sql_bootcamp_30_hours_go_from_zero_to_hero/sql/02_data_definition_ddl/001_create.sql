USE udemy_the_complete_sql_bootcamp_30_hours_go_from_zero_to_hero;

/*
Create a new table called persons with columns: id, person_name, birth_date, and
phone.
*/
CREATE TABLE dbo.persons
(
  id INT NOT NULL,
  person_name VARCHAR(50) NOT NULL,
  birth_date DATE,
  phone VARCHAR(15) NOT NULL,
  CONSTRAINT pk_persons PRIMARY KEY (id)
);

-- Retrieve all columns from persons
SELECT *
FROM dbo.persons;