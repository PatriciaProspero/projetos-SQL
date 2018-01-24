/*
	Tendo  como  dados  de  entrada  a  altura  e  o  sexo  de  uma  pessoa,  construa  um algoritmo  quecalcule seu peso ideal, utilizando as seguintes fórmulas:

	Para homens: (72.7*h) - 58
	Para mulheres: (62.1*h) - 44.7
	(h = altura)
*/

CREATE OR ALTER FUNCTION CALCULA_PESO
(
	@ALTURA NUMERIC (19,2),
	@SEXO VARCHAR (1)
)
RETURNS NUMERIC
AS BEGIN
	DECLARE
		@PESO_IDEAL NUMERIC (10,2);

	SELECT 
			@SEXO = SEXO,
			@ALTURA = ALTURA
	FROM PESSOA_QUALQUER;

	IF @SEXO = 'M'
		BEGIN
			SET @PESO_IDEAL = (72.7*@ALTURA) - 58
		END;

	IF @SEXO = 'F'
		BEGIN
			SET @PESO_IDEAL = (62.1*@ALTURA) - 44.7
		END;

	RETURN @PESO_IDEAL 
END;

SELECT DBO.CALCULA_PESO_HOMENS (ALTURA) FROM PESSOA_QUALQUER
WHERE SEXO = 'F'