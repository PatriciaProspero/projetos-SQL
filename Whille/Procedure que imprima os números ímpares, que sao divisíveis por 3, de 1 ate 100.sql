/*
	Exercícios de loop:

	1 - crie uma procedure que imprima os números ímpares, que sao divisíveis por 3, de 1 ate 100.

*/
CREATE OR ALTER PROCEDURE Numeros_Impares
(
	@Numeros_Impares NUMERIC (19,2) = NULL
)

AS
BEGIN

DECLARE
	@Contador VARCHAR (50) = 1,
	@Numero NUMERIC (19)

WHILE @Contador * 3 < = 100 
	BEGIN

		SET @Numero = (SELECT @Contador * 3  WHERE (@Contador % 2) <> 0)

		SET @Contador = @Contador + 1

		PRINT @Numero
	END
END;

EXEC Numeros_Impares
