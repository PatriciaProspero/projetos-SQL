/*
	Tendo  como  dados  de  entrada  a  altura  e  o  sexo  de  uma  pessoa,  construa  um algoritmo  quecalcule seu peso ideal, utilizando as seguintes fórmulas:

	Para homens: (72.7*h) - 58
	Para mulheres: (62.1*h) - 44.7
	(h = altura)
*/
CREATE OR ALTER PROCEDURE CALCULA_PESO_IDEAL
(
	@ALTURA NUMERIC (19,2),
	@SEXO VARCHAR (1)
)
AS BEGIN
	DECLARE
		@PESO_IDEAL NUMERIC (10,2)

	IF @SEXO = 'M'
		BEGIN
			SET @PESO_IDEAL = (72.7*@ALTURA) - 58
		END;
	IF @SEXO = 'F'
		BEGIN
			SET @PESO_IDEAL = (62.1*@ALTURA) - 44.7
		END;

	PRINT @PESO_IDEAL 
END;


EXEC CALCULA_PESO_IDEAL 1.58,'F'