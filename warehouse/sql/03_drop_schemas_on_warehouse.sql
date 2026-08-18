/*
Purpose:
  Drop all user schemas not related to database and keep bronze, silver, gold.
*/

DECLARE @SchemaName NVARCHAR(128);
DECLARE @SQL        NVARCHAR(MAX);

DECLARE schema_cursor CURSOR FOR
SELECT name
FROM sys.schemas
WHERE
  name NOT IN (
    'INFORMATION_SCHEMA',
    'bronze',
    'db_accessadmin',
    'db_backupoperator',
    'db_datareader',
    'db_datawriter',
    'db_ddladmin',
    'db_denydatareader',
    'db_denydatawriter',
    'db_owner',
    'db_securityadmin',
    'dbo',
    'gold',
    'guest',
    'silver',
    'sys'
  )
  AND
  principal_id = USER_ID('dbo');

OPEN schema_cursor;
FETCH NEXT FROM schema_cursor INTO @SchemaName;

WHILE @@FETCH_STATUS = 0
BEGIN
  SET @SQL =
        N'DROP SCHEMA '
        + QUOTENAME(@SchemaName)
        + N';';

  PRINT N'Executing: ' + @SQL;
  EXEC sys.sp_executesql @SQL;

  FETCH NEXT FROM schema_cursor INTO @SchemaName;
END;

CLOSE schema_cursor;
DEALLOCATE schema_cursor;