

Page
1
of 2
-- Q1
select distinct CustomerID
from Orders
where OrderID in (
select OrderID
from [Order Details]
where UnitPrice > (
select avg(UnitPrice)
from [Order Details]))
-- Q2
select ContactName
from Customers
where CustomerID in (
select distinct CustomerID
from Orders
where OrderID in (
select OrderID
from [Order Details]
where ProductID in (
select ProductID
from Products
where CategoryID in (
select CategoryID
from Categories
where CategoryName = 'Beverages'))))
-- Q3
select
(
select ContactName
from Customers
where CustomerID in (
select top 1 CustomerID
from Orders
group by CustomerID
order by count(*) desc)) as ContactName,
(select count(*) as NumberOfOrders
from Orders
where CustomerID in(
select top 1 CustomerID
from Orders
group by CustomerID
order by count(*) desc)) as NumberOfOrders
--Q4
select ContactName
from Customers
where CustomerID in
(select CustomerID
from Orders
where OrderID in
(select OrderID
from [Order Details]
where UnitPrice =
(select max(UnitPrice)
from [Order Details]
)))
--Q5
select avg(ProductsPerOrder) as AverageProductsPerOrder
from (select OrderId, count(*) as ProductsPerOrder
from [Order Details]
group by OrderID) as ProductsinOrder
--Q6
select distinct CategoryName
from Categories
where CategoryID in (
select CategoryID
from Products
group by CategoryID
having avg(UnitPrice) > (
select avg(UnitPrice)
from Products))
--Q7
select top 1 UnitPrice,ProductName
from Products
where UnitPrice =
(select max(UnitPrice)
from Products
where UnitPrice < (
select max(UnitPrice)
from Products))
--Q8
select avg(Total) as AverageOrderAmount
from
(select OrderID, sum(UnitPrice*Quantity) as Total
from [Order Details]
where OrderID in (
select OrderID
from Orders
where CustomerID in (
select CustomerID
from Customers
where Country = 'France'))
group by OrderID) as OrderAmounts
