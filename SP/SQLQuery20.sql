-- ========================================
-- 1. CREAR BASE DE DATOS
-- ========================================
IF DB_ID('AeropuertoDB') IS NULL
    CREATE DATABASE AeropuertoDB;
GO

USE AeropuertoDB;
GO

-- ========================================
-- 2. PROCEDIMIENTO PARA CREAR TABLAS
-- ========================================
CREATE OR ALTER PROCEDURE sp_CrearTablas
AS
BEGIN
    -- Pasajeros
    IF OBJECT_ID('Pasajero') IS NULL
        CREATE TABLE Pasajero (
            id_pasajero INT PRIMARY KEY,
            nombre VARCHAR(100) NOT NULL,
            pasaporte VARCHAR(20) UNIQUE NOT NULL
        );

    -- Aerolíneas
    IF OBJECT_ID('Aerolinea') IS NULL
        CREATE TABLE Aerolinea (
            id_aerolinea INT PRIMARY KEY,
            nombre VARCHAR(100) NOT NULL
        );

    -- Vuelos
    IF OBJECT_ID('Vuelo') IS NULL
        CREATE TABLE Vuelo (
            id_vuelo INT PRIMARY KEY,
            numero_vuelo VARCHAR(20) NOT NULL,
            id_aerolinea INT FOREIGN KEY REFERENCES Aerolinea(id_aerolinea),
            origen VARCHAR(100),
            destino VARCHAR(100),
            fecha DATE,
            hora TIME
        );

    -- Empleados
    IF OBJECT_ID('Empleado') IS NULL
        CREATE TABLE Empleado (
            id_empleado INT PRIMARY KEY,
            nombre VARCHAR(100) NOT NULL,
            puesto VARCHAR(50) NOT NULL
        );

    -- Puertas de embarque
    IF OBJECT_ID('Puerta') IS NULL
        CREATE TABLE Puerta (
            id_puerta INT PRIMARY KEY,
            numero VARCHAR(10) NOT NULL,
            ubicacion VARCHAR(100)
        );

    -- Reservas
    IF OBJECT_ID('Reserva') IS NULL
        CREATE TABLE Reserva (
            id_reserva INT PRIMARY KEY,
            id_pasajero INT FOREIGN KEY REFERENCES Pasajero(id_pasajero),
            id_vuelo INT FOREIGN KEY REFERENCES Vuelo(id_vuelo),
            asiento VARCHAR(10)
        );

    -- Asignación de vuelos a puertas
    IF OBJECT_ID('VueloPuerta') IS NULL
        CREATE TABLE VueloPuerta (
            id_asignacion INT PRIMARY KEY,
            id_vuelo INT FOREIGN KEY REFERENCES Vuelo(id_vuelo),
            id_puerta INT FOREIGN KEY REFERENCES Puerta(id_puerta)
        );
END;
GO

-- Ejecutar creación de tablas
EXEC sp_CrearTablas;
GO

-- ========================================
-- 3. PROCEDIMIENTO PARA INSERTAR DATOS
-- ========================================
CREATE OR ALTER PROCEDURE sp_InsertarDatos AS
BEGIN
    -- Pasajeros (10 registros)
    INSERT INTO Pasajero VALUES
    (1, 'Carlos Pérez', 'P123456'),
    (2, 'Ana Gómez', 'P223344'),
    (3, 'Luis Rodríguez', 'P334455'),
    (4, 'María Torres', 'P445566'),
    (5, 'Pedro Díaz', 'P556677'),
    (6, 'Sofía Ramírez', 'P667788'),
    (7, 'Andrés López', 'P778899'),
    (8, 'Lucía Morales', 'P889900'),
    (9, 'Jorge Herrera', 'P990011'),
    (10, 'Valentina Castro', 'P101112');

    -- Aerolíneas
    INSERT INTO Aerolinea VALUES
    (1, 'Avianca'),
    (2, 'LATAM'),
    (3, 'American Airlines');

    -- Vuelos
    INSERT INTO Vuelo VALUES
    (1, 'AV123', 1, 'Bogotá', 'Miami', '2025-09-20', '08:00'),
    (2, 'LA456', 2, 'Bogotá', 'Lima', '2025-09-21', '10:30'),
    (3, 'AA789', 3, 'Bogotá', 'New York', '2025-09-22', '15:45');

    -- Empleados
    INSERT INTO Empleado VALUES
    (1, 'José Ramírez', 'Piloto'),
    (2, 'Laura Suárez', 'Azafata'),
    (3, 'Felipe Gutiérrez', 'Controlador Aéreo');

    -- Puertas
    INSERT INTO Puerta VALUES
    (1, 'A1', 'Terminal 1'),
    (2, 'B2', 'Terminal 2'),
    (3, 'C3', 'Terminal Internacional');

    -- Reservas
    INSERT INTO Reserva VALUES
    (1, 1, 1, '12A'),
    (2, 2, 1, '12B'),
    (3, 3, 2, '7C'),
    (4, 4, 2, '7D'),
    (5, 5, 3, '18A'),
    (6, 6, 3, '18B'),
    (7, 7, 1, '14A'),
    (8, 8, 1, '14B'),
    (9, 9, 2, '9A'),
    (10, 10, 3, '20C');

    -- Asignaciones de vuelos a puertas
    INSERT INTO VueloPuerta VALUES
    (1, 1, 1),
    (2, 2, 2),
    (3, 3, 3);
END;
GO

-- Ejecutar inserciones
EXEC sp_InsertarDatosAeropuerto;
GO

-- ========================================
-- 4. VISTAS / REPORTES
-- ========================================
-- Pasajeros con sus vuelos
CREATE OR ALTER VIEW vw_PasajerosVuelos AS
SELECT p.nombre AS Pasajero, v.numero_vuelo, v.origen, v.destino, v.fecha, v.hora
FROM Pasajero p
JOIN Reserva r ON p.id_pasajero = r.id_pasajero
JOIN Vuelo v ON r.id_vuelo = v.id_vuelo;

-- Vuelos con su aerolínea y puerta asignada
CREATE OR ALTER VIEW vw_VuelosAerolineasPuertas AS
SELECT v.numero_vuelo, a.nombre AS Aerolinea, v.origen, v.destino, v.fecha, v.hora, pt.numero AS Puerta
FROM Vuelo v
JOIN Aerolinea a ON v.id_aerolinea = a.id_aerolinea
JOIN VueloPuerta vp ON v.id_vuelo = vp.id_vuelo
JOIN Puerta pt ON vp.id_puerta = pt.id_puerta;

-- Reservas por pasajero
CREATE OR ALTER VIEW vw_ReservasPorPasajero AS
SELECT p.nombre AS Pasajero, COUNT(r.id_reserva) AS NumeroReservas
FROM Pasajero p
LEFT JOIN Reserva r ON p.id_pasajero = r.id_pasajero
GROUP BY p.nombre;

-- ========================================
-- 5. CONSULTAS DE PRUEBA
-- ========================================
SELECT TOP 10 * FROM vw_PasajerosVuelos;
SELECT TOP 10 * FROM vw_VuelosAerolineasPuertas;
SELECT TOP 10 * FROM vw_ReservasPorPasajero;
GO
