USE RecipesDemoDB
GO

IF NOT EXISTS(SELECT * FROM sys.symmetric_keys WHERE [name] = '##ms_databasemasterkey##')
BEGIN
    CREATE MASTER KEY ENCRYPTION BY PASSWORD = N'S0m3th1ng$tr0ng';
END
GO


