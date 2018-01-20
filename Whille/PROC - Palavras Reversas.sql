/*
	Crie uma função que receba uma palavra qualquer como parâmetro, e retorne esta palavra escrita ao contrario.
*/

CREATE OR ALTER PROCEDURE Letras_Inversas
(
	@Palavra VARCHAR (50)
)
AS
BEGIN

DECLARE
	@Contador	VARCHAR (50) = 0,
	@Armazenar	VARCHAR (10)

WHILE @Contador < = LEN(@Palavra)
	BEGIN
		SET @Armazenar = SUBSTRING(REVERSE(@Palavra), @Contador + 1,1)
	
		SET @Contador = @Contador + 1

		PRINT @Armazenar
		 
	END	
END;

EXEC Letras_Inversas 'AMOR'