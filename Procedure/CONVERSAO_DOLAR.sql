/*
	Construa  um diagrama de blocos que:

	�Leia a cota��o do d�lar
	�Leia um valor em d�lares
	�Converta esse valor para Real
	�Mostre o resultado
*/


CREATE OR ALTER PROCEDURE CONVERSAO_DOLAR
(
	@Valor_Dolar NUMERIC (19,2),
	@Cotacao_Dolar NUMERIC(19,2) -- Ir� ler a cota��o do dolar
)
AS
BEGIN

DECLARE 
	@Valor_Real VARCHAR(50)

SET @Valor_Real = @Valor_Dolar * @Cotacao_Dolar;
SET @Valor_Real = 'R$ '+ @Valor_Real;

SELECT @Valor_Real

END;

EXEC CONVERSAO_DOLAR 50,2.26