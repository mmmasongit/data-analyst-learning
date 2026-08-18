/*
Purpose:
  Create database if it doesn't exist.
*/

IF DB_ID(N'warehouse') IS NULL
BEGIN
  EXEC(N'CREATE DATABASE [warehouse]');
  PRINT N'Database warehouse created.';
END
ELSE
BEGIN
  PRINT N'Database warehouse already exists.';
END;