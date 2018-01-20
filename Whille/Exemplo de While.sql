DECLARE
	@Contador VARCHAR (50) = 1,
	@Numero NUMERIC (19) = 2

WHILE @Contador * 3 < = 100 
	BEGIN

		SET @Numero = (SELECT @Contador * 3  WHERE (@Contador % 2) <> 0)

		SET @Contador = @Contador + 1

		PRINT @Numero
	END