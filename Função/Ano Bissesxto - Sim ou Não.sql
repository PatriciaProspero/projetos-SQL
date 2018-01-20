/*
Faça uma function para verificar se um ano é bissexto ou não.

Utilize a regra: Um ano bissexto é divisível por 4, mas não por 100, ou então se é divisível por 400.
Exemplo: 1988 é bissexto pois é divisível por 4 e não é por 100; 2000 é bissexto porque é divisível por 400.

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
		SELECT @AnoBissexto ='Ano não Bissexto'

    RETURN @AnoBissexto
END;

-- TESTE DA FUNÇÃO
/*
SELECT 
	dbo.Ano_Bissexto (YEAR(HireDate))
FROM Employees
WHERE EmployeeID=12
*/

