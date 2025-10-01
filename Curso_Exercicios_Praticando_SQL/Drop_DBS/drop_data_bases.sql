USE master;
GO

-- Liste o que existe (dry-run)
SELECT name
FROM sys.databases
WHERE name IN (N'Exercicios_Agregacoes',
               N'Exercicios_Data',
               N'Exercicios_Sub_Consultas',
               N'SUCOS_FRUTAS');
GO

-- Força single_user e dropa cada uma se existir
DECLARE @dbs TABLE(name sysname);
INSERT INTO @dbs(name) VALUES
 (N'Exercicios_Agregacoes'),
 (N'Exercicios_Data'),
 (N'Exercicios_Sub_Consultas'),
 (N'SUCOS_FRUTAS');

DECLARE @sql nvarchar(max) = N'';

SELECT @sql = @sql + N'
IF DB_ID(N''' + name + N''') IS NOT NULL
BEGIN
    ALTER DATABASE ' + QUOTENAME(name) + N' SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE ' + QUOTENAME(name) + N';
END;'
FROM @dbs;

PRINT @sql; -- opcional: veja o que será executado
EXEC sp_executesql @sql;
GO
