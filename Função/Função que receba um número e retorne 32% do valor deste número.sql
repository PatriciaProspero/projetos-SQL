/*
Fa�a uma fun��o que receba um n�mero e retorne 32% do valor deste n�mero. O retorno deve ser um n�mero inteiro.
Ex: se o resultado der 12,3333 o correto � retornar 12.
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

-- TESTE DA FUN��O
/*
SELECT dbo.Retorna_Porcentagem (222)
*/

