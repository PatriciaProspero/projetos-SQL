/*
Faça uma função que receba um número e retorne 32% do valor deste número. O retorno deve ser um número inteiro.
Ex: se o resultado der 12,3333 o correto é retornar 12.
*/

CREATE OR ALTER FUNCTION Retorna_Porcentagem
(
	@Numero NUMERIC
)

RETURNS VARCHAR (100)
AS
BEGIN

	SELECT @Numero = (@Numero * 32) /100 

	RETURN @Numero
END;

-- TESTE DA FUNÇÃO
/*
SELECT dbo.Retorna_Porcentagem (222)
*/

