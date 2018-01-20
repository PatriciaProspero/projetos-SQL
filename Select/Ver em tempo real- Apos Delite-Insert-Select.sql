-- Para realziar uma consulta imediata, mesmo que estaja ocorrendo um insert na tabela ou um delite ou qualquer outra altera��o.
--Esse comando serve tanto para Insert, Select, Delite e etc...

 /*Conselhor para uso:
 
 - N�o Utilizar:

- Select de consultas para um estoque de vendas (Caso alguem j� comprou, como voc� vai selecionar ele??? Vai vender o que n�o tem)
- Select em um limite de compra de um cliente (Caso o cliente gaste tudo, o limite n�o pode ser liberado, e deve aparecer no relat�rio ou seja
l� o que for que ele n�o tem mais limite).

- Utilizar

- Select em um relat�rio gerencial que n�o precisa estar 100% atualizados.Ex:

- Relat�rios Gerencias --- Apenas para o Gerente ver o que foi vendido at� aquele determinado momento
- Telas gerenciais     ---

 */

-- Sem Join

SELECT * FROM funcionarios  WITH (NOLOCK)

-- Com Join, colocar depois do apelido (alias) da tabela

SELECT * 
FROM funcionarios f WITH (NOLOCK)
JOIN chefes c WITH (NOLOCK)  -- Sempre colocar aqui
	on id_funcionario = id_funcionario_chefe
