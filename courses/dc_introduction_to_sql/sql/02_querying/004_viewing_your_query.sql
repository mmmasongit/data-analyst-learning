USE dc_introduction_to_sql;
GO

-- Create a view called library_authors.
CREATE VIEW library_authors
AS
  SELECT DISTINCT author AS unique_author
  FROM books;
GO

/*
Check that the view was created by selecting all columns from library_authors.
*/
SELECT *
FROM dbo.library_authors;