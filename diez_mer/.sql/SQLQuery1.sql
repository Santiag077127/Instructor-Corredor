---7
CREATE DATABASE biblioteca;
USE biblioteca;
CREATE TABLE Libros (
  id_libro INT PRIMARY KEY,
  titulo VARCHAR(100),
  año INT,
  editorial VARCHAR(100)
);

CREATE TABLE Autores (
  id_autor INT PRIMARY KEY,
  nombre VARCHAR(100)
);

CREATE TABLE Categorias (
  id_categoria INT PRIMARY KEY,
  nombre VARCHAR(50)
);

CREATE TABLE Usuarios (
  id_usuario INT PRIMARY KEY,
  nombre VARCHAR(100),
  tipo_usuario VARCHAR(20)
);

CREATE TABLE Prestamos (
  id_prestamo INT PRIMARY KEY,
  fecha_prestamo DATE,
  fecha_devolucion DATE,
  id_usuario INT,
  FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

CREATE TABLE Libro_Autor (
  id_libro INT,
  id_autor INT,
  PRIMARY KEY (id_libro, id_autor),
  FOREIGN KEY (id_libro) REFERENCES Libros(id_libro),
  FOREIGN KEY (id_autor) REFERENCES Autores(id_autor)
);

CREATE TABLE Libro_Categoria (
  id_libro INT,
  id_categoria INT,
  PRIMARY KEY (id_libro, id_categoria),
  FOREIGN KEY (id_libro) REFERENCES Libros(id_libro),
  FOREIGN KEY (id_categoria) REFERENCES Categorias(id_categoria)
);

INSERT INTO Libros VALUES (1, 'Fundamentos de Bases de Datos', 2021, 'McGraw-Hill');

INSERT INTO Autores VALUES (1, 'Elmasri, Ramez');

INSERT INTO Categorias VALUES (1, 'Tecnología');

INSERT INTO Usuarios VALUES (1, 'Carlos Pérez', 'estudiante');

INSERT INTO Prestamos VALUES (1, '2025-07-01', '2025-07-15', 1);

INSERT INTO Libro_Autor VALUES (1, 1);

INSERT INTO Libro_Categoria VALUES (1, 1);

SELECT * FROM Libros;

SELECT titulo FROM Libros WHERE año > 2020;

SELECT titulo FROM Libros WHERE id_libro IN (
  SELECT id_libro FROM Libro_Categoria WHERE id_categoria = 1
);

SELECT * FROM Autores;

SELECT nombre FROM Autores WHERE nombre LIKE '%Ramez%';

SELECT nombre FROM Autores WHERE id_autor IN (
  SELECT id_autor FROM Libro_Autor WHERE id_libro = 1
);

SELECT * FROM Categorias;

SELECT nombre FROM Categorias WHERE nombre = 'Tecnología';

SELECT nombre FROM Categorias WHERE id_categoria IN (
  SELECT id_categoria FROM Libro_Categoria
);

SELECT * FROM Usuarios;

SELECT nombre FROM Usuarios WHERE tipo_usuario = 'profesor';

SELECT nombre FROM Usuarios WHERE id_usuario IN (
  SELECT id_usuario FROM Prestamos
);

SELECT * FROM Prestamos;

SELECT fecha_prestamo FROM Prestamos WHERE fecha_devolucion IS NOT NULL;

SELECT id_prestamo FROM Prestamos WHERE id_usuario = 1;

SELECT * FROM Libro_Autor;

SELECT id_autor FROM Libro_Autor WHERE id_libro = 1;

SELECT id_libro FROM Libro_Autor WHERE id_autor = 1;

SELECT * FROM Libro_Categoria;

SELECT id_libro FROM Libro_Categoria WHERE id_categoria = 1;

SELECT id_categoria FROM Libro_Categoria WHERE id_libro = 1;

UPDATE Libros SET editorial = 'Pearson' WHERE id_libro = 1;

UPDATE Prestamos SET fecha_devolucion = '2025-07-16' WHERE id_prestamo = 1;

UPDATE Usuarios SET tipo_usuario = 'profesor' WHERE id_usuario = 1;

DELETE FROM Libro_Categoria WHERE id_libro = 1 AND id_categoria = 1;

DELETE FROM Libro_Autor WHERE id_libro = 1 AND id_autor = 1;

DELETE FROM Prestamos WHERE id_prestamo = 1;

DROP TABLE Libro_Autor;
DROP TABLE Prestamos;
DROP TABLE Libro_Categoria;

-- Libros prestados por un usuario específico
SELECT titulo FROM Libros
WHERE id_libro IN (
  SELECT id_libro FROM Libro_Autor
  WHERE id_autor IN (
    SELECT id_autor FROM Autores WHERE nombre LIKE '%Elmasri%'
  )
);

-- Usuarios que tienen préstamos
SELECT nombre FROM Usuarios
WHERE id_usuario IN (
  SELECT id_usuario FROM Prestamos
);

-- Categorías asociadas a libros del año 2021
SELECT nombre FROM Categorias
WHERE id_categoria IN (
  SELECT lc.id_categoria
  FROM Libro_Categoria lc
  JOIN Libros l ON lc.id_libro = l.id_libro
  WHERE l.año = 2021
);

-- Libros con sus autores
SELECT l.titulo, a.nombre AS autor
FROM Libros l
JOIN Libro_Autor la ON l.id_libro = la.id_libro
JOIN Autores a ON la.id_autor = a.id_autor;

-- Libros con sus categorías
SELECT l.titulo, c.nombre AS categoria
FROM Libros l
JOIN Libro_Categoria lc ON l.id_libro = lc.id_libro
JOIN Categorias c ON lc.id_categoria = c.id_categoria;

-- Préstamos con nombre de usuario
SELECT p.id_prestamo, u.nombre AS usuario, p.fecha_prestamo
FROM Prestamos p
JOIN Usuarios u ON p.id_usuario = u.id_usuario;