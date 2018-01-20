/*
	Desenvolva um diagrama que:

	•Leia 4 (quatro) números;
	•Calcule o quadrado para cada um;
	•Somem todos;
	•Mostre o resultado;
*/

CREATE OR ALTER PROCEDURE CALCULO_QUADRADO
(
	@Numero1 NUMERIC (19,2),
	@Numero2 NUMERIC (19,2),
	@Numero3 NUMERIC (19,2),
	@Numero4 NUMERIC (19,2)
)
AS
BEGIN

DECLARE 
	@Resultado NUMERIC (19,2),
	@Calculo_Quadrado1 NUMERIC(19,2),
	@Calculo_Quadrado2 NUMERIC(19,2),
	@Calculo_Quadrado3 NUMERIC(19,2),
	@Calculo_Quadrado4 NUMERIC(19,2)

	SET @Calculo_Quadrado1 = @Numero1 * @Numero1;
	SET @Calculo_Quadrado2 = @Numero2 * @Numero2;
	SET @Calculo_Quadrado3 = @Numero3 * @Numero3;
	SET @Calculo_Quadrado4 = @Numero4 * @Numero4;
	SET @Resultado = @Calculo_Quadrado1 + @Calculo_Quadrado2 + @Calculo_Quadrado3 + @Calculo_Quadrado4;

	SELECT @Resultado AS Resultado

END;

EXEC CALCULO_QUADRADO 2,1,1,1