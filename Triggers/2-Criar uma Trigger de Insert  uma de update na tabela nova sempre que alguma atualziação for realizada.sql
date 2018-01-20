/*
	- Problema

		A empresa está com problema pois alguns clientes(customers) estão mudando de endereço e as entregas antigas não podem ser rastreadas, 
		pois não se tem como checar o histórico de locais que aquele cliente já pertenceu, na determinada data.

	- Resolução

		Salvar as alterações em outra balea para historico com Triger

	- Material para execução

		Criar uma tabela para armazenar os logs de alteração
		Criar uma Trigger de Insert  uma de update na tabela nova sempre que alguma atualziação for realizada

		Na Tabela vamos precisar ter:
		
		 --- Endereço Antigo,
		 --- Data de alteração do enderço,
		 --- ID do Endereço,
		 --- ID da Pessoa

*/

--TABELA CRIADA

/*
	SELECT * FROM Customers
	SELECT * FROM Log_Address

	CREATE TABLE Log_Address
	(
		IDEndereço		INT IDENTITY(1,1)PRIMARY KEY,
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
