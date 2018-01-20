/*
Alterar a tabela employee e adicionar um campo chamado lastTitle.
Este campo deve armazenar o último title do funcionário caso ele receba um novo.
Crie uma trigger para resolver esta solicitação.
*/

ALTER TABLE Employees 
ADD LasTitle VARCHAR (100);

SELECT * FROM Employees