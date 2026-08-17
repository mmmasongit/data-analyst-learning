USE dc_introduction_to_sql;

-- Select only the unique authors from the books table.
SELECT DISTINCT author
FROM dbo.books;

/*
Update the code to return the unique author and genre combinations in the books
table.
*/
SELECT DISTINCT author, genre
FROM dbo.books;
