/* Ejemplo 1 */

SELECT DISTINCT City 
FROM Employees

/* Ejemplo 2 */

SELECT ProductName, (UnitPrice*UnitsInStock) AS [Precio Total]
FROM Products

/* Ejemplo 3 */

SELECT FirstName, LastName, City
FROM Employees
WHERE City = 'London' OR City = 'Tacoma'

/* Ejemplo 3 alternativa*/

SELECT FirstName, LastName, City
FROM Employees
WHERE City IN ('London', 'Tacoma')

/* Ejemplo 4 */

SELECT FirstName, LastName
FROM Employees
WHERE LastName LIKE '%an%'

/* Ejemplo 5 */

SELECT FirstName, LastName
FROM Employees
WHERE LastName LIKE '%avolio'

/* Ejemplo 6 */

SELECT FirstName, LastName
FROM Employees
WHERE ReportsTo is null

/* Ejemplo 7 */

-- 103 es el modelo castellano
SELECT LastName, convert(varchar(10),BirthDate, 103)
FROM Employees
WHERE FirstName = 'Sara' OR FirstName = 'Margaret'

/* Ejemplo 8 */

SELECT ContactName
FROM Customers
WHERE ContactTitle = 'Owner' AND City = 'México D.F.'

/* Ejemplo 9 */

SELECT ContactName
FROM Customers
WHERE City != 'México D.F.'

/* Ejemplo 9 alternativa */

SELECT ContactName
FROM Customers
WHERE NOT City = 'México D.F.'

/* Ejemplo 10 */

SELECT ContactName, City, Country
FROM Customers
WHERE (ContactTitle ='Sales Representative' AND City = 'San Cristóbal') OR Country = 'Venezuela'

/* Ejemplo 11*/

SELECT LastName, FirstName
FROM Employees
ORDER BY LastName

/* Ejemplo 12*/

SELECT FirstName, Country
FROM Employees
WHERE ReportsTo = 2

UNION

SELECT ContactName, Country
FROM Customers
ORDER BY 1, 2 -- ordeno por el primer campo y despues el segundo

/* Ejemplo 13*/

SELECT convert(varchar(10),OrderDate, 103), ContactName
FROM Customers INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
ORDER BY OrderDate

/* Ejemplo 14*/

SELECT convert(varchar(10),OrderDate, 103), ContactName
FROM Customers INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE ShipVia = 3

/* Ejemplo 15 ??*/

SELECT OrderDate, ContactName
FROM Customers AS C INNER JOIN Orders ON C.CustomerID = Orders.CustomerID
WHERE ShipVia = 3

/* Ejemplo 16*/

SELECT OrderDate, ContactName
FROM Customers AS C INNER JOIN Orders ON C.CustomerID = Orders.CustomerID
ORDER BY OrderDate

/* Ejemplo 17*/

SELECT AVG(Freight) AS [Media costes]
FROM Employees AS E INNER JOIN Orders ON E.EmployeeID = Orders.EmployeeID
WHERE E.EmployeeID = 5

/* Ejemplo 18*/

SELECT E.LastName, AVG(Freight) AS [Media costes]
FROM Employees AS E INNER JOIN Orders ON E.EmployeeID = Orders.EmployeeID
GROUP BY E.LastName

/* Ejemplo 19*/

SELECT E.LastName, AVG(Freight) AS [Media costes]
FROM Employees AS E INNER JOIN Orders ON E.EmployeeID = Orders.EmployeeID
GROUP BY E.LastName
HAVING SUM(Freight) > 8000
ORDER BY E.LastName

/* Ejemplo 20*/

SELECT P.ProductName, P.UnitsInStock, P.UnitPrice
FROM Products AS P INNER JOIN [Order Details] AS OD ON OD.ProductID = P.ProductID
GROUP BY P.ProductName, P.UnitsInStock, P.UnitPrice
HAVING SUM (OD.Quantity) > 100

/* Ejemplo 20 alternativa*/

SELECT P.ProductID, P.ProductName, P.UnitsInStock, P.UnitPrice
FROM Products AS P
WHERE P.ProductID IN (SELECT ProductID FROM [Order Details] WHERE Quantity >= 100)
ORDER BY P.ProductID

/* Ejemplo 21*/

SELECT P.ProductName, C.CategoryName, C.Description/*, P.UnitsOnOrder, P.UnitsInStock*/
FROM Products AS P INNER JOIN Categories AS C ON C.CategoryID = P.CategoryID	
WHERE P.UnitsOnOrder > P.UnitsInStock

/* Ejemplo 22*/

SELECT DISTINCT O.CustomerID, C.CompanyName
FROM Customers AS C INNER JOIN Orders AS O ON C.CustomerID = O.CustomerID

SELECT C.CustomerID, C.CompanyName 
FROM Customers AS C
WHERE EXISTS (SELECT * FROM Orders WHERE Orders.CustomerID = C.CustomerID)

/* Ejemplo 24 */

--DELETE FROM Region
--WHERE regionid = 4

-- no deja eliminar las lineas con el regionid = 4 porque están utilizado en un otra tabla

INSERT INTO Region VALUES(5, 'Region Prueba')

DELETE FROM Region
WHERE RegionID = 5

/* Ejemplo 25 */

INSERT INTO Region VALUES(5, 'Region Prueba')


UPDATE Region
SET RegionDescription = 'Region a Borrar'
WHERE RegionID = 5

SELECT *
FROM Region

/* Ejemplo 2.9 */

SELECT *
FROM Employees

UPDATE Employees
SET Region = 'SR'
WHERE Region is null

SELECT *
FROM Employees

/* Ejemplo 2.10 */

INSERT INTO CustomerDemographics VALUES (1, 'Polentone')

INSERT INTO CustomerDemographics VALUES (2, 'Terrone')

INSERT INTO CustomerDemographics VALUES (3, 'Non ne ho idea')

SELECT *
FROM CustomerDemographics

/* Ejemplo 2.10 */

DELETE FROM CustomerDemographics
WHERE CustomerTypeID = 3

SELECT *
FROM CustomerDemographics