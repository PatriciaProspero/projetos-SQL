/*
	Desenvolva um diagrama que:

	•Leia 4 (quatro) números;
	•Calcule o quadrado de cada um;
	•Se o valor resultante do quadrado do terceiro for >= 1000, imprima-o e finalize;
	•Caso contrário, imprima os valores lidos e seus respectivos quadrados.
*/

CREATE OR ALTER PROCEDURE LEIA_4_NUMEROS
(
	@NUMERO1 NUMERIC (19),
	@NUMERO2 NUMERIC (19),
	@NUMERO3 NUMERIC (19),
	@NUMERO4 NUMERIC (19)
)
AS
BEGIN

	DECLARE 
		@RESULTADO VARCHAR (50);

	IF @NUMERO3 >= 1000
	BEGIN 

		SET @RESULTADO = @NUMERO1 * 2;
		
		SELECT @RESULTADO;

		SET @RESULTADO = @NUMERO2 * 2;
		
		SELECT @RESULTADO;

		SET @RESULTADO = @NUMERO3 * 2;

		SELECT @RESULTADO;
	END
	ELSE
		BEGIN
			SET @RESULTADO = @NUMERO1 * 2;
		
			SELECT @RESULTADO;

			SET @RESULTADO = @NUMERO2 * 2;
		
			SELECT @RESULTADO;

			SET @RESULTADO = @NUMERO3 * 2;

			SELECT @RESULTADO;

			SET @RESULTADO = @NUMERO4 * 2;
		
			SELECT @RESULTADO;
		END
END;

EXEC LEIA_4_NUMEROS 1,1,1000,7