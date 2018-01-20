/*
	Crie uma função que receba um número como parâmetro e imprima este número ao quadrado, ao cubo... Até a décima potencia.
*/

CREATE OR ALTER PROCEDURE Numero_Decima_Potencia
(
	@Numero VARCHAR (MAX)
)

AS
BEGIN

	DECLARE
		@Contador	NUMERIC (19) = 2,
		@Valor		NUMERIC (19)

	WHILE @Contador <= 10
		BEGIN
			SET @Valor = POWER (@Numero,@Contador)

			PRINT @Valor

			SET @Contador = @Contador + 1
		END
END;

EXEC dbo.Numero_Decima_Potencia 3

