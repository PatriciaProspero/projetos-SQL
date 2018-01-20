CREATE OR ALTER PROCEDURE Tabuada
(
	@Numero NUMERIC (19)
)

AS
BEGIN

DECLARE
	@Contador VARCHAR (50) = 1 -- Valor Default,

-- Ou Setar Valor
--SET @Contador = 1

WHILE @Contador < = 10
BEGIN

	SELECT @Contador * @Numero

	PRINT @Contador

	SET @Contador = @Contador + 1
END
END;


EXEC Tabuada 3