/*
	É o WHERE do GROUP BY.
	Utilizado para especificar uma condição no group by
	Exemplo logo abaixo:
*/
-- Sem WHERE

SELECT LetraId
FROM Aluno
GROUP BY LetraId
HAVING LetraId = 'E'

-- Com Where

SELECT LetraId
FROM Aluno
WHERE LetraId = 'E'
GROUP BY LetraId
