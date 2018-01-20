/*
	No SQL Server, você pode fazer um INNER JOIN para juntar em uma consulta resultado de várias tabelas. Entretanto ao consultar uma outra tabela 
	com muitosresultados, a consulta pode demorar muito tempo.

	Com isto, no SQL Server, há o comando CROSS APPLY, onde você pode inserir uma query personalizada para realizar a consulta.

	Resumindo: 
	- CROSS APPLY - Similar ao INNER JOIN
	- OUTER APPLY - Similar ao LEFT JOIN 

	Com INNER JOIN, não teria como inserir o HAVING, nem realizar GROUP BY.

*/

-- Exemplo 1

 -- CROSS 

SELECT * 
  FROM Employees 
  CROSS APPLY (SELECT * 
                 FROM Orders 
                WHERE Employees.EmployeeID = Orders.EmployeeID) AS Funcionarios 

--Mesmo resultado usando o JOIN

SELECT * FROM Employees 
  INNER JOIN Orders 
   ON Employees.EmployeeID = Orders.EmployeeID  

-- OUTER 

SELECT * 
  FROM Employees
  OUTER APPLY (SELECT * 
                 FROM Orders 
                WHERE Employees.EmployeeID = Orders.EmployeeID ) AS AulaSsAluno 

--Mesmo resultado usando o JOIN

SELECT * 
  FROM Employees
  LEFT JOIN Orders 
   ON Employees.EmployeeID = Orders.EmployeeID

-- Exemplo 2

-- OUTER 

   SELECT * 
  FROM Employees 
 OUTER APPLY (SELECT OrderID, COUNT(1) AS Qfuncionarios
                 FROM Orders 
                WHERE Orders.EmployeeID = Employees.EmployeeID
                GROUP BY OrderID
               HAVING COUNT(1) > 4) AS Qfuncionarios

-- CROSS 

   SELECT * 
  FROM Employees 
 CROSS APPLY (SELECT OrderID, COUNT(1) AS Qfuncionarios
                 FROM Orders 
                WHERE Orders.EmployeeID = Employees.EmployeeID
                GROUP BY OrderID
               HAVING COUNT(1) > 4) AS Qfuncionarios
