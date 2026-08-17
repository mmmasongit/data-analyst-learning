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
-- =============================================================================