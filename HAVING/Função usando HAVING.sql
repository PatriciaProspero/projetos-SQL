/*
	Utilizando o CROSS e OUTER APLLY em uma fun��o

	Uma fun��o pode ser chamada usando CROSS ou OUTER. Nestes exemplos, o SQL Server executa a parte inicial da query (SELECT * FROM Aula), 
	e para cada IdtAula retornado, ele executa a fun��o que retorna um conjunto de linhas e s�o associadas �s linhas da query inicial. 

	Este � um exemplo onde n�o � poss�vel utilizar JOIN.
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

