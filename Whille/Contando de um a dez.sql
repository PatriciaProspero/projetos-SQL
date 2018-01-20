DECLARE
	@Contador VARCHAR (50) = 1 -- Valor Default,

-- Ou Setar Valor
--SET @Contador = 1

WHILE @Contador < = 10
BEGIN

	PRINT @Contador

	SET @Contador = @Contador + 1
END;


