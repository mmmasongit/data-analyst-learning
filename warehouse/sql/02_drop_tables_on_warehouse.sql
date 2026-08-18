/*
Purpose:
  Drop all tables from user schemas except protected system schemas.
*/

DECLARE @SchemaName sysname;
DECLARE @TableName sysname;
DECLARE @SQL nvarchar(max);

DECLARE table_cursor CURSOR LOCAL FAST_FORWARD FOR
SELECT
  s.name AS schema_name,
  t.name AS table_name
FROM sys.tables AS t
  INNER JOIN sys.schemas AS s
  ON s.schema_id = t.schema_id
WHERE s.name NOT IN (
    'INFORMATION_SCHEMA',
    'db_accessadmin',
    'db_backupoperator',
    'db_datareader',
    'db_datawriter',
    'db_ddladmin',
    'db_denydatareader',
    'db_denydatawriter',
    'db_owner',
    'db_securityadmin',
    'guest',
    'sys'
)
ORDER BY
    s.name,
    t.name;

OPEN table_cursor;
FETCH NEXT FROM table_cursor INTO @SchemaName, @TableName;

WHILE @@FETCH_STATUS = 0
BEGIN
  SET @SQL =
        N'DROP TABLE '
        + QUOTENAME(@SchemaName)
        + N'.'
        + QUOTENAME(@TableName)
        + N';';

  PRINT N'Executing: ' + @SQL;
  EXEC sys.sp_executesql @SQL;

  FETCH NEXT FROM table_cursor INTO @SchemaName, @TableName;
END;

CLOSE table_cursor;
DEALLOCATE table_cursor;