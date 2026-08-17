USE dc_introduction_to_sql;

/*
Add an alias to the SQL query to rename the author column to unique_author in
the result set.
*/
SELECT DISTINCT author AS unique_author
FROM books;