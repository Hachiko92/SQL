SELECT LastName, FirstName FROM Employees WHERE FirstName='Nancy'
SELECT ContactName FROM Customers WHERE City='méxico D.F.'

SELECT * FROM Employees

SELECT DISTINCT City FROM Employees

SELECT * FROM Employees WHERE FirstName='Nancy'

SELECT * FROM Customers WHERE Country='Mexico'

SELECT DISTINCT City FROM Customers

SELECT CompanyName FROM Customers WHERE City = 'London'

SELECT CompanyName AS NombreCompania FROM Customers WHERE City = 'London'

SELECT CompanyName AS NombreCompania FROM Customers AS C WHERE City = 'London'

SELECT C.CompanyName, C.ContactName, S.CategoryName FROM Customers AS C, Categories as S WHERE C.City = 'London'

SELECT C.ContactTitle, C.ContactName, E.LastName 
FROM Customers AS C, Employees AS E 
WHERE C.City = 'London'

SELECT LastName, FirstName, EmployeeID 
FROM Employees 
WHERE FirstName LIKE 'Nan%'

SELECT DISTINCT City 
FROM Employees
WHERE Title LIKE 'Sales%'

SELECT CompanyName, ContactName, Phone
FROM Customers
WHERE Phone like '(171)%'

SELECT *
FROM Customers
ORDER BY CompanyName ASC

SELECT CompanyName, City, Country
FROM Customers
ORDER BY Country DESC

SELECT LastName, FirstName, BirthDate
FROM Employees
ORDER BY BirthDate

SELECT AVG(Quantity) AS [Media quantity] FROM [Order Details]

SELECT AVG(UnitPrice) AS [Media precios] FROM [Order Details]

SELECT MIN(Freight) AS [Gasto minimo], MAX(Freight) AS [Gasto maximo] FROM Orders WHERE EmployeeID = 5

SELECT COUNT(*) 
FROM Orders

/* LAB 6 */

SELECT ShipCountry, AVG(Freight) AS [Gastos medios envio] 
FROM Orders
GROUP BY ShipCountry
ORDER BY ShipCountry ASC

SELECT ProductID, AVG(Discount) AS [Media descuentos]
FROM [Order Details]
GROUP BY ProductID
ORDER BY ProductID

/* LAB 7 - HAVING*/

SELECT ProductID, AVG (Quantity) AS [Media cantidad]
FROM [Order Details]
GROUP BY ProductID
HAVING avg(Quantity) > 10

SELECT ProductID, MAX(Quantity) AS [Maximo Cantidad]
FROM [Order Details]
GROUP BY ProductID
HAVING avg(Quantity) > 30

/* LAB 8 - INNER JOIN */
SELECT Employees.FirstName + ' ' + Employees.LastName AS [Nombre empleado], Orders.OrderDate AS [Fecha pedido]
FROM Employees INNER JOIN Orders
ON Employees.EmployeeID = Orders.EmployeeID


SELECT Employees.FirstName, Employees.LastName, TerritoryDescription 
FROM Employees INNER JOIN EmployeeTerritories ON Employees.EmployeeID = EmployeeTerritories.EmployeeID
INNER JOIN Territories ON EmployeeTerritories.TerritoryID = Territories.TerritoryID
WHERE TerritoryDescription = 'Westboro' OR TerritoryDescription = 'New York'

/* hechos con view */
SELECT DISTINCT TOP (100) PERCENT dbo.Products.ProductID AS [ID Producto], dbo.Products.ProductName, dbo.Products.UnitPrice
FROM            dbo.Products INNER JOIN
                         dbo.[Order Details] ON dbo.Products.ProductID = dbo.[Order Details].ProductID INNER JOIN
                         dbo.Orders ON dbo.[Order Details].OrderID = dbo.Orders.OrderID
ORDER BY [ID Producto]

SELECT			dbo.Orders.OrderDate, dbo.Orders.Freight, dbo.Orders.OrderID, 
				dbo.[Order Details].UnitPrice, 
				dbo.Products.ProductName, dbo.Products.UnitsInStock,
				dbo.Customers.CompanyName

FROM            dbo.Products INNER JOIN
                         dbo.[Order Details] ON dbo.Products.ProductID = dbo.[Order Details].ProductID INNER JOIN
                         dbo.Orders ON dbo.[Order Details].OrderID = dbo.Orders.OrderID INNER JOIN
                         dbo.Customers ON dbo.Orders.CustomerID = dbo.Customers.CustomerID
WHERE        (dbo.Products.UnitsInStock < 20)