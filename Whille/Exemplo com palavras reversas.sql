
DECLARE
	@Contador	VARCHAR (50) = 0,
	@Armazenar	VARCHAR (10),
	@Palavra	VARCHAR (50) = 'Patricia'

WHILE @Contador < = LEN(@Palavra)
	BEGIN

	SET @Armazenar = SUBSTRING(REVERSE(@Palavra), @Contador + 1,1)
	
	SET @Contador = @Contador + 1 

	PRINT @Armazenar
	END

	