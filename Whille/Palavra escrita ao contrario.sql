/*
	Crie uma fun��o que receba uma palavra qualquer como par�metro, e retorne esta palavra escrita ao contrario.
*/
CREATE FUNCTION Palavra_Inversa
(
	@Palavra VARCHAR (100)
)

RETURNS VARCHAR (100)
AS
BEGIN

SET @Palavra =  REVERSE (@Palavra)

	RETURN @Palavra
END;

-- VERIFICANDO 
-- SELECT dbo.Palavra_Inversa('AMOR')
