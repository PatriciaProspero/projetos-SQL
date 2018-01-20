CREATE OR ALTER FUNCTION Idade_TempodeCasa
(
	@Data DATETIME
)

RETURNS VARCHAR (50)
AS
BEGIN

	DECLARE 
		@Retorno VARCHAR (50)

		SET @Retorno = FLOOR(DATEDIFF(DAY,@Data,GETDATE())/365.25)

	RETURN @Retorno
END;

--TESTE

 --SELECT dbo.Idade_TempodeCasa('1994-05-02')

 /*
 SELECT  
		EmployeeID, 
		FirstName +' '+ LastName AS NomeCompleto,
		CONVERT(CHAR,BirthDate,103) AS BirthDate,
		dbo.Idade_TempodeCasa(BirthDate) AS AgeEmployee, 
		CONVERT(CHAR,HireDate,103) AS HireDate,
		dbo.Idade_TempodeCasa(HireDate) AS AgeHire
FROM dbo.employees
*/
