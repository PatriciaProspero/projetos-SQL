/*
	FOR/AFTER/INSTEAD OF: uma dessas opções deve ser escolhida para definir o momento em que o trigger será disparado. 

	- FOR é o valor padrão e faz com o que o gatilho seja disparado junto da ação. 
	Para que a Ação seja feita antes da ação (para historico) voce precisa colocar DELETED
	Exemplo:
	
	INSERT INTO Log_Address (IDCliente,Data_Alteracao,Endereco_Antigo)
	SELECT CustomerID,GETDATE(),Address FROM deleted

	Para que a ação seja feita depois da ação, você precisa colocar o INSERTED
	Exemplo:

		
	INSERT INTO Log_Address (IDCliente,Data_Alteracao,Endereco_Antigo)
	SELECT CustomerID,GETDATE(),Address FROM inserted

	- AFTER faz com que o disparo se dê somente após a ação que o gerou ser concluída. 

	- INSTEAD OF faz com que o trigger seja executado no lugar da ação que o gerou.
*/