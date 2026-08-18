-- =============================================================================
-- Restores the target database
-- =============================================================================

USE master;
GO

IF DB_ID(N'dc_intermediate_sql') IS NOT NULL
BEGIN
  ALTER DATABASE [dc_intermediate_sql]
  SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

  DROP DATABASE [dc_intermediate_sql];
END
GO

CREATE DATABASE [dc_intermediate_sql];
GO

USE [dc_intermediate_sql];
GO

-- =============================================================================
-- Schema: dbo
-- References:
-- |  - dbo.films
-- |  - dbo.people
-- |  - dbo.reviews
-- |  - dbo.roles
-- =============================================================================

-- References: dbo.films, dbo.people
IF OBJECT_ID(N'dbo.roles', N'U') IS NOT NULL
  DROP TABLE dbo.roles;
GO

-- References: dbo.films
IF OBJECT_ID(N'dbo.reviews', N'U') IS NOT NULL
  DROP TABLE dbo.reviews;
GO

-- References: None
IF OBJECT_ID(N'dbo.people', N'U') IS NOT NULL
  DROP TABLE dbo.people;
GO

-- References: None
IF OBJECT_ID(N'dbo.films', N'U') IS NOT NULL
  DROP TABLE dbo.films;
GO

-- =============================================================================
-- Table: dbo.films
-- Reference: None
-- =============================================================================

CREATE TABLE dbo.films
(
  id INT PRIMARY KEY,
  title NVARCHAR(255),
  release_year DECIMAL(5,1),
  country NVARCHAR(255),
  duration DECIMAL(4,1),
  language NVARCHAR(255),
  certification NVARCHAR(255),
  gross DECIMAL(12,2),
  budget DECIMAL(13,2)
);
GO

BULK INSERT dbo.films
FROM 'C:\Users\mmmas\Workspace\data-analyst-learning\courses\dc_intermediate_sql\datasets\csv\films.csv'
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

-- =============================================================================
-- Table: dbo.people
-- References: None
-- =============================================================================

CREATE TABLE dbo.people
(
  id INT PRIMARY KEY,
  name NVARCHAR(255),
  birthdate DATE,
  deathdate DATE
);
GO

BULK INSERT dbo.people
FROM 'C:\Users\mmmas\Workspace\data-analyst-learning\courses\dc_intermediate_sql\datasets\csv\people.csv'
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

-- =============================================================================
-- Table: dbo.reviews
-- References:
-- |  - dbo.films
-- =============================================================================

CREATE TABLE dbo.reviews
(
  id INT PRIMARY KEY,
  film_id INT,
  num_user DECIMAL(5,1),
  num_critic DECIMAL(4,1),
  imdb_score DECIMAL(9,8),
  num_votes INT,
  facebook_likes INT,

  -- Foreign key constraints
  CONSTRAINT FK_reviews_films
  FOREIGN KEY(film_id)
  REFERENCES dbo.films(id)
);
GO

BULK INSERT dbo.reviews
FROM 'C:\Users\mmmas\Workspace\data-analyst-learning\courses\dc_intermediate_sql\datasets\csv\reviews.csv'
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

-- =============================================================================
-- Table: dbo.roles
-- References:
-- |  - dbo.films
-- |  - dbo.people
-- =============================================================================

CREATE TABLE dbo.roles
(
  id INT PRIMARY KEY,
  film_id INT,
  person_id INT,
  role NVARCHAR(255),

  -- Foreign key constraints
  CONSTRAINT FK_roles_films
  FOREIGN KEY(film_id)
  REFERENCES dbo.films(id),

  CONSTRAINT FK_roles_people 
  FOREIGN KEY(person_id)
  REFERENCES dbo.people(id)
);
GO

BULK INSERT dbo.roles
FROM 'C:\Users\mmmas\Workspace\data-analyst-learning\courses\dc_intermediate_sql\datasets\csv\roles.csv'
WITH
(
  FORMAT = 'CSV',
  FIELDTERMINATOR = ',',
  FIRSTROW = 2,
  ROWTERMINATOR = '\n',
  KEEPNULLS,
  TABLOCK
);
GO