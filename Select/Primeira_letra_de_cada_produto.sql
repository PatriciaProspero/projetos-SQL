/*
	6 � Fa�a um programa que imprima na tela a primeira letra de cada produto. Deve estar ordenado em ordem alfab�tica.
*/

SELECT SUBSTRING (ProductName,1,1) AS Primeira_Letra_Nome,ProductName FROM Products
ORDER BY 1
