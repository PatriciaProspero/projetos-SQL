/*
	Realizar uma trigger de auditoria na tabela Orders.

	A trigger deve armazenar em uma tabela chamada auditoria_orders, com todos os campos da tabela,com adição de um campo "alteração"
	que deverá ser populado com "I","D","U", referente a insert,delete ou update. Deve ser adicionado nesta tabela tamb´m o campo de data de evento.
	Para cada evento na tabela oreders,deve ser auditado nesta tabela auditoria_orders.
*/

-- CRIAR A TABELA DE AUDITORIA, IGUAL A TABELA ORDERS COM A ADIÇÃO DE UM CAMPO ALTERAÇÃO E DATA DA MODIFICAÇÃO.
/*
	CREATE TABLE Auditoria_Orders
	(
		AuditoriaID INT IDENTITY (1,1) PRIMARY KEY,
		OrderID INT,
		CustomerID NCHAR (100),
		EmployeeID INT,
		OrderDate DATETIME,
		RequiredDate DATETIME,
		ShippedDate DATETIME,
		ShipVia INT,
		Freight MONEY,
		ShipName NCHAR (100),
		ShipAddress NCHAR (100),
		ShipCity NCHAR (100),
		ShipRegion NCHAR (100),
		ShipPostalCode NCHAR (100),
		ShipCountry NCHAR (100),
		Alteracao NCHAR (100),
		Data_Alteracao DATETIME
	)
*/

CREATE OR ALTER TRIGGER Log_Auditoria
ON Orders
FOR UPDATE,INSERT,DELETE
AS 
BEGIN

	DECLARE 
			@AuditoriaID INT,
			@OrderID INT,
			@CustomerID NCHAR (100),
			@EmployeeID INT,
			@OrderDate DATETIME,
			@RequiredDate DATETIME,
			@ShippedDate DATETIME,
			@ShipVia INT,
			@Freight MONEY,
			@ShipName NCHAR (100),
			@ShipAddress NCHAR (100),
			@ShipCity NCHAR (100),
			@ShipRegion NCHAR (100),
			@ShipPostalCode NCHAR (100),
			@ShipCountry NCHAR (100),
			@Alteracao NCHAR (100),
			@Data_Alteracao DATETIME

	-- UPDATE
	IF EXISTS (SELECT * FROM INSERTED) AND EXISTS (SELECT * FROM DELETED)
		BEGIN
			SELECT
					@OrderID = OrderID,
					@CustomerID = CustomerID,
					@EmployeeID = EmployeeID,
					@OrderDate = OrderDate,
					@RequiredDate = RequiredDate,
					@ShippedDate = ShippedDate,
					@ShipVia = ShipVia,
					@Freight = Freight,
					@ShipName = ShipName,
					@ShipAddress = ShipAddress,
					@ShipCity = ShipCity,
					@ShipRegion = ShipRegion,
					@ShipPostalCode = ShipPostalCode,
					@ShipCountry = ShipCountry,
					@Data_Alteracao = GETDATE()
			FROM Deleted

				SET @Alteracao = 'U';
		END

	-- INSERT

	IF EXISTS (SELECT * FROM INSERTED) AND NOT EXISTS (SELECT * FROM DELETED)
		BEGIN
			SELECT
					@OrderID = OrderID,
					@CustomerID = CustomerID,
					@EmployeeID = EmployeeID,
					@OrderDate = OrderDate,
					@RequiredDate = RequiredDate,
					@ShippedDate = ShippedDate,
					@ShipVia = ShipVia,
					@Freight = Freight,
					@ShipName = ShipName,
					@ShipAddress = ShipAddress,
					@ShipCity = ShipCity,
					@ShipRegion = ShipRegion,
					@ShipPostalCode = ShipPostalCode,
					@ShipCountry = ShipCountry,
					@Data_Alteracao = GETDATE()
			FROM Inserted
				
				SET @Alteracao = 'I';
		END

	-- DELETE

	IF NOT EXISTS (SELECT * FROM INSERTED) AND EXISTS (SELECT * FROM DELETED)
		BEGIN
			SELECT
					@OrderID = OrderID,
					@CustomerID = CustomerID,
					@EmployeeID = EmployeeID,
					@OrderDate = OrderDate,
					@RequiredDate = RequiredDate,
					@ShippedDate = ShippedDate,
					@ShipVia = ShipVia,
					@Freight = Freight,
					@ShipName = ShipName,
					@ShipAddress = ShipAddress,
					@ShipCity = ShipCity,
					@ShipRegion = ShipRegion,
					@ShipPostalCode = ShipPostalCode,
					@ShipCountry = ShipCountry,
					@Data_Alteracao = GETDATE()
			FROM Deleted

				SET @Alteracao = 'D';
		END

	SET IDENTITY_INSERT dbo.Auditoria_Orders OFF

	INSERT INTO Auditoria_Orders
	(
			OrderID,
			CustomerID,
			EmployeeID,
			OrderDate,
			RequiredDate,
			ShippedDate,
			ShipVia,
			Freight,
			ShipName,
			ShipAddress,
			ShipCity,
			ShipRegion,
			ShipPostalCode,
			ShipCountry,
			Alteracao,
			Data_Alteracao
	)
VALUES 
	(
			@OrderID,
			@CustomerID,
			@EmployeeID,
			@OrderDate,
			@RequiredDate,
			@ShippedDate,
			@ShipVia,
			@Freight,
			@ShipName,
			@ShipAddress,
			@ShipCity,
			@ShipRegion,
			@ShipPostalCode,
			@ShipCountry,
			@Alteracao,
			@Data_Alteracao
	)

	SET @AuditoriaID = @@IDENTITY
END;

--------------------------------
--TESTE

SELECT * FROM Orders
SELECT * FROM Auditoria_Orders

UPDATE Orders
SET CustomerID = 'Patty'
WHERE OrderID = 10248

INSERT INTO Orders
VALUES ('PATTY',6,'19960704','19960801','19960716',3,'32,38','Vins et alcools Chevalier','59 rue de l Abbaye','Reims',NULL,51100,'France')


DELETE Orders
WHERE OrderID = 10248

