/* 1 - Seleccionar todos los Empleados que vivan en la ciudad de Londres. */

SELECT *
FROM Employees
WHERE City = 'London'

/* 2 - Listar Nombre, Apellido, Cargo y tel�fono privado de los empleados de los USA. */

SELECT FirstName, LastName, Title, HomePhone
FROM Employees -----

/* 3 - Buscar Clientes cuyo nombre de contacto sea algo as� como �Mar�a�. */

SELECT *
FROM Customers
WHERE ContactName LIKE '%maria%'

/* 4 - Listar todos los Clientes que sean Propietarios (Owner) de negocios en la ciudad de �Marselle�. */

