/*
Purpose:
  Create required schemas if they don't exist.
*/

IF SCHEMA_ID(N'bronze') IS NULL
BEGIN
  EXEC(N'CREATE SCHEMA [bronze]');
  PRINT N'Schema bronze created.';
END
ELSE
BEGIN
  PRINT N'Schema bronze on warehouse already exists.';
END;

IF SCHEMA_ID(N'silver') IS NULL
BEGIN
  EXEC(N'CREATE SCHEMA [silver]');
  PRINT N'Schema silver created.';
END
ELSE
BEGIN
  PRINT N'Schema silver on warehouse already exists.';
END;

IF SCHEMA_ID(N'gold') IS NULL
BEGIN
  EXEC(N'CREATE SCHEMA [gold]');
  PRINT N'Schema gold created.';
END
ELSE
BEGIN
  PRINT N'Schema gold on warehouse already exists.';
END;