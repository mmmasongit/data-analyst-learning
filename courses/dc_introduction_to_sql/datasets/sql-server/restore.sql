-- =============================================================================
-- Purpose:
--  Restores the target database
--
-- Warning:
--  Script won't work unless we set the absolute set for each bulk insert
--  according to location on other machines.
-- =============================================================================

USE master;
GO

IF DB_ID(N'dc_introduction_to_sql') IS NOT NULL
BEGIN
  ALTER DATABASE [dc_introduction_to_sql]
  SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

  DROP DATABASE [dc_introduction_to_sql];
END
GO

CREATE DATABASE [dc_introduction_to_sql];
GO

USE [dc_introduction_to_sql];
GO

-- =============================================================================
-- Schema: dbo
-- References:
-- |  - dbo.books
-- =============================================================================

-- References: None
IF OBJECT_ID(N'dbo.books', N'U') IS NOT NULL
  DROP TABLE dbo.books;
GO

-- =============================================================================
-- Table: dbo.books
-- =============================================================================

CREATE TABLE dbo.books
(
  id INT PRIMARY KEY,
  title NVARCHAR(255),
  author NVARCHAR(255),
  year INT,
  genre NVARCHAR(255)
);
GO

BULK INSERT dbo.books
FROM 'C:\Users\mmmas\Workspace\data-analyst-learning\courses\dc_introduction_to_sql\datasets\csv\books.csv'
WITH
(
  FORMAT = 'CSV',
  FIELDQUOTE = '"',
  FIELDTERMINATOR = ',',
  FIRSTROW = 2,
  KEEPNULLS,
  ROWTERMINATOR = '\n',
  TABLOCK
);
GO