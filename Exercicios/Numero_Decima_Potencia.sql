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
		@Contador	VARCHAR (50) = 2,
		@Valor		VARCHAR (50)

	WHILE @Contador <= 10
		BEGIN
			SET @Valor = POWER (@Numero,@Contador)

			PRINT @Numero +' ' +'Elevado a' +' '+ @Contador +' ' + '=' + ' ' + @Valor

			SET @Contador = @Contador + 1
		END
END;

EXEC dbo.Numero_Decima_Potencia 3

