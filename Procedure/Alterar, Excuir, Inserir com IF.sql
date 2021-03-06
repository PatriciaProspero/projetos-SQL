if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[USP_MANTER_CLINETE]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[USP_MANTER_CLINETE]
GO

/* PARA PODER EXECUTAR O @@IDENTITY A TABELA DEVE SER CRIADA COM ELE.

CREATE TABLE TBLCLIENTES
(
ID_CLIENTE INT IDENTITY(1,1) PRIMARY KEY,
NOME VARCHAR (150),
ATIVO BIT,
DATA_CADASTRO DATE
);

 */

CREATE PROCEDURE USP_MANTER_CLINETE
(
@ACAO INT, -- 0 EXCLUIR, 1 INSERIR, 2 ALTERAR
@ID_CLIENTE		INT = NULL,
@NOME			VARCHAR (150) = NULL,
@ATIVO			BIT = NULL,
@DATA_CADASTRO	DATE = NULL

)
AS
BEGIN

IF @ACAO = 0 -- 0 EXCLUIR
	BEGIN
		DELETE FROM TBLCLIENTES
		WHERE ID_CLIENTE = @ID_CLIENTE

		SELECT @ID_CLIENTE AS RETORNO

	END
	ELSE IF @ACAO = 1 -- 1 INSERIR
		BEGIN
			INSERT INTO TBLCLIENTES (NOME,ATIVO,DATA_CADASTRO)
			VALUES (@NOME,@ATIVO,GETDATE())

			SELECT @@IDENTITY AS RETORNO

		END
	ELSE IF @ACAO = 2-- 2 ALTERAR
		BEGIN
			UPDATE  TBLCLIENTES
			SET NOME = @NOME,
				ATIVO = @ATIVO
			WHERE ID_CLIENTE = @ID_CLIENTE

			SELECT @@IDENTITY AS RETORNO

		END
		ELSE
			BEGIN
				RAISERROR ('A��O N�O IMPLEMENTADA', 14,1); --PADR�O PARA GERA��O DE ERRO
			END
END;

SELECT* FROM TBLCLIENTES

-- EXECUTAR PARA ATUALZIAR A PROC NO BANCO -- CONTROL + SHIFT + R
-- OBS: NUNCA DEIXAR O EXEC DE TESTE DENTRO DA PROC

EXEC USP_MANTER_CLINETE 1, NULL,'PATRICIA PROSPERO',1 --INSERIR

EXEC USP_MANTER_CLINETE 2, 1,'PATRICIA PROSPERO DE SOUZA',0 --ALTERAR

EXEC USP_MANTER_CLINETE 4, 1,'PATRICIA PROSPERO DE SOUZA',0 --MOSTRAR O ERRO

EXEC USP_MANTER_CLINETE 0, 1 --EXCLUIR
