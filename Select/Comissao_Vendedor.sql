/*
	Construa um algoritmo para pagamento de comiss�o de vendedores de pe�as, levando-se em  considera��o  que  sua  comiss�o  ser�  de  
	5%  do  total  da  venda  e  que  voc�  tem  os seguintes dados:

	�Identifica��o do vendedor
	�C�digo da pe�a
	�Pre�o unit�rio da pe�a
	�Quantidade vendida
*/
/*
	CREATE TABLE VENDEDORES
	(
		ID_PECA INT IDENTITY(1,1) PRIMARY KEY,
		NOME_VENDEDOR VARCHAR (100),
		ID_VENDEDOR INT,
		PRECO_UNITARIO_PECA NUMERIC (19,2),
		QUANTIDADE_VENDIDA NUMERIC (19)
	);


INSERT INTO VENDEDORES (NOME_VENDEDOR,ID_VENDEDOR,PRECO_UNITARIO_PECA,QUANTIDADE_VENDIDA)
VALUES('Patricia Souza','2',66,100);

select * from vendedores

*/


SELECT NOME_VENDEDOR, 5 *  SUM(QUANTIDADE_VENDIDA) /100 AS COMISSAO
FROM VENDEDORES
GROUP BY NOME_VENDEDOR

