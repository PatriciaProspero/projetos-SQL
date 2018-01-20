/* 
Enviar uma relação completa, em excel, na mesma relação contendo id, nome, data de nascimento, 
idade, data de contracao, tempo de contratacao 
*/

SELECT  
		EmployeeID, 
		FirstName +' '+ LastName AS NomeCompleto,
		CONVERT(CHAR,BirthDate,103) AS BirthDate,
		FLOOR(DATEDIFF (DAY,BirthDate,GETDATE()) / 365.25)AS AgeEmployee, 
		CONVERT(CHAR,HireDate,103) AS HireDate,
		FLOOR(DATEDIFF (DAY,HireDate,GETDATE()) /365.25) AS AgeHire
FROM dbo.employees


