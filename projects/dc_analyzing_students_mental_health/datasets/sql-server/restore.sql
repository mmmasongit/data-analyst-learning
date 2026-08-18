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
-- |  - dbo.students
-- =============================================================================

IF OBJECT_ID(N'dbo.students', N'U') IS NOT NULL
  DROP TABLE dbo.students;
GO

-- =============================================================================
-- Table: dbo.students
-- =============================================================================

CREATE TABLE dbo.students
(
  id INT PRIMARY KEY,
  title NVARCHAR(255),
  author NVARCHAR(255),
  year INT,
  genre NVARCHAR(255)
);
GO

BULK INSERT dbo.students
-- PATH: Absolute path and isn't portable between machines
FROM 'C:\Users\mmmas\Workspace\data-analyst-learning\projects\dc_analyzing_students_mental_health\datasets\csv\students.csv'
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