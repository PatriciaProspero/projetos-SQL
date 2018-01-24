/*
	Ler um n�mero e verificar se ele � par ou �mpar. Quando for par armazenar esse valor em P e quando for �mpar armazen�-lo em I. 
	Exibir P e I no final do processamento.
*/

CREATE PROCEDURE ARMAZENAR_NUMEROS_PAR_IMPAR
(
	@NUMERO NUMERIC (10)
)
AS
BEGIN
	DECLARE
		@P NUMERIC (10),
		@I NUMERIC (10)

	IF @NUMERO % 2 = 0
	BEGIN
		SET @P = @NUMERO;
	END
	ELSE IF @NUMERO % 2 <> 0
	BEGIN
		SET @I = @NUMERO;
	END

	SELECT @P AS PAR, @I AS IMPAR

END;

EXEC ARMAZENAR_NUMEROS_PAR_IMPAR 4