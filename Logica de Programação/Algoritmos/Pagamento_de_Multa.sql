/*
	João  Papo-de-Pescador, homem de  bem, comprou  um microcomputador para controlar o rendimento  diário  de  seu  trabalho. 
	Toda  vez que  ele  traz um peso de peixes maior que oestabelecido  pelo  regulamento  de pesca  do  estado  de  São  Paulo  (50  quilos)  deve  pagar 
	um  multa  de  R$  4,00  por  quilo  excedente.  João  precisa  que  você  faça  um diagrama  deblocos que leia a variável P (peso de peixes) e verifique 
	se há excesso. Se houver, gravar na  variável  E  (Excesso)  e  na  variável  M  o  valor  da  multa  que  João  deverá  pagar.  Caso contrário mostrar 
	tais variáveis com o conteúdo ZERO.
*/

CREATE OR ALTER PROCEDURE CALCULA_MULTA
(
	@QUILOS_PEIXE NUMERIC (19,2)
)
AS
BEGIN

	DECLARE 
		@QUILO_EXCEDENTE NUMERIC (19,2),
		@MULTA NUMERIC (19,2)

IF @QUILOS_PEIXE > 50
	BEGIN
	
		SET @QUILO_EXCEDENTE = @QUILOS_PEIXE - 50;
		SET @MULTA = @QUILO_EXCEDENTE * 4;

		SELECT @QUILO_EXCEDENTE AS Excesso;
		SELECT @MULTA AS Valor_da_Multa 
	END
	ELSE
		BEGIN

			SET @QUILO_EXCEDENTE = 0;
			SET @MULTA = 0 ;

			SELECT @QUILO_EXCEDENTE AS Excesso;
			SELECT @MULTA AS Valor_da_Multa 
		END
END;

EXEC CALCULA_MULTA 55.4