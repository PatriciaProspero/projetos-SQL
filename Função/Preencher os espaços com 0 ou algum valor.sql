-- PRENCHER OS ESPAÇOS COM 0.

CREATE FUNCTION ZerosEsquerda
(
	@Tamanho INT,
	@Valor VARCHAR (MAX)


)
RETURNS VARCHAR (MAX)
AS
BEGIN

	DECLARE 
		@Retorno VARCHAR (MAX)

		IF (LEN(@Valor) <= @Tamanho)
			SET @Retorno = REPLICATE ('0',@Tamanho - LEN(@Valor))
		ELSE 
			SET @Retorno = @Valor

	RETURN @Retorno
END;

-- VERIFICANDO 
-- SELECT dbo.ZerosEsquerda(11,123)
