/*
1 - Fa�a uma fun��o que recebe um n�mero inteiro por par�metro e retorna verdadeiro se ele for par e falso se for �mpar.
*/

CREATE OR ALTER FUNCTION Numeros_Pares_e_Impares
(
	@Numero VARCHAR (100)
)

RETURNS VARCHAR(255)
AS
BEGIN

	SELECT @Numero = @Numero % 2 

	IF @Numero = 0
		SELECT @Numero = 'Verdadeiro'
	ELSE
		SELECT @Numero = 'Falso'

    RETURN @Numero
END;

-- TESTE DA FUN��O
/*
SELECT dbo.Numeros_Pares_e_Impares (55)
*/
