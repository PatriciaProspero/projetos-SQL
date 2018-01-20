/*
	Construa um algoritmo para pagamento de comissão de vendedores de peças, levando-se em  consideração  que  sua  comissão  será  de  
	5%  do  total  da  venda  e  que  você  tem  os seguintes dados:

	•Identificação do vendedor
	•Código da peça
	•Preço unitário da peça
	•Quantidade vendida
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

