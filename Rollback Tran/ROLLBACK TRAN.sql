-- EXEMPLO

BEGIN TRAN;

UPDATE ALUNO
SET Nome = 'Patricia Próspero de Souza'
WHERE IDAluno = 1;

-- Confirmar a sua alteração
COMMIT TRAN
-- Desfazer a sua alteração
ROLLBACK TRAN

-- Para Testar

SELECT * FROM ALUNO