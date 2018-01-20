/*
Fa�a uma function para verificar se um ano � bissexto ou n�o.

Utilize a regra: Um ano bissexto � divis�vel por 4, mas n�o por 100, ou ent�o se � divis�vel por 400.
Exemplo: 1988 � bissexto pois � divis�vel por 4 e n�o � por 100; 2000 � bissexto porque � divis�vel por 400.

Use o campo requireDate da tabela orders ou o campo birthDate da tabela employees para testar.
*/

CREATE OR ALTER FUNCTION Ano_Bissexto
(
	@AnoVerificar INT
)

RETURNS VARCHAR(255)
AS
BEGIN
	DECLARE 
		@AnoBissexto VARCHAR (255),
		@EmployeeID INT

SELECT 
	@AnoVerificar = YEAR(HireDate) 
FROM Employees
WHERE EmployeeID = @EmployeeID

	IF((@AnoVerificar % 4 = 0) And (@AnoVerificar % 100 <>0)) Or (@AnoVerificar % 400 = 0)
		SELECT @AnoBissexto = 'Ano Bissexto'
	ELSE
		SELECT @AnoBissexto ='Ano n�o Bissexto'

    RETURN @AnoBissexto
END;

-- TESTE DA FUN��O
/*
SELECT 
	dbo.Ano_Bissexto (YEAR(HireDate))
FROM Employees
WHERE EmployeeID=12
*/

