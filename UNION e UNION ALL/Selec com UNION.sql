/*
	Resti��o: Deve possuir o mesmo tipo de dados, caso contrario n�o ir� funcionar.

	Ou Seja:

	Cada declara��o SELECT precisa ter o mesmo n�mero de colunas, tipo de dados e ordem das colunas.

	N�o � necessario o mesmo tipo de colunas e sim o memso tipo de dados.
*/
-- UNION Mostra as duas informa��es porem sem repeti��o

SELECT HireDate FROM Employees
UNION 
SELECT OrderDate FROM Orders

-- UNION ALL mostra as duas informa��es e com repeti��o

SELECT HireDate FROM Employees
UNION ALL
SELECT OrderDate FROM Orders
