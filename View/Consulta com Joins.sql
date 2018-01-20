CREATE VIEW _View_Joins
AS
		
SELECT o.OrderID, 
r.RegionDescription
FROM Orders o
JOIN Employees e
	ON o.employeeid = e.employeeid
JOIN (select employeeid, max(territoryid) territoryid from EmployeeTerritories group by employeeid) et
	ON et.employeeid = e.employeeid
JOIN Territories t
	ON  t.territoryid = et.territoryid
JOIN Region r
ON r.Regionid = t.Regionid

-- TESTANDO O SELECT
-- SEM WHERE 

--SELECT * FROM _View_Joins

--COM WHERE 

/*
SELECT * FROM _View_Joins 
WHERE  OrderID = 10733
*/