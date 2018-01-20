/*
Exercícios Sql Server
O script abaixo se refere a criação de uma tabela e a popular a mesma.
O script foi desenvolvido para o banco de dados Oracle.

1 - Adaptar o script para o banco de dados Sql Server.
(number -> numeric, to_date -> getDate, etc...)

2- Inserir estes dados no Sql Server.

3 - Fazer uma query que mostre id, nome e tempo de empresa de cada funcionário.

4 - Nossa aplicação irá doar prêmios para funcionários com mais de 20 anos de empresa, cuja admissão foi em mês ímpar.
Desenvolva um prodedimento que será executado toda vez que o botão da aplicação for acionado e popule uma tabela para que 
--a aplicação em seguida leia e mostre na tela o resultado.

ex:
id, data_contratacao, premio
1, 01/01/1991, premio 1
29, 01/11/1995, premio 2
106, 01/07/1994, premio 3
...

Para descobrir números ímpares e pares, utiliza-se a função módulo: SELECT 3%2, SELECT 10$3, SELECT 25%5, etc...  
*/


Create table premio_funcionarios_20_nos
(
	id numeric,
	data date,
	premios varchar(255)
)

----------------------------------------------

--Modo Patricia

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[premio_funionario_mais_20_anos]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[premio_funionario_mais_20_anos]
GO

create or alter procedure premio_funionario_mais_20_anos
(
	@id					numeric = null,
	@data_contratacao	date = null,
	@premios			varchar(255) = null
)
AS

declare 

@premios_contador varchar(255);

set @premios_contador ='Premio';

delete premio_funcionarios_20_nos

insert into premio_funcionarios_20_nos (id,data,premios)
			(select id,
			data_contratacao,
			premios =concat ('premio',' ',(row_number() over (order by NOME)))
			 from funcionarios
			 where  DATEDIFF (YEAR,data_contratacao,GETDATE()) = 20 and ( DATEPART(month,data_contratacao ))%2 <> 0 )

exec premio_funionario_mais_20_anos

select * from premio_funcionarios_20_nos

delete premio_funcionarios_20_nos

--------------------

--Modo Padova

DECLARE
	@funcId varchar(50),
	--@funcNome varchar(50),
	@i int = 0,
	@funcData varchar(50)

DECLARE curFunc CURSOR FOR 
	SELECT id /*nome*/, data_contratacao FROM master.dbo.funcionarios

OPEN curFunc

FETCH NEXT FROM curFunc
INTO @funcID, /*@funcNome*/ @funcData

WHILE @@FETCH_STATUS = 0
BEGIN
	/*PRINT @funcID +' ' +*/ --print @funcNome + ' Premio ' + convert(varchar(50), @i) + ' Data Contratacao: ' + @funcData
	
	--set @i = @i + 1
	--set @i++ 
	set @i += 1
	insert into premio_funcionarios_20_nos values(@funcId, @funcData, 'Premio ' + convert(varchar(50), @i) )


FETCH NEXT FROM curFunc
INTO @funcID, /*@funcNome*/ @funcData
END

CLOSE curFunc
DEALLOCATE curFunc

select * from premio_funcionarios_20_nos

delete premio_funcionarios_20_nos


