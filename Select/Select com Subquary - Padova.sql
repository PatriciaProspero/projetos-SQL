SELECT * FROM Employees
SELECT * FROM EmployeeTerritories

SELECT * FROM Region
----------------------------------------------
/*

Muito bom.
Vamos utilizar agora fun��o em uma abordagem muito comum, que � quando um ou mais joins se repetem repentinamente em consultas.
Vamos retornar o valor desse join atrav�s de uma fun��o, e deixar que ela fa�a esse trabalho que pode ser repetitivo.

Analise o diagrama de entidade e relacionamentos.
Desenvolva uma fun��o que receba como par�metro o ID de uma order, e retorne a descri��o do regi�o do funcion�rio que realizou a venda.
*/

SELECT o.Orderid,r.RegionDescription
FROM Orders o
JOIN Employees e
  ON o.employeeid = e.employeeid
JOIN (select employeeid, max(territoryid) territoryid from EmployeeTerritories group by employeeid) et
  ON et.employeeid = e.employeeid
JOIN Territories t
  ON  t.territoryid = et.territoryid
JOIN Region r
  ON r.Regionid = t.Regionid


 
select * from EmployeeTerritories order by 1, 2

select * from orders o, 
				employees e, 
				EmployeeTerritories et, 
				Territories t, 
				region r
where
o.EmployeeID = e.employeeid
and e.employeeid = et.employeeid
and et.territoryid = t.TerritoryID
and t.RegionID = r.RegionID
 
 
 select count(*) from Orders