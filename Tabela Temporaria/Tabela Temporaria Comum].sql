CREATE TABLE #TestePatty
(
IDAluno INT
)

DECLARE 
@IDAluno INT = 4,
@Nome VARCHAR (100) = 'Tayna Souza',
@DataNascimento DATETIME = '20003007'

INSERT INTO ALUNO (Nome,DataNascimento)
OUTPUT INSERTED.IDAluno INTO #TestePatty
VALUES (@Nome,GETDATE())

SELECT @IDAluno = IDAluno
FROM #TestePatty;


SELECT * FROM ALUNO
SELECT * FROM  #TestePatty