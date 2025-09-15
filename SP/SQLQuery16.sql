-- ========================================
-- 1. CREAR BASE DE DATOS
-- ========================================
IF DB_ID('GimnasioDB') IS NULL
    CREATE DATABASE GimnasioDB;
GO

USE GimnasioDB;
GO

-- ========================================
-- 2. PROCEDIMIENTO PARA CREAR TABLAS
-- ========================================
CREATE OR ALTER PROCEDURE sp_CrearTablasGimnasio
AS
BEGIN
    -- Socio
    IF OBJECT_ID('Socio', 'U') IS NULL
    BEGIN
        CREATE TABLE Socio (
            id_socio INT PRIMARY KEY,
            nombre VARCHAR(100) NOT NULL,
            correo VARCHAR(100) UNIQUE,
            telefono VARCHAR(20)
        );
    END;

    -- Membresía
    IF OBJECT_ID('Membresia', 'U') IS NULL
    BEGIN
        CREATE TABLE Membresia (
            id_membresia INT PRIMARY KEY,
            id_socio INT FOREIGN KEY REFERENCES Socio(id_socio),
            tipo VARCHAR(50) CHECK (tipo IN ('Mensual','Trimestral','Anual')),
            fecha_inicio DATE,
            fecha_fin DATE
        );
    END;

    -- Instructor
    IF OBJECT_ID('Instructor', 'U') IS NULL
    BEGIN
        CREATE TABLE Instructor (
            id_instructor INT PRIMARY KEY,
            nombre VARCHAR(100) NOT NULL,
            especialidad VARCHAR(50)
        );
    END;

    -- Clase
    IF OBJECT_ID('Clase', 'U') IS NULL
    BEGIN
        CREATE TABLE Clase (
            id_clase INT PRIMARY KEY,
            nombre VARCHAR(100) NOT NULL,
            horario TIME,
            cupo INT CHECK (cupo > 0)
        );
    END;

    -- SocioClase (inscripción de socios a clases)
    IF OBJECT_ID('SocioClase', 'U') IS NULL
    BEGIN
        CREATE TABLE SocioClase (
            id_socioclase INT PRIMARY KEY,
            id_socio INT FOREIGN KEY REFERENCES Socio(id_socio),
            id_clase INT FOREIGN KEY REFERENCES Clase(id_clase),
            fecha DATE
        );
    END;

    -- Equipo
    IF OBJECT_ID('Equipo', 'U') IS NULL
    BEGIN
        CREATE TABLE Equipo (
            id_equipo INT PRIMARY KEY,
            nombre VARCHAR(100) NOT NULL,
            estado VARCHAR(50) CHECK (estado IN ('Disponible','En mantenimiento'))
        );
    END;

    -- Rutina
    IF OBJECT_ID('Rutina', 'U') IS NULL
    BEGIN
        CREATE TABLE Rutina (
            id_rutina INT PRIMARY KEY,
            id_instructor INT FOREIGN KEY REFERENCES Instructor(id_instructor),
            id_socio INT FOREIGN KEY REFERENCES Socio(id_socio),
            descripcion VARCHAR(200)
        );
    END;
END;
GO

-- Crear tablas
EXEC sp_CrearTablasGimnasio;


-- ========================================
-- 3. PROCEDIMIENTO PARA INSERTAR DATOS
-- ========================================
CREATE OR ALTER PROCEDURE sp_InsertarDatosGimnasio
AS
BEGIN
    -- Socios
    IF NOT EXISTS (SELECT 1 FROM Socio)
    BEGIN
        INSERT INTO Socio VALUES
        (1,'Carlos Pérez','carlos@gym.com','3001112233'),
        (2,'Ana Gómez','ana@gym.com','3002223344'),
        (3,'Luis Torres','luis@gym.com','3003334455'),
        (4,'María Ruiz','maria@gym.com','3004445566'),
        (5,'Pedro López','pedro@gym.com','3005556677'),
        (6,'Laura Díaz','laura@gym.com','3006667788'),
        (7,'Diego Castro','diego@gym.com','3007778899'),
        (8,'Paula Méndez','paula@gym.com','3008889900'),
        (9,'Jorge Rojas','jorge@gym.com','3009990011'),
        (10,'Elena Vargas','elena@gym.com','3000001122');
    END;

    -- Membresías
    IF NOT EXISTS (SELECT 1 FROM Membresia)
    BEGIN
        INSERT INTO Membresia VALUES
        (1,1,'Mensual','2025-01-01','2025-01-31'),
        (2,2,'Trimestral','2025-01-10','2025-04-09'),
        (3,3,'Anual','2025-02-01','2026-01-31'),
        (4,4,'Mensual','2025-02-05','2025-03-04'),
        (5,5,'Trimestral','2025-03-01','2025-05-30'),
        (6,6,'Anual','2025-01-20','2026-01-19'),
        (7,7,'Mensual','2025-02-15','2025-03-14'),
        (8,8,'Trimestral','2025-02-10','2025-05-09'),
        (9,9,'Anual','2025-01-25','2026-01-24'),
        (10,10,'Mensual','2025-02-12','2025-03-11');
    END;

    -- Instructores
    IF NOT EXISTS (SELECT 1 FROM Instructor)
    BEGIN
        INSERT INTO Instructor VALUES
        (1,'Juan Morales','Cardio'),
        (2,'Marta Rodríguez','Yoga'),
        (3,'Sofía Jiménez','Crossfit'),
        (4,'Andrés García','Pesas'),
        (5,'Lucía Fernández','Pilates'),
        (6,'Pablo Díaz','Funcional'),
        (7,'Camila Torres','Spinning'),
        (8,'Mateo Ramírez','Boxeo'),
        (9,'Isabella Cruz','Zumba'),
        (10,'Felipe Herrera','HIIT');
    END;

    -- Clases
    IF NOT EXISTS (SELECT 1 FROM Clase)
    BEGIN
        INSERT INTO Clase VALUES
        (1,'Yoga','08:00',20),
        (2,'Crossfit','09:00',15),
        (3,'Spinning','10:00',25),
        (4,'Pilates','11:00',18),
        (5,'Boxeo','12:00',12),
        (6,'Cardio','13:00',30),
        (7,'HIIT','14:00',20),
        (8,'Funcional','15:00',15),
        (9,'Zumba','16:00',25),
        (10,'Pesas','17:00',40);
    END;

    -- SocioClase (inscripciones)
    IF NOT EXISTS (SELECT 1 FROM SocioClase)
    BEGIN
        INSERT INTO SocioClase VALUES
        (1,1,1,'2025-01-10'),
        (2,2,2,'2025-01-11'),
        (3,3,3,'2025-01-12'),
        (4,4,4,'2025-01-13'),
        (5,5,5,'2025-01-14'),
        (6,6,6,'2025-01-15'),
        (7,7,7,'2025-01-16'),
        (8,8,8,'2025-01-17'),
        (9,9,9,'2025-01-18'),
        (10,10,10,'2025-01-19');
    END;

    -- Equipos
    IF NOT EXISTS (SELECT 1 FROM Equipo)
    BEGIN
        INSERT INTO Equipo VALUES
        (1,'Caminadora','Disponible'),
        (2,'Bicicleta Estática','Disponible'),
        (3,'Máquina de Pesas','En mantenimiento'),
        (4,'Banco de Pesas','Disponible'),
        (5,'Elíptica','Disponible'),
        (6,'Máquina de Remo','Disponible'),
        (7,'Mancuernas','Disponible'),
        (8,'Barra Olímpica','Disponible'),
        (9,'Colchonetas','Disponible'),
        (10,'Escaladora','En mantenimiento');
    END;

    -- Rutinas
    IF NOT EXISTS (SELECT 1 FROM Rutina)
    BEGIN
        INSERT INTO Rutina VALUES
        (1,1,1,'Rutina de cardio básica 30 min'),
        (2,2,2,'Yoga para principiantes'),
        (3,3,3,'Entrenamiento de Crossfit intermedio'),
        (4,4,4,'Rutina de pesas para fuerza'),
        (5,5,5,'Pilates de flexibilidad'),
        (6,6,6,'Entrenamiento funcional completo'),
        (7,7,7,'Clase de spinning avanzada'),
        (8,8,8,'Boxeo para resistencia'),
        (9,9,9,'Zumba de 45 minutos'),
        (10,10,10,'HIIT para quema de grasa');
    END;
END;

-- Insertar datos
EXEC sp_InsertarDatosGimnasio;

-- ========================================
-- 4. CREACIÓN DE VISTAS (REPORTES)
-- ========================================

-- Socios con sus membresías
GO
CREATE OR ALTER VIEW vw_SociosMembresias AS
SELECT s.id_socio, s.nombre, m.tipo, m.fecha_inicio, m.fecha_fin
FROM Socio s
INNER JOIN Membresia m ON s.id_socio = m.id_socio;
GO

-- Clases con cantidad de inscritos
CREATE OR ALTER VIEW vw_ClasesInscritos AS
SELECT c.id_clase, c.nombre, COUNT(sc.id_socioclase) AS total_inscritos
FROM Clase c
LEFT JOIN SocioClase sc ON c.id_clase = sc.id_clase
GROUP BY c.id_clase, c.nombre;
GO

-- Rutinas asignadas por instructor
CREATE OR ALTER VIEW vw_RutinasInstructor AS
SELECT i.id_instructor, i.nombre, COUNT(r.id_rutina) AS total_rutinas
FROM Instructor i
LEFT JOIN Rutina r ON i.id_instructor = r.id_instructor
GROUP BY i.id_instructor, i.nombre;
GO

-- Socios con sus rutinas
CREATE OR ALTER VIEW vw_SociosRutinas AS
SELECT s.id_socio, s.nombre, r.descripcion AS rutina, i.nombre AS instructor
FROM Socio s
INNER JOIN Rutina r ON s.id_socio = r.id_socio
INNER JOIN Instructor i ON r.id_instructor = i.id_instructor;
GO

-- Equipos por estado
CREATE OR ALTER VIEW vw_EquiposEstado AS
SELECT estado, COUNT(id_equipo) AS total_equipos
FROM Equipo
GROUP BY estado;
GO


-- ========================================
-- 5. EJECUCIÓN Y VERIFICACIÓN
-- ========================================

-- Consultar vistas (reportes)
SELECT TOP 10 * FROM vw_SociosMembresias;
SELECT TOP 10 * FROM vw_ClasesInscritos;
SELECT TOP 10 * FROM vw_RutinasInstructor;
SELECT TOP 10 * FROM vw_SociosRutinas;
SELECT TOP 10 * FROM vw_EquiposEstado;
