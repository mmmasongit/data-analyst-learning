USE dc_intermediate_sql;

-- Select the names of all people whose names begin with 'B'.
SELECT name
FROM dbo.people
WHERE name LIKE 'B%';

-- Select the names of people whose names have 'r' as the second letter.
SELECT name
FROM dbo.people
WHERE name LIKE '_r%';

-- Select the names of people whose names don't start with 'A'.
SELECT name
FROM dbo.people
WHERE name NOT LIKE 'A%';