USE dc_introduction_to_sql;

-- Select the title from the books table to view all book titles.
SELECT
  title
FROM dbo.books;

-- Select title and author from the books table.
SELECT
  title,
  author
FROM dbo.books;

-- Select all fields from the books table.
SELECT *
FROM dbo.books;