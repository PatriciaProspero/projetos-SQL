-- EXEMPLO

BEGIN TRAN;

UPDATE ALUNO
SET Nome = 'Patricia Pr�spero de Souza'
WHERE IDAluno = 1;

-- Confirmar a sua altera��o
COMMIT TRAN
-- Desfazer a sua altera��o
ROLLBACK TRAN

-- Para Testar

SELECT * FROM ALUNO