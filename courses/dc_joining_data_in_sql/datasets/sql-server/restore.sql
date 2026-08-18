-- =============================================================================
-- Restores the target database
-- =============================================================================

USE master;
GO

IF DB_ID(N'dc_joining_data_in_sql') IS NOT NULL
BEGIN
  ALTER DATABASE [dc_joining_data_in_sql]
  SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

  DROP DATABASE [dc_joining_data_in_sql];
END
GO

CREATE DATABASE [dc_joining_data_in_sql];
GO

USE [dc_joining_data_in_sql];
GO

-- =============================================================================
-- Schema: dbo
-- References
-- |  - dbo.cities
-- |  - dbo.countries
-- |  - dbo.currencies
-- |  - dbo.economies
-- |  - dbo.economies2015
-- |  - dbo.economies2019
-- |  - dbo.eu_countries
-- |  - dbo.languages
-- |  - dbo.populations
-- |  - dbo.monarchs
-- |  - dbo.presidents
-- |  - dbo.prime_minister_terms
-- |  - dbo.prime_ministers
-- |  - dbo.states
-- =============================================================================

IF OBJECT_ID(N'dbo.cities', N'U') IS NOT NULL
  DROP TABLE countries.cities;
GO


-- =============================================================================
-- Table: dbo.cities
-- References:
-- =============================================================================

CREATE TABLE dbo.cities
(
  name VARCHAR,
  country_code VARCHAR,
  city_proper_pop VARCHAR,
  metroarea_pop VARCHAR,
  urbanarea_pop VARCHAR
);
GO

-- =============================================================================
-- Schema: leaders
-- =============================================================================

IF SCHEMA_ID(N'leaders') IS NOT NULL
  DROP SCHEMA leaders;
GO

CREATE SCHEMA leaders;
GO