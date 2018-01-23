/*
	Escreva um programa que receberá 2 números, de no máximo 2 caracteres cada.
	Este programa deve imprimir a multiplicação destes dois números no seguinte layout:
	Parâmetros passados: 9, 9
	##############
	#	81	#
	##############        
*/

CREATE OR ALTER PROCEDURE MULTIPLICACAO
(
	@NUMERO1 NUMERIC (2),
	@NUMERO2 NUMERIC (2)
)
AS
BEGIN
	DECLARE
		@RESULTADO VARCHAR (50);
	
	SET @RESULTADO = @NUMERO1 * @NUMERO2;

	PRINT '###############' +char(13)+char(10)
			+ '#  ' + @RESULTADO + '  #' +char(13)+char(10)
			+ '###############' 


END;

EXEC MULTIPLICACAO 2,2