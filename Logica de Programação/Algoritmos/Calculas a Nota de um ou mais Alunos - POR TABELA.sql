/*

Cálculo da média de um aluno com descrição narrativa

Premissas:

Serão duas notas a serem verificadas, para que um aluno seja aprovado ele precisa ter a nota 6, se a nota for menos do que 6
ele será reprovado.

0 - Criar a tabela de Notas;
2 - Especificar o aluno, pelo codigo do aluno;
3 - Identificar a primeira Nota;
4 - Identificar a Segunda Nota;
5 - Somar as duas Notas;
6 - Fazer uma continha de dividir, neste caso por dois;
7 - Verificar se a nota foi menor ou igual a 6;

CREATE TABLE Notas
(
IDNota INT,
IdAluno INT,
NotaAluno1 NUMERIC,
NotaAluno2 NUMERIC
)

Insert Into Notas
Values (1,1,10,10);

Insert Into Notas
Values (2,2,7,2);

SELECT * FROM Notas

*/

-- Pela Tabela

CREATE or ALTER PROCEDURE ALUNOS_APROVADOS_
(
	@IDAluno int
)
AS
BEGIN

	DECLARE
		@NotaFinal	NUMERIC, -- Codigo do Aluno
		@NotaAluno1 NUMERIC, -- Nota 1 do Aluno
		@NotaAluno2 NUMERIC, -- Nota 1 do Aluno
		@Mensagem	VARCHAR (100) -- Mesnagem se o Aluno passou de ano ou não

	SELECT 
		 @NotaAluno1 = NotaAluno1,
		 @NotaAluno2 = NotaAluno2,
		 @NotaFinal = (@NotaAluno1 + @NotaAluno2) / 2
		FROM Notas
	WHERE IDAluno = @IDAluno

	-- Se o Aluno tirou uma nota menos que 6 irá aparecer para ele a mensagem de REPROVADO
	IF @NotaFinal < 6
		BEGIN
			SELECT @Mensagem =  'Aluno Reprovado'
		END
	-- Se não for menos que 6 vai aparecer a mensagem de erro APROVADO
		ELSE 
		BEGIN
			SELECT @Mensagem = 'Aluno Aprovado'
		END

	SELECT 
		@NotaFinal AS Nota_Final,
		@Mensagem AS Aprovado_ou_Reprovado

END;

-- EXEC ALUNOS_APROVADOS_  2

-- Sem Tabela, apenas com as notas, como se fosse uma calculadora

