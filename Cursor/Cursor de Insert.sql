/*Cenario*/

/*Nossa aplica��o ir� doar pr�mios para funcion�rios com mais de 20 anos de empresa, cuja admiss�o foi em m�s �mpar.
Desenvolva um prodedimento que ser� executado toda vez que o bot�o da aplica��o for acionado e popule uma tabela para que 
--a aplica��o em seguida leia e mostre na tela o resultado.

ex:
id, data_contratacao, premio
1, 01/01/1991, premio 1
29, 01/11/1995, premio 2
106, 01/07/1994, premio 3

*/

-- Para selecionar a base completa, com todas as informa��es 

CREATE OR ALTER PROCEDURE premio_funionario_mais_20_anos

(
	@id					numeric = null,
	@data_contratacao	date = null
)
AS


DECLARE
	@Cur_Id		varchar(50),
	@Cur_Data	varchar(50),
	@Cur_i		int = 0

DECLARE CurFunc CURSOR FOR 

SELECT ID,
	   DATA_CONTRATACAO
FROM FUNCIONARIOS
WHERE DATEDIFF (YEAR,DATA_CONTRATACAO,GETDATE()) = 20 
	AND ( DATEPART(month,DATA_CONTRATACAO ))%2 <> 0 


OPEN CurFunc

FETCH NEXT FROM curFunc -- Busca o Proximo aqui que ele faz todo o processo de repeti��o
INTO @Cur_ID,@Cur_Data -- Aqui voc� precisa colocar exatamento igula a ordem do declare, se n�o ele da errado, pois ele n�o entende o nome e sim a posi��o

WHILE @@FETCH_STATUS = 0
BEGIN
--  set @i = @i + 1 - Pode ser feito das duas maneiras, tanto esta como a de baixo
	set @Cur_i += 1
	insert into premio_funcionarios_20_nos values(@Cur_Id, @Cur_Data, 'Premio ' + convert(varchar(50), @Cur_i) )


FETCH NEXT FROM CurFunc
INTO @Cur_ID, @Cur_Data
END

CLOSE CurFunc
DEALLOCATE CurFunc

-- Sempre dar o select antes de rodar o deletar, se n�o vai deletar antes de mostrar na tela
select * from premio_funcionarios_20_nos

-- Delete vai deletar todos os dados antes de rodar novamnete, para n�o poluir a base com os mesmos registros
delete premio_funcionarios_20_nos

-- exec premio_funionario_mais_20_anos

