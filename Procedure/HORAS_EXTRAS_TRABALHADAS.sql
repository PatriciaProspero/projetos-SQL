/*
	Elabore  um  diagrama  de  bloco  que  leia  a  vari�veL C N,  respectivamente n�mero  de  horas  trabalhadas  de  um  oper�rio.  
	E calcule  o  sal�rio  sabendo-se  que  ele ganha  R$  10,00  por hora. Quando  o  n�mero  de horas exceder a 50 calcule o excesso depagamento  armazenando-o 
	na  vari�vel  E,  caso  contr�rio  zerar  tal  vari�vel.  A  hora excedente de trabalho vale R$ 20,00. No final do processamento imprimir o sal�rio total e o
	sal�rio excedente.
*/

CREATE OR ALTER PROCEDURE HORAS_EXTRAS_TRABALHADAS
(
	@HORAS_TRABALHADAS NUMERIC (12,2)
)
AS
BEGIN
	
	DECLARE 
		@SALARIO NUMERIC (19,2),
		@EXCESSO_PAGAMENTO NUMERIC (19,2),
		@SALARIO_TOTAL NUMERIC (19,2)

	IF @HORAS_TRABALHADAS > = 50
		BEGIN
			SET @SALARIO = @HORAS_TRABALHADAS * 10.00;
			SET @SALARIO_TOTAL = @SALARIO + 20.00;
			SET @EXCESSO_PAGAMENTO = @SALARIO_TOTAL - @SALARIO;

			SELECT @SALARIO_TOTAL AS Salario_Total;
			SELECT @EXCESSO_PAGAMENTO as Excesso_de_Pagamento;
		END
		ELSE
			BEGIN
				SET @SALARIO = @HORAS_TRABALHADAS * 10.00;
				SET @SALARIO_TOTAL = @SALARIO + 20.00;
				SET @EXCESSO_PAGAMENTO = 0;

				SELECT @SALARIO_TOTAL AS Salario_Total;
				SELECT @EXCESSO_PAGAMENTO as Excesso_de_Pagamento;	
			END
END;

EXEC HORAS_EXTRAS_TRABALHADAS 180.00