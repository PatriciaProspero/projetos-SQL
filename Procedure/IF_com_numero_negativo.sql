/*
	Elabore  um  diagrama  de  blocos  que  leia  um  número.  Se  positivo  armazene - o  em  A,  
	se  for negativo, em B. 

	No final mostrar o resultado
*/

CREATE OR ALTER PROCEDURE ARMAZENAR_NUMEROS_POS_NEG
(
	@NUMERO INT
)
AS
BEGIN
	DECLARE 
		@A INT,
		@B INT,
		@VERIFICAR VARCHAR (50);

		IF @NUMERO < = -1
			BEGIN
				SET @A = @NUMERO
			END;
		ELSE
			BEGIN
				SET @B = @NUMERO
			END;

	SELECT @A AS A,@B AS B;
END;

EXEC ARMAZENAR_NUMEROS_POS_NEG 12

