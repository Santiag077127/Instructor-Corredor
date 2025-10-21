CREATE DATABASE TallerDB;
USE TallerDB;
GO
CREATE OR ALTER PROCEDURE sp_CrearTablasTaller
AS
BEGIN
    IF OBJECT_ID('Cliente', 'U') IS NULL
    BEGIN
        CREATE TABLE Cliente (
            id_cliente INT PRIMARY KEY,
            nombre VARCHAR(100) NOT NULL,
            telefono VARCHAR(20) UNIQUE
        );
    END;

    -- Vehiculo
    IF OBJECT_ID('Vehiculo', 'U') IS NULL
    BEGIN
        CREATE TABLE Vehiculo (
            id_vehiculo INT PRIMARY KEY,
            placa VARCHAR(10) UNIQUE NOT NULL,
            marca VARCHAR(50),
            id_cliente INT FOREIGN KEY REFERENCES Cliente(id_cliente)
        );
    END;

    -- Taller
    IF OBJECT_ID('Taller', 'U') IS NULL
    BEGIN
        CREATE TABLE Taller (
            id_taller INT PRIMARY KEY,
            nombre_taller VARCHAR(100) NOT NULL,
            direccion VARCHAR(150)
        );
    END;

    -- Vehiculo_Taller (relación)
    IF OBJECT_ID('Vehiculo_Taller', 'U') IS NULL
    BEGIN
        CREATE TABLE Vehiculo_Taller (
            id_vehiculo INT FOREIGN KEY REFERENCES Vehiculo(id_vehiculo),
            id_taller INT FOREIGN KEY REFERENCES Taller(id_taller),
            fecha_ingreso DATE,
            fecha_salida DATE,
            PRIMARY KEY(id_vehiculo, id_taller, fecha_ingreso)
        );
    END;

    -- Servicio
    IF OBJECT_ID('Servicio', 'U') IS NULL
    BEGIN
        CREATE TABLE Servicio (
            id_servicio INT PRIMARY KEY,
            descripcion VARCHAR(150),
            costo DECIMAL(10,2) CHECK (costo >= 0)
        );
    END;

    -- Repuesto
    IF OBJECT_ID('Repuesto', 'U') IS NULL
    BEGIN
        CREATE TABLE Repuesto (
            id_repuesto INT PRIMARY KEY,
            nombre VARCHAR(100) NOT NULL,
            precio DECIMAL(10,2) CHECK (precio >= 0)
        );
    END;

    -- Servicio_Repuesto (relación)
    IF OBJECT_ID('Servicio_Repuesto', 'U') IS NULL
    BEGIN
        CREATE TABLE Servicio_Repuesto (
            id_servicio INT FOREIGN KEY REFERENCES Servicio(id_servicio),
            id_repuesto INT FOREIGN KEY REFERENCES Repuesto(id_repuesto),
            cantidad INT CHECK (cantidad > 0),
            PRIMARY KEY(id_servicio, id_repuesto)
        );
    END;
END;


GO


-- Crear tablas
EXEC sp_CrearTablasTaller;

GO

CREATE OR ALTER PROCEDURE sp_InsertarDatosTaller
AS
BEGIN
    -- Clientes
    IF NOT EXISTS (SELECT 1 FROM Cliente)
    BEGIN
        INSERT INTO Cliente VALUES
        (1,'Carlos López','3001112233'),
        (2,'Ana Gómez','3002223344'),
        (3,'Luis Torres','3003334455'),
        (4,'María Ruiz','3004445566'),
        (5,'Pedro Sánchez','3005556677'),
        (6,'Laura Díaz','3006667788'),
        (7,'Diego Castro','3007778899'),
        (8,'Paula Méndez','3008889900'),
        (9,'Jorge Rojas','3009990011'),
        (10,'Elena Vargas','3000001122');
    END;

    -- Vehículos
    IF NOT EXISTS (SELECT 1 FROM Vehiculo)
    BEGIN
        INSERT INTO Vehiculo VALUES
        (1,'ABC123','Toyota',1),
        (2,'DEF456','Mazda',2),
        (3,'GHI789','Nissan',3),
        (4,'JKL012','Chevrolet',4),
        (5,'MNO345','Kia',5),
        (6,'PQR678','Ford',6),
        (7,'STU901','Renault',7),
        (8,'VWX234','Hyundai',8),
        (9,'YZA567','Volkswagen',9),
        (10,'BCD890','Peugeot',10);
    END;

    -- Talleres
    IF NOT EXISTS (SELECT 1 FROM Taller)
    BEGIN
        INSERT INTO Taller VALUES
        (1,'Taller Norte','Calle 10 #15-20'),
        (2,'Taller Sur','Carrera 30 #45-50'),
        (3,'Taller Centro','Av. Principal #20-25'),
        (4,'Taller Oriente','Calle 40 #60-70'),
        (5,'Taller Occidente','Carrera 50 #70-80'),
        (6,'Taller Express','Av. 68 #80-90'),
        (7,'Taller Premium','Autopista Norte #100'),
        (8,'Taller Económico','Calle 80 #90-100'),
        (9,'Taller Rapido','Calle 13 #25-30'),
        (10,'Taller Especializado','Calle 100 #120');
    END;

    -- Vehículo_Taller
    IF NOT EXISTS (SELECT 1 FROM Vehiculo_Taller)
    BEGIN
        INSERT INTO Vehiculo_Taller VALUES
        (1,1,'2025-01-10','2025-01-12'),
        (2,2,'2025-01-11','2025-01-13'),
        (3,3,'2025-01-12','2025-01-14'),
        (4,4,'2025-01-13','2025-01-15'),
        (5,5,'2025-01-14','2025-01-16'),
        (6,6,'2025-01-15','2025-01-17'),
        (7,7,'2025-01-16','2025-01-18'),
        (8,8,'2025-01-17','2025-01-19'),
        (9,9,'2025-01-18','2025-01-20'),
        (10,10,'2025-01-19','2025-01-21');
    END;

    -- Servicios
    IF NOT EXISTS (SELECT 1 FROM Servicio)
    BEGIN
        INSERT INTO Servicio VALUES
        (1,'Cambio de aceite',80000),
        (2,'Alineación y balanceo',120000),
        (3,'Cambio de frenos',200000),
        (4,'Cambio de llantas',400000),
        (5,'Revisión general',150000),
        (6,'Sincronización',180000),
        (7,'Cambio de batería',250000),
        (8,'Reparación de motor',500000),
        (9,'Cambio de filtro de aire',60000),
        (10,'Revisión eléctrica',220000);
    END;

    -- Repuestos
    IF NOT EXISTS (SELECT 1 FROM Repuesto)
    BEGIN
        INSERT INTO Repuesto VALUES
        (1,'Aceite 5W30',50000),
        (2,'Llantas Michelin',350000),
        (3,'Pastillas de freno',80000),
        (4,'Batería 12V',280000),
        (5,'Filtro de aire',45000),
        (6,'Bujías NGK',60000),
        (7,'Amortiguadores',300000),
        (8,'Radiador',400000),
        (9,'Alternador',350000),
        (10,'Correa de distribución',250000);
    END;

    -- Servicio_Repuesto
    IF NOT EXISTS (SELECT 1 FROM Servicio_Repuesto)
    BEGIN
        INSERT INTO Servicio_Repuesto VALUES
        (1,1,1),
        (2,2,4),
        (3,3,2),
        (4,2,4),
        (5,5,1),
        (6,6,4),
        (7,4,1),
        (8,8,1),
        (9,5,1),
        (10,9,1);
    END;
END;

-- Insertar registros
EXEC sp_InsertarDatosTaller;

GO

-- Clientes y sus vehículos
CREATE VIEW vw_ClientesVehiculos AS
SELECT c.id_cliente, c.nombre, c.telefono, v.id_vehiculo, v.placa, v.marca
FROM Cliente c
INNER JOIN Vehiculo v ON c.id_cliente = v.id_cliente;
GO

-- Vehículos y los talleres donde han ingresado
CREATE VIEW vw_VehiculosTalleres AS
SELECT v.id_vehiculo, v.placa, v.marca, t.id_taller, t.nombre_taller, vt.fecha_ingreso, vt.fecha_salida
FROM Vehiculo v
INNER JOIN Vehiculo_Taller vt ON v.id_vehiculo = vt.id_vehiculo
INNER JOIN Taller t ON vt.id_taller = t.id_taller;
GO

-- Listado de talleres
CREATE VIEW vw_Talleres AS
SELECT id_taller, nombre_taller, direccion 
FROM Taller;
GO

-- Servicios con los repuestos utilizados
CREATE VIEW vw_ServiciosRepuestos AS
SELECT s.id_servicio, s.descripcion, s.costo, r.id_repuesto, r.nombre AS repuesto, r.precio, sr.cantidad
FROM Servicio s
INNER JOIN Servicio_Repuesto sr ON s.id_servicio = sr.id_servicio
INNER JOIN Repuesto r ON sr.id_repuesto = r.id_repuesto;
GO

-- Listado de repuestos
CREATE VIEW vw_Repuestos AS
SELECT id_repuesto, nombre, precio 
FROM Repuesto;
GO

-- Consultar las vistas (reportes)
SELECT TOP 10 * FROM vw_ClientesVehiculos;
SELECT TOP 10 * FROM vw_VehiculosTalleres;
SELECT TOP 10 * FROM vw_Talleres;
SELECT TOP 10 * FROM vw_ServiciosRepuestos;
SELECT TOP 10 * FROM vw_Repuestos;

--Servicio
CREATE INDEX idx_servicio_nombre ON Servicio (descripcion);

select descripcion from Servicio;

---- Indexar por marca
CREATE INDEX idx_vehiculo_marca 
ON Vehiculo(marca);

select marca from Vehiculo;


CREATE INDEX idx_vehiculo_placa 
ON Vehiculo(placa);

select * from Vehiculo;

