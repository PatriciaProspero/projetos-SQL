/*
	Inserir dados em uma nova tabela utilizando os dados da uma tabela j� existente e j� com seus dados.
	Ou Seja
	Seleciona Dados de uma ou mais tabela e os insere em ma tabela diferente.
	
	Pode ser utilizada para realziar c�pias de beckup  de tabelas. 
*/

SELECT NomeTabela
INTO Nova_Tabela
FROM Tabela_Atual
WHERE Colocar_Condicao -- Caso queira