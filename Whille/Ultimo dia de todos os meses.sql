/*
	Crie um laço de repetição, com while, que seja executado em um total de 12 vezes e imprima na tela o total de dias do mês referente aquela execução. 

	Por exemplo, na primeira vez o mês será Janeiro, segunda vez o mês será fevereiro...

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
	--SELECT @Mes + ' ' + @Dias AS Ultimo_Dia_do_Mês

	SET @Contador = @Contador + 1

-- Aparecer como texto
	PRINT @Mes + ' ' + @Dias

END;


