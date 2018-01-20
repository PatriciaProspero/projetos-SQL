/*
	Este comando vai pegar o primeiro valor que aparecer sem ser nulo, caso o primeiro valor seja nulo ele passa para o proximo e verifica se é nulo,
	se for nulo ele passa para o segundo, se o segundo tiver valor ele pega esse valor, se o segundo tiver nulo ele passa para o terceiro.

	Verifica em ordem, o primeiro que tiver valor ele pega.

	Exemplo abaixo:

*/

-- Com Variavel

DECLARE 

@LastName VARCHAR (20) = 'OI',
@FirstName VARCHAR (20) = NULL,
@Title VARCHAR (20) = 'PATTY'


SELECT 
COALESCE(@LastName, @FirstName, @Title) AS FirstNotNull
FROM Employees;


-- Sem Variavel e com tabela

SELECT 
LastName, FirstName, Title,
COALESCE(LastName, FirstName, Title) AS Verificar_Resultado
FROM Employees;

--
-- Com variavel e tabela

DECLARE  
	@Nome VARCHAR (20)

SELECT @Nome = COALESCE(LastName, FirstName, Title) 
FROM Employees;

