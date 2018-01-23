/*
	Escreva um programa que receber� 2 n�meros, de no m�ximo 2 caracteres cada.
	Este programa deve imprimir a multiplica��o destes dois n�meros no seguinte layout:
	Par�metros passados: 9, 9
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