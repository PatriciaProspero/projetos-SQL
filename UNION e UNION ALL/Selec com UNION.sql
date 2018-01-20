/*
	Restição: Deve possuir o mesmo tipo de dados, caso contrario não irá funcionar.

	Ou Seja:

	Cada declaração SELECT precisa ter o mesmo número de colunas, tipo de dados e ordem das colunas.

	Não é necessario o mesmo tipo de colunas e sim o memso tipo de dados.
*/
-- UNION Mostra as duas informações porem sem repetição

SELECT HireDate FROM Employees
UNION 
SELECT OrderDate FROM Orders

-- UNION ALL mostra as duas informações e com repetição

SELECT HireDate FROM Employees
UNION ALL
SELECT OrderDate FROM Orders
