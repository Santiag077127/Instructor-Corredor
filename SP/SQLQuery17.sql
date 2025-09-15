-- ========================================
-- 1. CREAR BASE DE DATOS
-- ========================================
IF DB_ID('AgenciaViajesDB') IS NULL
    CREATE DATABASE AgenciaViajesDB;
GO

USE AgenciaViajesDB;
GO

-- ========================================
-- 2. PROCEDIMIENTO PARA CREAR TABLAS
-- ========================================
GO
CREATE PROCEDURE sp_CrearTablas
AS
BEGIN
    -- Cliente
    IF OBJECT_ID('Cliente') IS NULL
        CREATE TABLE Cliente (
            id_cliente INT PRIMARY KEY,
            nombre NVARCHAR(100) NOT NULL,
            correo NVARCHAR(100) UNIQUE,
            telefono NVARCHAR(20)
        );

    -- Destino
    IF OBJECT_ID('Destino') IS NULL
        CREATE TABLE Destino (
            id_destino INT PRIMARY KEY,
            ciudad NVARCHAR(100) NOT NULL,
            pais NVARCHAR(100) NOT NULL
        );

    -- Paquete de viaje
    IF OBJECT_ID('Paquete') IS NULL
        CREATE TABLE Paquete (
            id_paquete INT PRIMARY KEY,
            nombre NVARCHAR(100) NOT NULL,
            precio DECIMAL(10,2) CHECK(precio > 0),
            id_destino INT FOREIGN KEY REFERENCES Destino(id_destino)
        );

    -- Reserva
    IF OBJECT_ID('Reserva') IS NULL
        CREATE TABLE Reserva (
            id_reserva INT PRIMARY KEY,
            id_cliente INT FOREIGN KEY REFERENCES Cliente(id_cliente),
            id_paquete INT FOREIGN KEY REFERENCES Paquete(id_paquete),
            fecha DATE NOT NULL,
            estado NVARCHAR(20) DEFAULT 'Pendiente'
        );

    -- Vuelo
    IF OBJECT_ID('Vuelo') IS NULL
        CREATE TABLE Vuelo (
            id_vuelo INT PRIMARY KEY,
            aerolinea NVARCHAR(100) NOT NULL,
            salida DATE NOT NULL,
            regreso DATE NOT NULL,
            id_destino INT FOREIGN KEY REFERENCES Destino(id_destino)
        );

    -- Empleado
    IF OBJECT_ID('Empleado') IS NULL
        CREATE TABLE Empleado (
            id_empleado INT PRIMARY KEY,
            nombre NVARCHAR(100) NOT NULL,
            puesto NVARCHAR(50)
        );

    -- Venta
    IF OBJECT_ID('Venta') IS NULL
        CREATE TABLE Venta (
            id_venta INT PRIMARY KEY,
            id_reserva INT FOREIGN KEY REFERENCES Reserva(id_reserva),
            id_empleado INT FOREIGN KEY REFERENCES Empleado(id_empleado),
            fecha DATE NOT NULL,
            monto DECIMAL(10,2) CHECK(monto > 0)
        );
END;
GO

EXEC sp_CrearTablasAgencia;
GO

-- ========================================
-- 3. PROCEDIMIENTO PARA INSERTAR DATOS
-- ========================================
IF OBJECT_ID('sp_InsertarDatosAgencia') IS NOT NULL
    DROP PROCEDURE sp_InsertarDatosAgencia;
GO

CREATE PROCEDURE sp_InsertarDatosAgencia
AS
BEGIN
    -- Clientes
    IF NOT EXISTS (SELECT 1 FROM Cliente)
    BEGIN
        INSERT INTO Cliente VALUES
        (1,'Juan Pérez','juan@mail.com','3001234567'),
        (2,'María Gómez','maria@mail.com','3019876543'),
        (3,'Carlos López','carlos@mail.com','3105678901');
    END;

    -- Destinos
    IF NOT EXISTS (SELECT 1 FROM Destino)
    BEGIN
        INSERT INTO Destino VALUES
        (1,'Cancún','México'),
        (2,'Madrid','España'),
        (3,'Nueva York','EE.UU.');
    END;

    -- Paquetes
    IF NOT EXISTS (SELECT 1 FROM Paquete)
    BEGIN
        INSERT INTO Paquete VALUES
        (1,'Paquete Caribe', 2500.00, 1),
        (2,'Paquete Europa', 3500.00, 2),
        (3,'Paquete USA', 3000.00, 3);
    END;

    -- Reservas
    IF NOT EXISTS (SELECT 1 FROM Reserva)
    BEGIN
        INSERT INTO Reserva VALUES
        (1,1,1,'2025-09-01','Confirmada'),
        (2,2,2,'2025-09-02','Pendiente'),
        (3,3,3,'2025-09-03','Confirmada');
    END;

    -- Vuelos
    IF NOT EXISTS (SELECT 1 FROM Vuelo)
    BEGIN
        INSERT INTO Vuelo VALUES
        (1,'AeroMéxico','2025-09-10','2025-09-20',1),
        (2,'Iberia','2025-09-15','2025-09-25',2),
        (3,'Delta Airlines','2025-09-18','2025-09-28',3);
    END;

    -- Empleados
    IF NOT EXISTS (SELECT 1 FROM Empleado)
    BEGIN
        INSERT INTO Empleado VALUES
        (1,'Laura Torres','Agente de viajes'),
        (2,'Pedro Ramírez','Supervisor'),
        (3,'Lucía Martínez','Vendedor');
    END;

    -- Ventas
    IF NOT EXISTS (SELECT 1 FROM Venta)
    BEGIN
        INSERT INTO Venta VALUES
        (1,1,1,'2025-09-01',2500.00),
        (2,2,2,'2025-09-02',3500.00),
        (3,3,3,'2025-09-03',3000.00);
    END;
END;
GO

EXEC sp_InsertarDatosAgencia;
GO

-- ========================================
-- 4. VISTAS (REPORTES)
-- ========================================

-- Clientes con sus reservas y paquetes
CREATE OR ALTER VIEW vw_ClientesReservas AS
SELECT c.nombre AS Cliente, p.nombre AS Paquete, r.fecha, r.estado
FROM Cliente c
JOIN Reserva r ON c.id_cliente = r.id_cliente
JOIN Paquete p ON r.id_paquete = p.id_paquete;

-- Paquetes vendidos por destino
CREATE OR ALTER VIEW vw_PaquetesPorDestino AS
SELECT d.ciudad, d.pais, COUNT(r.id_reserva) AS Total_Reservas
FROM Destino d
JOIN Paquete p ON d.id_destino = p.id_destino
JOIN Reserva r ON p.id_paquete = r.id_paquete
GROUP BY d.ciudad, d.pais;

-- Ventas por empleado
CREATE OR ALTER VIEW vw_VentasPorEmpleado AS
SELECT e.nombre AS Empleado, COUNT(v.id_venta) AS Total_Ventas, SUM(v.monto) AS Total_Monto
FROM Empleado e
JOIN Venta v ON e.id_empleado = v.id_empleado
GROUP BY e.nombre;

-- Vuelos programados por destino
GO
CREATE OR ALTER VIEW vw_VuelosPorDestino AS
SELECT d.ciudad, d.pais, v.aerolinea, v.salida, v.regreso
FROM Vuelo v
JOIN Destino d ON v.id_destino = d.id_destino;

-- Recaudo total de la agencia
CREATE OR ALTER VIEW vw_RecaudoTotalAgencia AS
SELECT SUM(monto) AS Total_Recaudado
FROM Venta;

-- ========================================
-- 5. CONSULTAS DE PRUEBA
-- ========================================
SELECT TOP 10 * FROM vw_ClientesReservas;
SELECT TOP 10 * FROM vw_PaquetesPorDestino;
SELECT TOP 10 * FROM vw_VentasPorEmpleado;
SELECT TOP 10 * FROM vw_VuelosPorDestino;
SELECT TOP 10 * FROM vw_RecaudoTotalAgencia;
