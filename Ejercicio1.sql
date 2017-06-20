/* 1 - Obtener los nombres de los productos de la tienda */

SELECT Nombre
FROM Articulos

/* 2 - Obtener el nombre de los artículos cuyo precio esté entre 60 y 120 € */

SELECT Nombre, Precio
FROM Articulos
WHERE Precio >= 60 AND Precio <= 120

-- Alternativa
SELECT Nombre, Precio
FROM Articulos
WHERE Precio BETWEEN 60 AND 120

/* 3 - Seleccionar el precio medio de los artículos */

SELECT AVG(Precio) AS [Precio medio]
FROM Articulos

/* 4 - Obtener el precio medio de los artículos cuyo fabricante sea 2 */

SELECT AVG(Precio) AS [Precio medio]
FROM Articulos
WHERE Fabricante = 2

/* 5 - Obtener un listado completo de artículos, incluyendo para cada artículo los datos del producto y su fabricante */

SELECT A.Codigo, A.Nombre, A.Precio, F.Nombre AS Fabricante
FROM Articulos AS A
INNER JOIN Fabricantes AS F ON A.Fabricante = F.Codigo

-- o

SELECT A.Codigo, A.Nombre, A.Precio, A.Fabricante
FROM Articulos AS A

/* 6 - Obtener un listado completo de artículos, incluyendo el nombre del artículo, su precio y el nombre de su fabricante */

SELECT A.Codigo, A.Nombre, A.Precio, F.Nombre AS Fabricante
FROM Articulos AS A
INNER JOIN Fabricantes AS F ON A.Fabricante = F.Codigo

/* 7 - Obtener el precio medio de los productos de cada fabricante, mostrando el nombre del fabricante */

SELECT F.Nombre, AVG(A.Precio) AS [Precio medio]
FROM Articulos AS A
INNER JOIN Fabricantes AS F ON A.Fabricante = F.Codigo
GROUP BY F.Nombre
ORDER BY [Precio medio] DESC

/* 8 - Obtener los nombres de los fabricantes que ofrezcan productos cuyo precio medio sea mayor o igual a 150€ */

SELECT F.Nombre, AVG(A.Precio) AS [Precio medio]
FROM Articulos AS A
INNER JOIN Fabricantes AS F ON A.Fabricante = F.Codigo
GROUP BY F.Nombre
HAVING AVG(A.Precio) >= 150
ORDER BY [Precio medio] DESC

/* 9 - Obtener nombre y precio del artículo más barato */

SELECT Nombre, ART.[Precio minimo]
FROM Articulos
INNER JOIN (SELECT MIN(Precio) AS [Precio minimo]
			FROM Articulos) AS ART ON ART.[Precio minimo] = Precio

-- o

SELECT Nombre, Precio
FROM Articulos
WHERE precio = (SELECT min(Precio) FROM Articulos)

/* 10 - Obtener una lista con el nombre y precio de los artículos más caros de cada proveedor(incluyendo el nombre del proveedor) */

SELECT A.Nombre, ART.[Precio Maximo], ART.Nombre
FROM Articulos AS A
INNER JOIN (SELECT MAX(Precio) AS [Precio Maximo], F.Nombre
			FROM Articulos 
			INNER JOIN Fabricantes AS F ON Articulos.Fabricante = F.Codigo
			GROUP BY F.Nombre) AS ART ON ART.[Precio Maximo] = Precio
			-- cambiar la llave

-- o

SELECT A.Nombre, A.Precio, F.Nombre
FROM Articulos AS A
INNER JOIN Fabricantes AS F ON A.Fabricante = F.Codigo
AND A.Precio = (SELECT MAX(PRECIO) 
				FROM Articulos AS A
				WHERE A.Fabricante = F.Codigo)

/* 11 - Añadir un nuevo producto : Altavoces de 70€ (del fabricante 2) */

INSERT INTO Articulos VALUES ('Altavoces', 70, 2)

-- o

INSERT INTO Articulos(Nombre, Precio, Fabricante)
VALUES ('Altavoces', 70, 2)

/* 12 - Cambiar el nombre del producto 8 a Impresora Laser */

UPDATE Articulos
SET Nombre = 'Impresora Laser'
WHERE Codigo = 8

/* 13 - Aplicar un descuento de 10€ a todos los artículos cuyo precio sea mayor o igual a 120€ */

UPDATE Articulos
SET Precio -= 10
WHERE Precio >= 120