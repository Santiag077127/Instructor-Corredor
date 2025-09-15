-- ========================================
-- 1. CREAR BASE DE DATOS
-- ========================================
IF DB_ID('BienesRaicesDB') IS NULL
    CREATE DATABASE BienesRaicesDB;
GO

USE BienesRaicesDB;
GO

-- ========================================
-- 2. PROCEDIMIENTO PARA CREAR TABLAS
-- ========================================
CREATE PROCEDURE sp_CrearTablasBienesRaices
AS
BEGIN
    -- Clientes
    IF OBJECT_ID('Cliente') IS NULL
        CREATE TABLE Cliente (
            id_cliente INT PRIMARY KEY,
            nombre NVARCHAR(100) NOT NULL,
            correo NVARCHAR(100) UNIQUE,
            telefono NVARCHAR(20)
        );

    -- Propiedades
    IF OBJECT_ID('Propiedad') IS NULL
        CREATE TABLE Propiedad (
            id_propiedad INT PRIMARY KEY,
            direccion NVARCHAR(200) NOT NULL,
            tipo NVARCHAR(50) NOT NULL,
            precio DECIMAL(12,2) CHECK(precio > 0),
            disponible BIT DEFAULT 1
        );

    -- Agentes
    IF OBJECT_ID('Agente') IS NULL
        CREATE TABLE Agente (
            id_agente INT PRIMARY KEY,
            nombre NVARCHAR(100) NOT NULL,
            telefono NVARCHAR(20)
        );

    -- Contratos
    IF OBJECT_ID('Contrato') IS NULL
        CREATE TABLE Contrato (
            id_contrato INT PRIMARY KEY,
            id_cliente INT FOREIGN KEY REFERENCES Cliente(id_cliente),
            id_propiedad INT FOREIGN KEY REFERENCES Propiedad(id_propiedad),
            id_agente INT FOREIGN KEY REFERENCES Agente(id_agente),
            fecha_inicio DATE NOT NULL,
            fecha_fin DATE,
            tipo NVARCHAR(20) CHECK(tipo IN ('Venta','Alquiler'))
        );

    -- Pagos
    IF OBJECT_ID('Pago') IS NULL
        CREATE TABLE Pago (
            id_pago INT PRIMARY KEY,
            id_contrato INT FOREIGN KEY REFERENCES Contrato(id_contrato),
            fecha DATE NOT NULL,
            monto DECIMAL(12,2) CHECK(monto > 0)
        );

    -- Servicios extra
    IF OBJECT_ID('ServicioExtra') IS NULL
        CREATE TABLE ServicioExtra (
            id_servicio INT PRIMARY KEY,
            nombre NVARCHAR(100) NOT NULL,
            costo DECIMAL(10,2) CHECK(costo > 0)
        );

-- Uso de servicios
IF OBJECT_ID('UsoServicio') IS NULL
    CREATE TABLE UsoServicio (
        id_uso INT PRIMARY KEY,
        id_contrato INT FOREIGN KEY REFERENCES Contrato(id_contrato),
        id_servicio INT FOREIGN KEY REFERENCES ServicioExtra(id_servicio),
        cantidad INT CHECK(cantidad > 0)
    );
end
GO

EXEC sp_CrearTablasBienesRaices;

GO
CREATE PROCEDURE sp_InsertarDatosBienesRaices
AS
BEGIN
    -- Clientes
    IF NOT EXISTS (SELECT 1 FROM Cliente)
    BEGIN
        INSERT INTO Cliente VALUES
        (1,'Ana Torres','ana@mail.com','3001112233'),
        (2,'Luis Ramírez','luis@mail.com','3012223344'),
        (3,'Carolina Díaz','caro@mail.com','3023334455');
    END;

    -- Propiedades
    IF NOT EXISTS (SELECT 1 FROM Propiedad)
    BEGIN
        INSERT INTO Propiedad VALUES
        (1,'Cra 10 #20-30, Bogotá','Apartamento',250000000,1),
        (2,'Calle 45 #15-22, Medellín','Casa',450000000,1),
        (3,'Av. Principal #100, Cali','Local Comercial',800000000,1);
    END;

    -- Agentes
    IF NOT EXISTS (SELECT 1 FROM Agente)
    BEGIN
        INSERT INTO Agente VALUES
        (1,'Sofía Hernández','3109998888'),
        (2,'Carlos Méndez','3207776666'),
        (3,'Andrea Ríos','3005554444');
    END;

    -- Contratos
    IF NOT EXISTS (SELECT 1 FROM Contrato)
    BEGIN
        INSERT INTO Contrato VALUES
        (1,1,1,1,'2025-09-01',NULL,'Venta'),
        (2,2,2,2,'2025-09-05','2026-09-05','Alquiler'),
        (3,3,3,3,'2025-09-10',NULL,'Venta');
    END;

    -- Pagos
    IF NOT EXISTS (SELECT 1 FROM Pago)
    BEGIN
        INSERT INTO Pago VALUES
        (1,1,'2025-09-01',250000000),
        (2,2,'2025-09-06',1800000),
        (3,3,'2025-09-10',800000000);
    END;

    -- Servicios extra
    IF NOT EXISTS (SELECT 1 FROM ServicioExtra)
    BEGIN
        INSERT INTO ServicioExtra VALUES
        (1,'Mantenimiento',200000),
        (2,'Publicidad',500000),
        (3,'Asesoría legal',700000);
    END;

    -- Uso de servicios
    IF NOT EXISTS (SELECT 1 FROM UsoServicio)
    BEGIN
        INSERT INTO UsoServicio (id_uso,id_contrato,id_servicio,cantidad) VALUES
        (1,1,2,1),
        (2,2,1,3),
        (3,3,3,1);
    END;
END;
GO

EXEC sp_InsertarDatosBienesRaices;
GO

-- ========================================
-- 4. VISTAS (REPORTES)
-- ========================================

-- Contratos de clientes con propiedades y agentes
CREATE OR ALTER VIEW vw_ContratosClientes AS
SELECT c.nombre AS Cliente, p.direccion AS Propiedad, p.tipo AS TipoPropiedad, a.nombre AS Agente, ct.tipo AS TipoContrato, ct.fecha_inicio, ct.fecha_fin
FROM Contrato ct
JOIN Cliente c ON ct.id_cliente = c.id_cliente
JOIN Propiedad p ON ct.id_propiedad = p.id_propiedad
JOIN Agente a ON ct.id_agente = a.id_agente;

-- Pagos por contrato
CREATE OR ALTER VIEW vw_PagosPorContrato AS
SELECT ct.id_contrato, c.nombre AS Cliente, SUM(pg.monto) AS Total_Pagado
FROM Pago pg
JOIN Contrato ct ON pg.id_contrato = ct.id_contrato
JOIN Cliente c ON ct.id_cliente = c.id_cliente
GROUP BY ct.id_contrato, c.nombre;


-- Propiedades con estado de disponibilidad
CREATE OR ALTER VIEW vw_PropiedadesDisponibles AS
SELECT direccion, tipo, precio, 
       CASE WHEN disponible=1 THEN 'Disponible' ELSE 'No Disponible' END AS Estado
FROM Propiedad;

-- Recaudo total de la inmobiliaria

CREATE OR ALTER VIEW vw_RecaudoTotalInmobiliaria AS
SELECT SUM(monto) AS Total_Recaudado
FROM Pago;

-- ========================================
-- 5. CONSULTAS DE PRUEBA
-- ========================================
SELECT TOP 10 * FROM vw_ContratosClientes;
SELECT TOP 10 * FROM vw_PagosPorContrato;
SELECT TOP 10 * FROM vw_PropiedadesDisponibles;
SELECT TOP 10 * FROM vw_RecaudoTotalInmobiliaria;
