

Page
2
of 2
-- Q1
select ContactName
from Customers c
where c.CustomerID not in(
select CustomerID
from Orders)
-- Q2
select distinct OrderID
from [Order Details] od
where od.ProductID in (
select ProductID
from Products p
where p.CategoryID not in(
select CategoryID
from Categories c
where (c.CategoryName = 'Meat/Poultry' or c.CategoryName = 'Dairy
Products')
))
-- Q3
select Top 1 EmployeeID
from Orders
where year(OrderDate) = '1997'
-- Q4
select EmployeeID
from Employees
where ReportsTo in (
select EmployeeID
from Employees
where ReportsTo is NULL)
-- Q5
select distinct EmployeeID
from EmployeeTerritories
where TerritoryID in (
select TerritoryID
from Territories
where RegionID in (
select RegionID
from Region
where RegionDescription = 'Western'))
-- Q6
select distinct EmployeeID
from EmployeeTerritories
where TerritoryID in (
select TerritoryID
from Territories
where RegionID not in (
select RegionID
from Region
where RegionDescription = 'Western'))
-- Q7
select *
from Orders
where EmployeeID in(
select distinct EmployeeID
from EmployeeTerritories
where TerritoryID in (
select TerritoryID
from Territories
where RegionID not in (
select RegionID
from Region
where RegionDescription = 'Western')))
-- Q8
select ContactName
from Customers
where Country = 'USA'
union
select ContactName
from Suppliers
where Country = 'USA'
-- Q9
select ProductName
from Products
where UnitPrice = (
select min(UnitPrice)
from Products)
-- Q10
SELECT EmployeeID,
CASE
WHEN DATEDIFF(year,HireDate,GETDATE()) > 5 THEN 3
WHEN DATEDIFF(year,HireDate,GETDATE()) < 3 THEN 1
ELSE 2
END AS SeniorityLevel
FROM Employees
-- Q11
SELECT ProductName,
CASE
WHEN UnitPrice > 80 THEN 'Costly'
WHEN UnitPrice < 30 THEN 'Cheap'
ELSE 'Economical'
END AS [Types]
FROM Products
