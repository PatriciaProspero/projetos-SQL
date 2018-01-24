/*
	Jo�o  Papo-de-Pescador, homem de  bem, comprou  um microcomputador para controlar o rendimento  di�rio  de  seu  trabalho. 
	Toda  vez que  ele  traz um peso de peixes maior que oestabelecido  pelo  regulamento  depesca  do  estado  de  S�o  Paulo  
	(50  quilos)  deve  pagar uma  multa  de  R$  4,00  por  quilo  excedente.  
	
	Jo�o  precisa  que  voc�  fa�a  um diagrama  deblocos que leia a vari�vel P (peso de peixes) e verifique se h� excesso. Se houver, gravar na  
	vari�vel  E  (Excesso)  e  na  vari�vel  M  o  valor  da  multa  que  Jo�o  dever�  pagar.  Caso contr�rio mostrar tais vari�veis com o conte�do ZERO.
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