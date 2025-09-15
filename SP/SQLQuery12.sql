-- ========================================
-- 1. CREAR BASE DE DATOS
-- ========================================
IF DB_ID('HospitalDB') IS NULL
    CREATE DATABASE HospitalDB;
GO

USE HospitalDB;
GO

-- ========================================
-- 2. PROCEDIMIENTO PARA CREAR TABLAS
-- ========================================
CREATE OR ALTER PROCEDURE sp_CrearTablasHospital
AS
BEGIN
    -- Paciente
    IF OBJECT_ID('Paciente', 'U') IS NULL
    BEGIN
        CREATE TABLE Paciente (
            id_paciente INT PRIMARY KEY,
            nombre VARCHAR(100) NOT NULL,
            edad INT CHECK (edad > 0),
            genero CHAR(1) CHECK (genero IN ('M','F')),
            telefono VARCHAR(20)
        );
    END;

    -- Doctor
    IF OBJECT_ID('Doctor', 'U') IS NULL
    BEGIN
        CREATE TABLE Doctor (
            id_doctor INT PRIMARY KEY,
            nombre VARCHAR(100) NOT NULL,
            especialidad VARCHAR(100),
            telefono VARCHAR(20)
        );
    END;

    -- Cita
    IF OBJECT_ID('Cita', 'U') IS NULL
    BEGIN
        CREATE TABLE Cita (
            id_cita INT PRIMARY KEY,
            id_paciente INT FOREIGN KEY REFERENCES Paciente(id_paciente),
            id_doctor INT FOREIGN KEY REFERENCES Doctor(id_doctor),
            fecha DATE NOT NULL,
            motivo VARCHAR(200)
        );
    END;

    -- Habitacion
    IF OBJECT_ID('Habitacion', 'U') IS NULL
    BEGIN
        CREATE TABLE Habitacion (
            id_habitacion INT PRIMARY KEY,
            numero VARCHAR(10) NOT NULL,
            tipo VARCHAR(50),
            disponible BIT DEFAULT 1
        );
    END;

    -- Internacion
    IF OBJECT_ID('Internacion', 'U') IS NULL
    BEGIN
        CREATE TABLE Internacion (
            id_internacion INT PRIMARY KEY,
            id_paciente INT FOREIGN KEY REFERENCES Paciente(id_paciente),
            id_habitacion INT FOREIGN KEY REFERENCES Habitacion(id_habitacion),
            fecha_ingreso DATE NOT NULL,
            fecha_salida DATE NULL
        );
    END;

    -- Tratamiento
    IF OBJECT_ID('Tratamiento', 'U') IS NULL
    BEGIN
        CREATE TABLE Tratamiento (
            id_tratamiento INT PRIMARY KEY,
            descripcion VARCHAR(200) NOT NULL,
            costo DECIMAL(10,2) CHECK (costo >= 0)
        );
    END;

    -- Cita_Tratamiento (N:M)
    IF OBJECT_ID('Cita_Tratamiento', 'U') IS NULL
    BEGIN
        CREATE TABLE Cita_Tratamiento (
            id_cita INT FOREIGN KEY REFERENCES Cita(id_cita),
            id_tratamiento INT FOREIGN KEY REFERENCES Tratamiento(id_tratamiento),
            PRIMARY KEY(id_cita, id_tratamiento)
        );
    END;
END;
GO


-- Crear tablas
EXEC sp_CrearTablasHospital;


-- ========================================
-- 3. PROCEDIMIENTO PARA INSERTAR DATOS
-- ========================================
GO
CREATE OR ALTER PROCEDURE sp_InsertarDatosHospital
AS
BEGIN
    -- Pacientes
    IF NOT EXISTS (SELECT 1 FROM Paciente)
    BEGIN
        INSERT INTO Paciente VALUES
        (1,'Juan Pérez',30,'M','3001112233'),
        (2,'Ana Gómez',25,'F','3002223344'),
        (3,'Luis Torres',40,'M','3003334455'),
        (4,'María Ruiz',35,'F','3004445566'),
        (5,'Pedro López',28,'M','3005556677'),
        (6,'Laura Díaz',50,'F','3006667788'),
        (7,'Diego Castro',45,'M','3007778899'),
        (8,'Paula Méndez',32,'F','3008889900'),
        (9,'Jorge Rojas',60,'M','3009990011'),
        (10,'Elena Vargas',29,'F','3000001122');
    END;

    -- Doctores
    IF NOT EXISTS (SELECT 1 FROM Doctor)
    BEGIN
        INSERT INTO Doctor VALUES
        (1,'Dr. García','Cardiología','3101112233'),
        (2,'Dra. Ramírez','Pediatría','3102223344'),
        (3,'Dr. Torres','Neurología','3103334455'),
        (4,'Dra. López','Dermatología','3104445566'),
        (5,'Dr. Díaz','Cirugía','3105556677'),
        (6,'Dra. Castro','Oncología','3106667788'),
        (7,'Dr. Ruiz','Psiquiatría','3107778899'),
        (8,'Dra. Méndez','Ginecología','3108889900'),
        (9,'Dr. Rojas','Ortopedia','3109990011'),
        (10,'Dra. Vargas','Medicina General','3100001122');
    END;

    -- Habitaciones
    IF NOT EXISTS (SELECT 1 FROM Habitacion)
    BEGIN
        INSERT INTO Habitacion VALUES
        (1,'101','Individual',1),
        (2,'102','Compartida',1),
        (3,'103','UCI',1),
        (4,'104','Individual',1),
        (5,'105','Compartida',1),
        (6,'106','Individual',1),
        (7,'107','UCI',1),
        (8,'108','Compartida',1),
        (9,'109','Individual',1),
        (10,'110','UCI',1);
    END;

    -- Tratamientos
    IF NOT EXISTS (SELECT 1 FROM Tratamiento)
    BEGIN
        INSERT INTO Tratamiento VALUES
        (1,'Consulta general',50000),
        (2,'Electrocardiograma',120000),
        (3,'Radiografía',80000),
        (4,'Terapia física',60000),
        (5,'Cirugía menor',300000),
        (6,'Quimioterapia',1500000),
        (7,'Psicoterapia',100000),
        (8,'Examen ginecológico',70000),
        (9,'Rehabilitación ortopédica',200000),
        (10,'Chequeo médico',90000);
    END;

    -- Citas
    IF NOT EXISTS (SELECT 1 FROM Cita)
    BEGIN
        INSERT INTO Cita VALUES
        (1,1,1,'2025-01-10','Dolor en el pecho'),
        (2,2,2,'2025-01-11','Control pediátrico'),
        (3,3,3,'2025-01-12','Dolor de cabeza'),
        (4,4,4,'2025-01-13','Problemas de piel'),
        (5,5,5,'2025-01-14','Cirugía programada'),
        (6,6,6,'2025-01-15','Tratamiento cáncer'),
        (7,7,7,'2025-01-16','Consulta psiquiátrica'),
        (8,8,8,'2025-01-17','Chequeo ginecológico'),
        (9,9,9,'2025-01-18','Dolor en rodilla'),
        (10,10,10,'2025-01-19','Chequeo general');
    END;

    -- Internaciones
    IF NOT EXISTS (SELECT 1 FROM Internacion)
    BEGIN
        INSERT INTO Internacion VALUES
        (1,1,1,'2025-02-01',NULL),
        (2,2,2,'2025-02-02','2025-02-05'),
        (3,3,3,'2025-02-03',NULL),
        (4,4,4,'2025-02-04','2025-02-08'),
        (5,5,5,'2025-02-05',NULL),
        (6,6,6,'2025-02-06',NULL),
        (7,7,7,'2025-02-07','2025-02-12'),
        (8,8,8,'2025-02-08',NULL),
        (9,9,9,'2025-02-09','2025-02-15'),
        (10,10,10,'2025-02-10',NULL);
    END;

    -- Cita_Tratamiento
    IF NOT EXISTS (SELECT 1 FROM Cita_Tratamiento)
    BEGIN
        INSERT INTO Cita_Tratamiento VALUES
        (1,1),(1,2),(2,1),(3,3),(4,4),
        (5,5),(6,6),(7,7),(8,8),(9,9);
    END;
END;

-- Insertar registros
EXEC sp_InsertarDatosHospital;

-- ========================================
-- 4. CREACIÓN DE VISTAS (REPORTES)
-- ========================================

-- Pacientes con sus citas y doctores
GO
CREATE OR ALTER VIEW vw_PacientesCitas AS
SELECT p.id_paciente, p.nombre AS paciente, d.nombre AS doctor, d.especialidad, c.fecha, c.motivo
FROM Paciente p
INNER JOIN Cita c ON p.id_paciente = c.id_paciente
INNER JOIN Doctor d ON c.id_doctor = d.id_doctor;
GO

-- Habitaciones ocupadas con pacientes
CREATE OR ALTER VIEW vw_HabitacionesOcupadas AS
SELECT h.numero, h.tipo, p.nombre AS paciente, i.fecha_ingreso, i.fecha_salida
FROM Habitacion h
INNER JOIN Internacion i ON h.id_habitacion = i.id_habitacion
INNER JOIN Paciente p ON i.id_paciente = p.id_paciente
WHERE h.disponible = 0 OR i.fecha_salida IS NULL;
GO

-- Tratamientos aplicados en cada cita
CREATE OR ALTER VIEW vw_CitasTratamientos AS
SELECT c.id_cita, p.nombre AS paciente, d.nombre AS doctor, t.descripcion, t.costo
FROM Cita c
INNER JOIN Paciente p ON c.id_paciente = p.id_paciente
INNER JOIN Doctor d ON c.id_doctor = d.id_doctor
INNER JOIN Cita_Tratamiento ct ON c.id_cita = ct.id_cita
INNER JOIN Tratamiento t ON ct.id_tratamiento = t.id_tratamiento;
GO

-- Total de citas por doctor
CREATE OR ALTER VIEW vw_TotalCitasPorDoctor AS
SELECT d.id_doctor, d.nombre, d.especialidad, COUNT(c.id_cita) AS total_citas
FROM Doctor d
LEFT JOIN Cita c ON d.id_doctor = c.id_doctor
GROUP BY d.id_doctor, d.nombre, d.especialidad;
GO


-- ========================================
-- 5. EJECUCIÓN Y VERIFICACIÓN
-- ========================================

-- Consultar vistas (reportes)
SELECT TOP 10 * FROM vw_PacientesCitas;
SELECT TOP 10 * FROM vw_HabitacionesOcupadas;
SELECT TOP 10 * FROM vw_CitasTratamientos;
SELECT TOP 10 * FROM vw_TotalCitasPorDoctor;
