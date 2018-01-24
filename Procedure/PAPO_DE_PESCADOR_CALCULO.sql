/*
	João  Papo-de-Pescador, homem de  bem, comprou  um microcomputador para controlar o rendimento  diário  de  seu  trabalho. 
	Toda  vez que  ele  traz um peso de peixes maior que oestabelecido  pelo  regulamento  depesca  do  estado  de  São  Paulo  
	(50  quilos)  deve  pagar uma  multa  de  R$  4,00  por  quilo  excedente.  
	
	João  precisa  que  você  faça  um diagrama  deblocos que leia a variável P (peso de peixes) e verifique se há excesso. Se houver, gravar na  
	variável  E  (Excesso)  e  na  variável  M  o  valor  da  multa  que  João  deverá  pagar.  Caso contrário mostrar tais variáveis com o conteúdo ZERO.
*/

CREATE OR ALTER PROCEDURE PAPO_DE_PESCADOR
(
	@PESO NUMERIC (19)
)
AS
BEGIN
	DECLARE
		@MULTA NUMERIC (19),
		@EXCESSO VARCHAR (30)

	IF @PESO > 50
		BEGIN
			SET @EXCESSO = 'Excesso';
			SET @MULTA =  (@PESO - 50) * 4
		END;

	IF @PESO < 50
		BEGIN
			SET @EXCESSO = 0;
			SET @MULTA = 0
		END;
	SELECT @EXCESSO AS EXCESSO,@MULTA AS MULTA
END;

EXEC PAPO_DE_PESCADOR 55