/*
	- Problema

		A empresa est� com problema pois alguns clientes(customers) est�o mudando de endere�o e as entregas antigas n�o podem ser rastreadas, 
		pois n�o se tem como checar o hist�rico de locais que aquele cliente j� pertenceu, na determinada data.

	- Resolu��o

		Salvar as altera��es em outra balea para historico com Triger

	- Material para execu��o

		Criar uma tabela para armazenar os logs de altera��o
		Criar uma Trigger de Insert  uma de update na tabela nova sempre que alguma atualzia��o for realizada

		Na Tabela vamos precisar ter:
		
		 --- Endere�o Antigo,
		 --- Data de altera��o do ender�o,
		 --- ID do Endere�o,
		 --- ID da Pessoa

*/

--TABELA CRIADA

/*
	SELECT * FROM Customers
	SELECT * FROM Log_Address

	CREATE TABLE Log_Address
	(
		IDEndere�o		INT IDENTITY(1,1)PRIMARY KEY,
		IDCliente		VARCHAR (10),
		Data_Alteracao	DATETIME,
		Endereco_Antigo VARCHAR (100)
	)
*/


CREATE OR ALTER TRIGGER ALTERA_ENDERECO
ON Customers
FOR UPDATE  
AS
BEGIN

	INSERT INTO Log_Address (IDCliente,Data_Alteracao,Endereco_Antigo)
	SELECT CustomerID,GETDATE(),Address FROM deleted
END;

---------------------------
/*
UPDATE Customers
SET Address = 'pp'
WHERE CustomerID = 'ALFKI'

SELECT * FROM Log_Address
SELECT * FROM Customers
*/
