CREATE OR ALTER FUNCTION JoinTabelas2
(
)

RETURNS TABLE
AS
RETURN
	(
		SELECT o.OrderID, r.RegionDescription
		FROM Orders o
		JOIN Employees e
		  ON o.employeeid = e.employeeid
		JOIN (select employeeid, max(territoryid) territoryid from EmployeeTerritories group by employeeid) et
		  ON et.employeeid = e.employeeid
		JOIN Territories t
		  ON  t.territoryid = et.territoryid
		JOIN Region r
		  ON r.Regionid = t.Regionid
		  --where o.OrderID = @orderid
		  );

SELECT o.OrderID a from  orders o

select o.OrderID, a.RegionDescription from orders o, dbo.JoinTabelas2() a
where o.OrderID = a.OrderID


select * from dbo.JoinTabelas2()
