CREATE DATABASE ConciertoDB;

USE ConciertoDB;

GO
CREATE PROCEDURE sp_CrearTablas
AS
BEGIN
    -- Asistentes
    IF OBJECT_ID('Asistente') IS NULL
        CREATE TABLE Asistente (
            id_asistente INT PRIMARY KEY,
            nombre NVARCHAR(100) NOT NULL,
            correo NVARCHAR(100) UNIQUE,
            telefono NVARCHAR(20)
        );

    -- Conciertos
    IF OBJECT_ID('Concierto') IS NULL
        CREATE TABLE Concierto (
            id_concierto INT PRIMARY KEY,
            nombre NVARCHAR(150) NOT NULL,
            fecha DATE NOT NULL,
            lugar NVARCHAR(150) NOT NULL
        );

    -- Artistas
    IF OBJECT_ID('Artista') IS NULL
        CREATE TABLE Artista (
            id_artista INT PRIMARY KEY,
            nombre NVARCHAR(100) NOT NULL,
            genero NVARCHAR(50)
        );

    -- Boletos
    IF OBJECT_ID('Boleto') IS NULL
        CREATE TABLE Boleto (
            id_boleto INT PRIMARY KEY,
            id_concierto INT FOREIGN KEY REFERENCES Concierto(id_concierto),
            id_asistente INT FOREIGN KEY REFERENCES Asistente(id_asistente),
            precio DECIMAL(10,2) CHECK(precio > 0)
        );

    -- Empleados
    IF OBJECT_ID('Empleado') IS NULL
        CREATE TABLE Empleado (
            id_empleado INT PRIMARY KEY,
            nombre NVARCHAR(100) NOT NULL,
            puesto NVARCHAR(50)
        );

    -- Ventas
    IF OBJECT_ID('Venta') IS NULL
        CREATE TABLE Venta (
            id_venta INT PRIMARY KEY,
            id_boleto INT FOREIGN KEY REFERENCES Boleto(id_boleto),
            id_empleado INT FOREIGN KEY REFERENCES Empleado(id_empleado),
            fecha DATE NOT NULL
        );

    -- Relación concierto-artistas
    IF OBJECT_ID('ConciertoArtista') IS NULL
        CREATE TABLE ConciertoArtista (
            id_concierto INT FOREIGN KEY REFERENCES Concierto(id_concierto),
            id_artista INT FOREIGN KEY REFERENCES Artista(id_artista),
            PRIMARY KEY(id_concierto,id_artista)
        );
END;
GO

EXEC sp_CrearTablasConcierto;
GO


CREATE PROCEDURE sp_InsertarDatos
AS
BEGIN
    -- Asistentes
    IF NOT EXISTS (SELECT 1 FROM Asistente)
    BEGIN
        INSERT INTO Asistente VALUES
        (1,'Carlos Pérez','carlos@mail.com','3001112233'),
        (2,'Ana Gómez','ana@mail.com','3002223344'),
        (3,'Luis Torres','luis@mail.com','3003334455'),
        (4,'María Ruiz','maria@mail.com','3004445566'),
        (5,'Pedro López','pedro@mail.com','3005556677'),
        (6,'Laura Díaz','laura@mail.com','3006667788'),
        (7,'Diego Castro','diego@mail.com','3007778899'),
        (8,'Paula Méndez','paula@mail.com','3008889900'),
        (9,'Jorge Rojas','jorge@mail.com','3009990011'),
        (10,'Elena Vargas','elena@mail.com','3000001122');
    END;

    -- Conciertos
    IF NOT EXISTS (SELECT 1 FROM Concierto)
    BEGIN
        INSERT INTO Concierto VALUES
        (1,'Rock Fest','2025-06-01','Estadio Nacional'),
        (2,'Pop Explosion','2025-06-05','Coliseo Central'),
        (3,'Jazz Nights','2025-06-10','Teatro Mayor'),
        (4,'Metal Storm','2025-06-15','Arena Bogotá'),
        (5,'Reggaeton Party','2025-06-20','Centro de Eventos'),
        (6,'Indie Vibes','2025-06-25','Parque Cultural'),
        (7,'Salsa World','2025-07-01','Plaza Principal'),
        (8,'Electro Beats','2025-07-05','Club Electrónico'),
        (9,'Hip Hop Jam','2025-07-10','Coliseo Urbano'),
        (10,'Clásicos Eternos','2025-07-15','Teatro Colón');
    END;

    -- Artistas
    IF NOT EXISTS (SELECT 1 FROM Artista)
    BEGIN
        INSERT INTO Artista VALUES
        (1,'Banda Rockera','Rock'),
        (2,'Cantante Pop','Pop'),
        (3,'Grupo Jazz','Jazz'),
        (4,'Metal Band','Metal'),
        (5,'Reggaeton Star','Reggaeton'),
        (6,'Indie Band','Indie'),
        (7,'Salsa Orquesta','Salsa'),
        (8,'DJ Electro','Electrónica'),
        (9,'MC HipHop','Hip Hop'),
        (10,'Orquesta Clásica','Clásica');
    END;

    -- ConciertoArtista
    IF NOT EXISTS (SELECT 1 FROM ConciertoArtista)
    BEGIN
        INSERT INTO ConciertoArtista VALUES
        (1,1),(2,2),(3,3),(4,4),(5,5),
        (6,6),(7,7),(8,8),(9,9),(10,10);
    END;

    -- Empleados
    IF NOT EXISTS (SELECT 1 FROM Empleado)
    BEGIN
        INSERT INTO Empleado VALUES
        (1,'Juan Morales','Cajero'),
        (2,'Marta Rodríguez','Taquillera'),
        (3,'Sofía Jiménez','Supervisor'),
        (4,'Andrés García','Cajero'),
        (5,'Lucía Fernández','Taquillera'),
        (6,'Pablo Díaz','Cajero'),
        (7,'Camila Torres','Administrador'),
        (8,'Mateo Ramírez','Taquillero'),
        (9,'Isabella Cruz','Cajera'),
        (10,'Felipe Herrera','Supervisor');
    END;

    -- Boletos
    IF NOT EXISTS (SELECT 1 FROM Boleto)
    BEGIN
        INSERT INTO Boleto VALUES
        (1,1,1,150000),(2,2,2,120000),(3,3,3,100000),(4,4,4,130000),(5,5,5,110000),
        (6,6,6,90000),(7,7,7,140000),(8,8,8,95000),(9,9,9,125000),(10,10,10,160000);
    END;

    -- Ventas
    IF NOT EXISTS (SELECT 1 FROM Venta)
    BEGIN
        INSERT INTO Venta VALUES
        (1,1,1,'2025-05-01'),
        (2,2,2,'2025-05-02'),
        (3,3,3,'2025-05-03'),
        (4,4,4,'2025-05-04'),
        (5,5,5,'2025-05-05'),
        (6,6,6,'2025-05-06'),
        (7,7,7,'2025-05-07'),
        (8,8,8,'2025-05-08'),
        (9,9,9,'2025-05-09'),
        (10,10,10,'2025-05-10');
    END;
END;
GO

EXEC sp_InsertarDatos
GO


-- Asistentes con sus boletos y conciertos
CREATE OR ALTER VIEW vw_AsistentesBoletos AS
SELECT a.id_asistente, a.nombre, c.nombre AS Concierto, c.fecha, b.precio
FROM Asistente a
INNER JOIN Boleto b ON a.id_asistente = b.id_asistente
INNER JOIN Concierto c ON b.id_concierto = c.id_concierto;

-- Conciertos con cantidad de boletos vendidos
GO
CREATE OR ALTER VIEW vw_ConciertosBoletos AS
SELECT c.id_concierto, c.nombre, COUNT(b.id_boleto) AS TotalBoletos, SUM(b.precio) AS TotalRecaudado
FROM Concierto c
LEFT JOIN Boleto b ON c.id_concierto = b.id_concierto
GROUP BY c.id_concierto, c.nombre;

-- Ventas por empleado
GO
CREATE OR ALTER VIEW vw_VentasEmpleados AS
SELECT e.id_empleado, e.nombre, COUNT(v.id_venta) AS TotalVentas, SUM(b.precio) AS TotalRecaudado
FROM Empleado e
INNER JOIN Venta v ON e.id_empleado = v.id_empleado
INNER JOIN Boleto b ON v.id_boleto = b.id_boleto
GROUP BY e.id_empleado, e.nombre;

-- Conciertos con sus artistas
GO
CREATE OR ALTER VIEW vw_ConciertosArtistas AS
SELECT c.nombre AS Concierto, c.fecha, a.nombre AS Artista, a.genero
FROM ConciertoArtista ca
INNER JOIN Concierto c ON ca.id_concierto = c.id_concierto
INNER JOIN Artista a ON ca.id_artista = a.id_artista;

-- Recaudo total de todos los conciertos
GO
CREATE OR ALTER VIEW vw_RecaudoTotalConciertos AS
SELECT SUM(b.precio) AS TotalRecaudado
FROM Boleto b;
GO


SELECT TOP 10 * FROM vw_AsistentesBoletos;
SELECT TOP 10 * FROM vw_ConciertosBoletos;
SELECT TOP 10 * FROM vw_VentasEmpleados;
SELECT TOP 10 * FROM vw_ConciertosArtistas;
SELECT TOP 10 * FROM vw_RecaudoTotalConciertos;

---concierto
CREATE INDEX idx_nombre_concierto ON concierto(nombre);
select nombre from Concierto;

---boleto
CREATE INDEX idx_boleto_precio ON Boleto (precio);
select precio from Boleto;

---artista
CREATE INDEX idx_artitas_nombre ON Artista (nombre,genero);
select * from Artista;