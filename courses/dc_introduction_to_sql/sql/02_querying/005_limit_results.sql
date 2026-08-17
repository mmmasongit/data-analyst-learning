USE dc_introduction_to_sql;

/*
Select the genre field from the books table; limit the number of results to 10.
*/
SELECT TOP(10)
  genre
FROM
  dbo.books;