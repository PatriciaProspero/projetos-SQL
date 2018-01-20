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