
-- ENVIAR EMAIL PARA ALUNOS NOVOS

/*
CREATE TABLE ALUNO
(
IDAluno INT,
Nome VARCHAR(100),
DataNascimento DATETIME
);

CREATE TABLE EnviaEmail
(
IdEmail INT IDENTITY(1,1),
Destinatario VARCHAR(200),
Assunto VARCHAR (200),
Corpo VARCHAR (MAX)
);

select * from ALUNO

select * from EnviaEmail
*/


CREATE OR ALTER TRIGGER UtrEnviaEmailAlunoNovo --CRIAR SUA TRIGGER - NOME DA TRIGGER
ON Aluno -- NA TABELA QUE VOCÊ DESEJA
FOR INSERT -- PODE SER NA HORA DE INSERIR/ALTERAR/EXCLUIR
AS
BEGIN
-- FAZER A AÇÃO QUE EU QUERO EXECUTR QUANDO ISSO ACONTECER
    DECLARE
    @IdAluno INT,
    @Nome   VARCHAR(100);

    SELECT @IdAluno = IDAluno,
		   @Nome = Nome
	FROM 
		INSERTED -- TABELA DO ALUNO QUE FOI INSERIDO

	INSERT INTO EnviaEmail
	(
		Destinatario,
		Assunto,
		Corpo
	)
	VALUES 
	(
	'patricia.prospero@hotmail.com',
	'Novo Aluno Cadastrado no Sistema',
	' Foi Cadastrado o Aluno RGM:' +' '+ convert(varchar(100),@IdAluno) + ' ' +'Nome:' + ' ' + @Nome
	)
END


