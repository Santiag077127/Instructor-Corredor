-- ========================================
-- 1. CREAR BASE DE DATOS
-- ========================================
IF DB_ID('BibliotecaDB') IS NULL
    CREATE DATABASE BibliotecaDB;
GO

USE BibliotecaDB;
GO

-- ========================================
-- 2. PROCEDIMIENTO PARA CREAR TABLAS
-- ========================================
CREATE OR ALTER PROCEDURE sp_CrearTablasBiblioteca
AS
BEGIN
    -- Usuario
    IF OBJECT_ID('Usuario', 'U') IS NULL
    BEGIN
        CREATE TABLE Usuario (
            id_usuario INT PRIMARY KEY,
            nombre VARCHAR(100) NOT NULL,
            correo VARCHAR(100) UNIQUE,
            telefono VARCHAR(20)
        );
    END;

    -- Autor
    IF OBJECT_ID('Autor', 'U') IS NULL
    BEGIN
        CREATE TABLE Autor (
            id_autor INT PRIMARY KEY,
            nombre VARCHAR(100) NOT NULL,
            nacionalidad VARCHAR(50)
        );
    END;

    -- Libro
    IF OBJECT_ID('Libro', 'U') IS NULL
    BEGIN
        CREATE TABLE Libro (
            id_libro INT PRIMARY KEY,
            titulo VARCHAR(150) NOT NULL,
            id_autor INT FOREIGN KEY REFERENCES Autor(id_autor),
            genero VARCHAR(50),
            anio_publicacion INT CHECK (anio_publicacion > 0)
        );
    END;

    -- Ejemplar
    IF OBJECT_ID('Ejemplar', 'U') IS NULL
    BEGIN
        CREATE TABLE Ejemplar (
            id_ejemplar INT PRIMARY KEY,
            id_libro INT FOREIGN KEY REFERENCES Libro(id_libro),
            ubicacion VARCHAR(50),
            disponible BIT DEFAULT 1
        );
    END;

    -- Prestamo
    IF OBJECT_ID('Prestamo', 'U') IS NULL
    BEGIN
        CREATE TABLE Prestamo (
            id_prestamo INT PRIMARY KEY,
            id_usuario INT FOREIGN KEY REFERENCES Usuario(id_usuario),
            id_ejemplar INT FOREIGN KEY REFERENCES Ejemplar(id_ejemplar),
            fecha_prestamo DATE,
            fecha_devolucion DATE NULL
        );
    END;

    -- Categoria
    IF OBJECT_ID('Categoria', 'U') IS NULL
    BEGIN
        CREATE TABLE Categoria (
            id_categoria INT PRIMARY KEY,
            nombre VARCHAR(50) NOT NULL
        );
    END;

    -- Libro_Categoria
    IF OBJECT_ID('Libro_Categoria', 'U') IS NULL
    BEGIN
        CREATE TABLE Libro_Categoria (
            id_libro INT FOREIGN KEY REFERENCES Libro(id_libro),
            id_categoria INT FOREIGN KEY REFERENCES Categoria(id_categoria),
            PRIMARY KEY(id_libro, id_categoria)
        );
    END;
END;

-- Crear tablas
EXEC sp_CrearTablasBiblioteca;

GO


-- ========================================
-- 3. PROCEDIMIENTO PARA INSERTAR DATOS
-- ========================================
CREATE OR ALTER PROCEDURE sp_InsertarDatosBiblioteca
AS
BEGIN
    -- Usuarios
    IF NOT EXISTS (SELECT 1 FROM Usuario)
    BEGIN
        INSERT INTO Usuario VALUES
        (1,'Carlos Pérez','carlos@correo.com','3001112233'),
        (2,'Ana Gómez','ana@correo.com','3002223344'),
        (3,'Luis Torres','luis@correo.com','3003334455'),
        (4,'María Ruiz','maria@correo.com','3004445566'),
        (5,'Pedro López','pedro@correo.com','3005556677'),
        (6,'Laura Díaz','laura@correo.com','3006667788'),
        (7,'Diego Castro','diego@correo.com','3007778899'),
        (8,'Paula Méndez','paula@correo.com','3008889900'),
        (9,'Jorge Rojas','jorge@correo.com','3009990011'),
        (10,'Elena Vargas','elena@correo.com','3000001122');
    END;

    -- Autores
    IF NOT EXISTS (SELECT 1 FROM Autor)
    BEGIN
        INSERT INTO Autor VALUES
        (1,'Gabriel García Márquez','Colombia'),
        (2,'Mario Vargas Llosa','Perú'),
        (3,'Isabel Allende','Chile'),
        (4,'Julio Cortázar','Argentina'),
        (5,'J.K. Rowling','Reino Unido'),
        (6,'George Orwell','Reino Unido'),
        (7,'Stephen King','EE.UU.'),
        (8,'Haruki Murakami','Japón'),
        (9,'Umberto Eco','Italia'),
        (10,'Miguel de Cervantes','España');
    END;

    -- Libros
    IF NOT EXISTS (SELECT 1 FROM Libro)
    BEGIN
        INSERT INTO Libro VALUES
        (1,'Cien años de soledad',1,'Novela',1967),
        (2,'La ciudad y los perros',2,'Novela',1963),
        (3,'La casa de los espíritus',3,'Novela',1982),
        (4,'Rayuela',4,'Novela',1963),
        (5,'Harry Potter y la piedra filosofal',5,'Fantasía',1997),
        (6,'1984',6,'Distopía',1949),
        (7,'It',7,'Terror',1986),
        (8,'Tokio Blues',8,'Drama',1987),
        (9,'El nombre de la rosa',9,'Misterio',1980),
        (10,'Don Quijote de la Mancha',10,'Novela',1605);
    END;

    -- Ejemplares
    IF NOT EXISTS (SELECT 1 FROM Ejemplar)
    BEGIN
        INSERT INTO Ejemplar VALUES
        (1,1,'Estante A1',1),
        (2,2,'Estante A2',1),
        (3,3,'Estante A3',1),
        (4,4,'Estante B1',1),
        (5,5,'Estante B2',1),
        (6,6,'Estante B3',1),
        (7,7,'Estante C1',1),
        (8,8,'Estante C2',1),
        (9,9,'Estante D1',1),
        (10,10,'Estante D2',1);
    END;

    -- Categorías
    IF NOT EXISTS (SELECT 1 FROM Categoria)
    BEGIN
        INSERT INTO Categoria VALUES
        (1,'Novela'),
        (2,'Fantasía'),
        (3,'Drama'),
        (4,'Distopía'),
        (5,'Terror'),
        (6,'Misterio'),
        (7,'Clásico'),
        (8,'Romance'),
        (9,'Ciencia ficción'),
        (10,'Histórico');
    END;

    -- Libro_Categoria
    IF NOT EXISTS (SELECT 1 FROM Libro_Categoria)
    BEGIN
        INSERT INTO Libro_Categoria VALUES
        (1,1),(2,1),(3,1),(4,1),(5,2),
        (6,4),(7,5),(8,3),(9,6),(10,7);
    END;

    -- Préstamos
    IF NOT EXISTS (SELECT 1 FROM Prestamo)
    BEGIN
        INSERT INTO Prestamo VALUES
        (1,1,1,'2025-01-10','2025-01-20'),
        (2,2,2,'2025-01-11','2025-01-22'),
        (3,3,3,'2025-01-12',NULL),
        (4,4,4,'2025-01-13',NULL),
        (5,5,5,'2025-01-14','2025-01-24'),
        (6,6,6,'2025-01-15',NULL),
        (7,7,7,'2025-01-16','2025-01-26'),
        (8,8,8,'2025-01-17',NULL),
        (9,9,9,'2025-01-18','2025-01-28'),
        (10,10,10,'2025-01-19',NULL);
    END;
END;

-- Insertar registros
EXEC sp_InsertarDatosBiblioteca;


-- ========================================
-- 4. CREACIÓN DE VISTAS (REPORTES)
-- ========================================

-- Usuarios con los libros que tienen prestados
GO
CREATE VIEW vw_UsuariosPrestamos AS
SELECT u.id_usuario, u.nombre, l.titulo, p.fecha_prestamo, p.fecha_devolucion
FROM Usuario u
INNER JOIN Prestamo p ON u.id_usuario = p.id_usuario
INNER JOIN Ejemplar e ON p.id_ejemplar = e.id_ejemplar
INNER JOIN Libro l ON e.id_libro = l.id_libro;
GO

-- Libros con sus autores
CREATE VIEW vw_LibrosAutores AS
SELECT l.id_libro, l.titulo, a.nombre AS autor, l.genero, l.anio_publicacion
FROM Libro l
INNER JOIN Autor a ON l.id_autor = a.id_autor;
GO

-- Libros con sus categorías
CREATE VIEW vw_LibrosCategorias AS
SELECT l.titulo, c.nombre AS categoria
FROM Libro l
INNER JOIN Libro_Categoria lc ON l.id_libro = lc.id_libro
INNER JOIN Categoria c ON lc.id_categoria = c.id_categoria;
GO

-- Cantidad de préstamos por usuario
CREATE VIEW vw_PrestamosPorUsuario AS
SELECT u.id_usuario, u.nombre, COUNT(p.id_prestamo) AS total_prestamos
FROM Usuario u
LEFT JOIN Prestamo p ON u.id_usuario = p.id_usuario
GROUP BY u.id_usuario, u.nombre;
GO

-- Consultar vistas (reportes)
SELECT TOP 10 * FROM vw_UsuariosPrestamos;
SELECT TOP 10 * FROM vw_LibrosAutores;
SELECT TOP 10 * FROM vw_LibrosCategorias;
SELECT TOP 10 * FROM vw_PrestamosPorUsuario;
