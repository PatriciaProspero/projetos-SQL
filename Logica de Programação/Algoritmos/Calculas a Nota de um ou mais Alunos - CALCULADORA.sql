/*

Cálculo da média de um aluno com descrição narrativa

Premissas:

Serão duas notas a serem verificadas, para que um aluno seja aprovado ele precisa ter a nota 6, se a nota for menos do que 6
ele será reprovado.

0 - Criar a tabela de Notas;
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

-- Pela Calculadora, só com parametros

CREATE OR ALTER PROCEDURE Calculadora_Notas
(
	@Nota1 NUMERIC,
	@Nota2 NUMERIC
)
AS
BEGIN
	DECLARE 
		@NotaFinal NUMERIC,
		@Mensagem VARCHAR (50)

	SET @NotaFinal = (@Nota1 + @Nota2) / 2

	IF @NotaFinal < 6
		BEGIN
			SET @Mensagem = 'ALUNO REPROVADO'
	END
	ELSE
		SET @Mensagem = 'ALUNO APROVADO'

	SELECT 
		@NotaFinal AS NOTA_FINAL,
		@Mensagem AS ALUNO_APROVADO_OU_NÃO
END;

--Teste da PROC

--EXEC Calculadora_Notas 3,4