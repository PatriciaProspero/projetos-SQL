/*
	Inserir dados em uma nova tabela utilizando os dados da uma tabela já existente e já com seus dados.
	Ou Seja
	Seleciona Dados de uma ou mais tabela e os insere em ma tabela diferente.
	
	Pode ser utilizada para realziar cópias de beckup  de tabelas. 
*/

SELECT NomeTabela
INTO Nova_Tabela
FROM Tabela_Atual
WHERE Colocar_Condicao -- Caso queira