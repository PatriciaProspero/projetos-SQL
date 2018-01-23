/*
	6 – Faça um programa que imprima na tela a primeira letra de cada produto. Deve estar ordenado em ordem alfabética.
*/

SELECT SUBSTRING (ProductName,1,1) AS Primeira_Letra_Nome,ProductName FROM Products
ORDER BY 1
