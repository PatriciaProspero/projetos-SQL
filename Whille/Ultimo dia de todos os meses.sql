/*
	Crie um la�o de repeti��o, com while, que seja executado em um total de 12 vezes e imprima na tela o total de dias do m�s referente aquela execu��o. 

	Por exemplo, na primeira vez o m�s ser� Janeiro, segunda vez o m�s ser� fevereiro...

	No output deve ficar algo do tipo:
	Jan - 31
	Fev - 30
	...
	Dez - 31
*/


DECLARE
	@Contador VARCHAR (50) = 1,-- Valor Default,
	@Mes VARCHAR (50),
	@Dias VARCHAR (50)

--Setar Valor
--SET @Contador = 1

WHILE @Contador < = 12
BEGIN

	SET @Mes =  DATENAME(MONTH, '2017 -'+@Contador+'- 01')

	SET @Dias = DAY(EOMONTH ( '2017 -'+@Contador+'-01'))

--Aparecer como tabela
	--SELECT @Mes + ' ' + @Dias AS Ultimo_Dia_do_M�s

	SET @Contador = @Contador + 1

-- Aparecer como texto
	PRINT @Mes + ' ' + @Dias

END;


