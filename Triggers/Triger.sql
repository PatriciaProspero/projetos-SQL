/*
	FOR/AFTER/INSTEAD OF: uma dessas op��es deve ser escolhida para definir o momento em que o trigger ser� disparado. 

	- FOR � o valor padr�o e faz com o que o gatilho seja disparado junto da a��o. 
	Para que a A��o seja feita antes da a��o (para historico) voce precisa colocar DELETED
	Exemplo:
	
	INSERT INTO Log_Address (IDCliente,Data_Alteracao,Endereco_Antigo)
	SELECT CustomerID,GETDATE(),Address FROM deleted

	Para que a a��o seja feita depois da a��o, voc� precisa colocar o INSERTED
	Exemplo:

		
	INSERT INTO Log_Address (IDCliente,Data_Alteracao,Endereco_Antigo)
	SELECT CustomerID,GETDATE(),Address FROM inserted

	- AFTER faz com que o disparo se d� somente ap�s a a��o que o gerou ser conclu�da. 

	- INSTEAD OF faz com que o trigger seja executado no lugar da a��o que o gerou.
*/