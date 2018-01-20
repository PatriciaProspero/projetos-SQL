/*
1 - Faça uma função que recebe um número inteiro por parâmetro e retorna verdadeiro se ele for par e falso se for ímpar.
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

-- TESTE DA FUNÇÃO
/*
SELECT dbo.Numeros_Pares_e_Impares (55)
*/
