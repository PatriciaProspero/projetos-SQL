-- Para realziar uma consulta imediata, mesmo que estaja ocorrendo um insert na tabela ou um delite ou qualquer outra alteração.
--Esse comando serve tanto para Insert, Select, Delite e etc...

 /*Conselhor para uso:
 
 - Não Utilizar:

- Select de consultas para um estoque de vendas (Caso alguem já comprou, como você vai selecionar ele??? Vai vender o que não tem)
- Select em um limite de compra de um cliente (Caso o cliente gaste tudo, o limite não pode ser liberado, e deve aparecer no relatório ou seja
lá o que for que ele não tem mais limite).

- Utilizar

- Select em um relatório gerencial que não precisa estar 100% atualizados.Ex:

- Relatórios Gerencias --- Apenas para o Gerente ver o que foi vendido até aquele determinado momento
- Telas gerenciais     ---

 */

-- Sem Join

SELECT * FROM funcionarios  WITH (NOLOCK)

-- Com Join, colocar depois do apelido (alias) da tabela

SELECT * 
FROM funcionarios f WITH (NOLOCK)
JOIN chefes c WITH (NOLOCK)  -- Sempre colocar aqui
	on id_funcionario = id_funcionario_chefe
