/*
	Construa  um diagrama  de  blocos  para ler uma vari�vel num�rica N e imprimi-la somente se amesma for maior que 100, caso contr�rio imprimi-la com o valor zero
*/

CREATE OR ALTER PROCEDURE MAIOR_DO_QUE_100
(
	@NUMERO NUMERIC (10)
)
AS
BEGIN
	DECLARE 
		@RESULTADO NUMERIC;

	IF @NUMERO > 100
	BEGIN
		SET @RESULTADO = @NUMERO
	END
	ELSE
	BEGIN
		SET @RESULTADO = 0	
	END;

	PRINT @RESULTADO;
END;

EXEC MAIOR_DO_QUE_100 10