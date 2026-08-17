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
-- =============================================================================