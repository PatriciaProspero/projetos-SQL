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

CREATE OR ALTER TRIGGER INSERE_ENDERECO_ANTIGO
ON Customers
AFTER INSERT
AS
BEGIN

	DECLARE
			@IDEndereco			VARCHAR(100),
			@IDCliente			VARCHAR (10),
			@Data_Alteracao		DATETIME,
			@Endereco_Antigo	VARCHAR (100)

	SELECT 
			@IDCliente = CONVERT(VARCHAR(10),CustomerID),		
			@Data_Alteracao = GETDATE(),
			@Endereco_Antigo = Address
	FROM INSERTED

	SET IDENTITY_INSERT dbo.Log_Address OFF

	INSERT INTO Log_Address (IDCliente,Data_Alteracao,Endereco_Antigo)
	VALUES (CONVERT(VARCHAR(10),@IDCliente),@Data_Alteracao,@Endereco_Antigo)

	SET @IDEndereco = @@IDENTITY

END;

SELECT * FROM Log_Address
SELECT * FROM Customers

INSERT INTO Customers (CustomerID,CompanyName,ContactName,ContactTitle,Address,City,Region,PostalCode,Country,Phone,Fax)
VALUES ('PATTY','PattyCila','Maria Aparecida','Lojas de Lacinhos','Rua Alfredo Issa 4','Berlin','SP','123456','Germani','030-0074321','(5) 555-3745')