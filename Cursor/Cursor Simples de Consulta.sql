USE Estudos; -- Banco de dados que você vai utilizar
GO

DECLARE abc CURSOR FOR

SELECT * FROM Aluno;

OPEN abc;

FETCH NEXT FROM abc

WHILE (@@FETCH_STATUS = 0)

   FETCH NEXT FROM abc;

CLOSE abc;
DEALLOCATE abc;
GO