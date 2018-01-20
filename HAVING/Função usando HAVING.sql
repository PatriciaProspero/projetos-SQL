/*
	Utilizando o CROSS e OUTER APLLY em uma função

	Uma função pode ser chamada usando CROSS ou OUTER. Nestes exemplos, o SQL Server executa a parte inicial da query (SELECT * FROM Aula), 
	e para cada IdtAula retornado, ele executa a função que retorna um conjunto de linhas e são associadas às linhas da query inicial. 

	Este é um exemplo onde não é possível utilizar JOIN.
*/

-- Exemplo

CREATE FUNCTION dbo.retorna_exemplo
	(@EmployeeID AS INT)  

RETURNS TABLE 
AS 
RETURN (SELECT * 
          FROM Employees  
         WHERE EmployeeID = @EmployeeID) 


SELECT * 
  FROM Orders
 CROSS APPLY dbo.retorna_exemplo(EmployeeID) 
 ORDER BY LastName, FirstName

SELECT * 
  FROM Orders
 OUTER APPLY dbo.retorna_exemplo(EmployeeID) 
 ORDER BY LastName, FirstName

