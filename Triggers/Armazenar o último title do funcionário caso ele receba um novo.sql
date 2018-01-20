/*
Alterar a tabela employee e adicionar um campo chamado lastTitle.
Este campo deve armazenar o último title do funcionário caso ele receba um novo.
Crie uma trigger para resolver esta solicitação.
*/

CREATE OR ALTER TRIGGER Insere_Last_Title
ON Employees 
FOR UPDATE
AS
BEGIN
    DECLARE
    @LasTitle	VARCHAR (100),
	@EmployeeID INT

    SELECT 
		@LasTitle = Title,
		@EmployeeID = EmployeeID
	FROM Deleted 

	UPDATE Employees
	SET LasTitle = @LasTitle
	WHERE EmployeeID = @EmployeeID
END;
-----------------
UPDATE Employees
SET Title = 'bbbbbbbb'
WHERE EmployeeID = 12

select * from Employees
