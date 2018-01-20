/*
	Crie uma fun��o que receba um n�mero como par�metro e imprima este n�mero ao quadrado, ao cubo... At� a d�cima potencia.
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

