/*
Alterar a tabela employee e adicionar um campo chamado lastTitle.
Este campo deve armazenar o �ltimo title do funcion�rio caso ele receba um novo.
Crie uma trigger para resolver esta solicita��o.
*/

ALTER TABLE Employees 
ADD LasTitle VARCHAR (100);

SELECT * FROM Employees