CREATE DATABASE feria;

USE feria;

CREATE TABLE Persona (
    id_persona INT PRIMARY KEY,
    nombre VARCHAR(100),
    dni VARCHAR(20) UNIQUE
);

CREATE TABLE Tipo_Visitante (
    id_tipo_visitante INT PRIMARY KEY,
    nombre VARCHAR(50)
);

CREATE TABLE Visitante (
    id_visitante INT PRIMARY KEY,
    id_persona INT,
    id_tipo_visitante INT,
    FOREIGN KEY (id_persona) REFERENCES Persona(id_persona),
    FOREIGN KEY (id_tipo_visitante) REFERENCES Tipo_Visitante(id_tipo_visitante)
);

CREATE TABLE Ponente (
    id_ponente INT PRIMARY KEY,
    id_persona INT,
    FOREIGN KEY (id_persona) REFERENCES Persona(id_persona)
);

CREATE TABLE Responsable (
    id_responsable INT PRIMARY KEY,
    id_persona INT,
    FOREIGN KEY (id_persona) REFERENCES Persona(id_persona)
);

CREATE TABLE Empresa (
    id_empresa INT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE Feria (
    id_feria INT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE Tematica (
    id_tematica INT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE Pabellon (
    id_pabellon INT PRIMARY KEY,
    id_tematica INT,
    id_feria INT,
    FOREIGN KEY (id_tematica) REFERENCES Tematica(id_tematica),
    FOREIGN KEY (id_feria) REFERENCES Feria(id_feria)
);

CREATE TABLE Stand (
    id_stand INT PRIMARY KEY,
    id_pabellon INT,
    id_empresa INT,
    FOREIGN KEY (id_pabellon) REFERENCES Pabellon(id_pabellon),
    FOREIGN KEY (id_empresa) REFERENCES Empresa(id_empresa)
);

CREATE TABLE Producto (
    id_producto INT PRIMARY KEY,
    id_stand INT,
    id_responsable INT,
    nombre VARCHAR(100),
    FOREIGN KEY (id_stand) REFERENCES Stand(id_stand),
    FOREIGN KEY (id_responsable) REFERENCES Responsable(id_responsable)
);

CREATE TABLE Charla (
    id_charla INT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE Demostracion (
    id_demostracion INT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE Registro (
    id_registro INT PRIMARY KEY,
    id_charla INT,
    id_feria INT,
    id_empresa INT,
    id_ponente INT,
    id_demostracion INT,
    id_visitante INT,
    FOREIGN KEY (id_charla) REFERENCES Charla(id_charla),
    FOREIGN KEY (id_feria) REFERENCES Feria(id_feria),
    FOREIGN KEY (id_empresa) REFERENCES Empresa(id_empresa),
    FOREIGN KEY (id_ponente) REFERENCES Ponente(id_ponente),
    FOREIGN KEY (id_demostracion) REFERENCES Demostracion(id_demostracion),
    FOREIGN KEY (id_visitante) REFERENCES Visitante(id_visitante)
);


INSERT INTO Persona VALUES (1,'Carlos López','12345678');
INSERT INTO Persona VALUES (2,'Ana Ruiz','87654321');
INSERT INTO Persona VALUES (3,'Pedro Gómez','11223344');
INSERT INTO Persona VALUES (4,'María Torres','99887766');
INSERT INTO Persona VALUES (5,'Luis Fernández','44556677');
INSERT INTO Persona VALUES (6,'Laura Sánchez','33445566');
INSERT INTO Persona VALUES (7,'Jorge Ramírez','22334455');
INSERT INTO Persona VALUES (8,'Sofía Castro','55667788');
INSERT INTO Persona VALUES (9,'Andrés Rojas','66778899');
INSERT INTO Persona VALUES (10,'Valentina Díaz','77889900');

INSERT INTO Tipo_Visitante VALUES (1,'Estudiante');
INSERT INTO Tipo_Visitante VALUES (2,'Profesor');
INSERT INTO Tipo_Visitante VALUES (3,'Investigador');
INSERT INTO Tipo_Visitante VALUES (4,'Empresario');
INSERT INTO Tipo_Visitante VALUES (5,'Expositor');
INSERT INTO Tipo_Visitante VALUES (6,'Inversor');
INSERT INTO Tipo_Visitante VALUES (7,'Público general');
INSERT INTO Tipo_Visitante VALUES (8,'Organizador');
INSERT INTO Tipo_Visitante VALUES (9,'Proveedor');
INSERT INTO Tipo_Visitante VALUES (10,'Prensa');

INSERT INTO Visitante VALUES (1,1,1);
INSERT INTO Visitante VALUES (2,2,2);
INSERT INTO Visitante VALUES (3,3,3);
INSERT INTO Visitante VALUES (4,4,4);
INSERT INTO Visitante VALUES (5,5,5);
INSERT INTO Visitante VALUES (6,6,6);
INSERT INTO Visitante VALUES (7,7,7);
INSERT INTO Visitante VALUES (8,8,8);
INSERT INTO Visitante VALUES (9,9,9);
INSERT INTO Visitante VALUES (10,10,10);

INSERT INTO Ponente VALUES (1,1);
INSERT INTO Ponente VALUES (2,2);
INSERT INTO Ponente VALUES (3,3);
INSERT INTO Ponente VALUES (4,4);
INSERT INTO Ponente VALUES (5,5);
INSERT INTO Ponente VALUES (6,6);
INSERT INTO Ponente VALUES (7,7);
INSERT INTO Ponente VALUES (8,8);
INSERT INTO Ponente VALUES (9,9);
INSERT INTO Ponente VALUES (10,10);

INSERT INTO Responsable VALUES (1,1);
INSERT INTO Responsable VALUES (2,2);
INSERT INTO Responsable VALUES (3,3);
INSERT INTO Responsable VALUES (4,4);
INSERT INTO Responsable VALUES (5,5);
INSERT INTO Responsable VALUES (6,6);
INSERT INTO Responsable VALUES (7,7);
INSERT INTO Responsable VALUES (8,8);
INSERT INTO Responsable VALUES (9,9);
INSERT INTO Responsable VALUES (10,10);

INSERT INTO Empresa VALUES (1,'TechCorp');
INSERT INTO Empresa VALUES (2,'Innova SA');
INSERT INTO Empresa VALUES (3,'GlobalNet');
INSERT INTO Empresa VALUES (4,'BioHealth');
INSERT INTO Empresa VALUES (5,'AgroPlus');
INSERT INTO Empresa VALUES (6,'EcoSolutions');
INSERT INTO Empresa VALUES (7,'SmartCity');
INSERT INTO Empresa VALUES (8,'FinanzasYA');
INSERT INTO Empresa VALUES (9,'EduSoft');
INSERT INTO Empresa VALUES (10,'MegaConstrucciones');

INSERT INTO Feria VALUES (1,'Feria Tecnológica 2025');
INSERT INTO Feria VALUES (2,'Expo Ciencia 2025');
INSERT INTO Feria VALUES (3,'Feria Innovación');
INSERT INTO Feria VALUES (4,'Feria Salud');
INSERT INTO Feria VALUES (5,'Agro Expo');
INSERT INTO Feria VALUES (6,'Expo Ambiental');
INSERT INTO Feria VALUES (7,'Feria Smart Cities');
INSERT INTO Feria VALUES (8,'Expo Finanzas');
INSERT INTO Feria VALUES (9,'Expo Educación');

INSERT INTO Tematica VALUES (1,'Inteligencia Artificial');
INSERT INTO Tematica VALUES (2,'Biotecnología');
INSERT INTO Tematica VALUES (3,'Energías Renovables');
INSERT INTO Tematica VALUES (4,'Agricultura Digital');
INSERT INTO Tematica VALUES (5,'Ciberseguridad');
INSERT INTO Tematica VALUES (6,'Fintech');
INSERT INTO Tematica VALUES (7,'Educación Digital');
INSERT INTO Tematica VALUES (8,'Construcción Sostenible');
INSERT INTO Tematica VALUES (9,'Salud Preventiva');
INSERT INTO Tematica VALUES (10,'Movilidad Urbana');

INSERT INTO Pabellon VALUES (1,1,1);
INSERT INTO Pabellon VALUES (2,2,2);
INSERT INTO Pabellon VALUES (3,3,3);
INSERT INTO Pabellon VALUES (4,4,4);
INSERT INTO Pabellon VALUES (5,5,5);
INSERT INTO Pabellon VALUES (6,6,6);
INSERT INTO Pabellon VALUES (7,7,7);
INSERT INTO Pabellon VALUES (8,8,8);
INSERT INTO Pabellon VALUES (9,9,9);
INSERT INTO Pabellon VALUES (10,10,10);

INSERT INTO Stand VALUES (1,1,1);
INSERT INTO Stand VALUES (2,2,2);
INSERT INTO Stand VALUES (3,3,3);
INSERT INTO Stand VALUES (4,4,4);
INSERT INTO Stand VALUES (5,5,5);
INSERT INTO Stand VALUES (6,6,6);
INSERT INTO Stand VALUES (7,7,7);
INSERT INTO Stand VALUES (8,8,8);
INSERT INTO Stand VALUES (9,9,9);
INSERT INTO Stand VALUES (10,10,10);

INSERT INTO Producto VALUES (1,1,1,'Robot Asistente');
INSERT INTO Producto VALUES (2,2,2,'Kit ADN');
INSERT INTO Producto VALUES (3,3,3,'Panel Solar');
INSERT INTO Producto VALUES (4,4,4,'Sensor Agrícola');
INSERT INTO Producto VALUES (5,5,5,'Firewall Pro');
INSERT INTO Producto VALUES (6,6,6,'App Billetera Digital');
INSERT INTO Producto VALUES (7,7,7,'Plataforma E-learning');
INSERT INTO Producto VALUES (8,8,8,'Ladrillo Ecológico');
INSERT INTO Producto VALUES (9,9,9,'Monitor Salud IoT');
INSERT INTO Producto VALUES (10,10,10,'Bicicleta Eléctrica');

INSERT INTO Charla VALUES (1,'Introducción a la IA');
INSERT INTO Charla VALUES (2,'Avances en Biotecnología');
INSERT INTO Charla VALUES (3,'Futuro de la Energía Solar');
INSERT INTO Charla VALUES (4,'Agricultura de Precisión');
INSERT INTO Charla VALUES (5,'Protección de Datos 2025');
INSERT INTO Charla VALUES (6,'Transformación Digital Financiera');
INSERT INTO Charla VALUES (7,'Educación en la Nube');
INSERT INTO Charla VALUES (8,'Construcción Verde');
INSERT INTO Charla VALUES (9,'Prevención en la Salud');
INSERT INTO Charla VALUES (10,'Movilidad del Futuro');

INSERT INTO Demostracion VALUES (1,'Demo Robot IA');
INSERT INTO Demostracion VALUES (2,'Demo Kit Genético');
INSERT INTO Demostracion VALUES (3,'Demo Panel Solar');
INSERT INTO Demostracion VALUES (4,'Demo Drones Agrícolas');
INSERT INTO Demostracion VALUES (5,'Demo Seguridad Red');
INSERT INTO Demostracion VALUES (6,'Demo App Fintech');
INSERT INTO Demostracion VALUES (7,'Demo Aula Virtual');
INSERT INTO Demostracion VALUES (8,'Demo Materiales Verdes');
INSERT INTO Demostracion VALUES (9,'Demo Dispositivo Salud');
INSERT INTO Demostracion VALUES (10,'Demo Transporte Eléctrico');

INSERT INTO Registro VALUES (1,1,1,1,1,1,1);
INSERT INTO Registro VALUES (2,2,2,2,2,2,2);
INSERT INTO Registro VALUES (3,3,3,3,3,3,3);
INSERT INTO Registro VALUES (4,4,4,4,4,4,4);
INSERT INTO Registro VALUES (5,5,5,5,5,5,5);
INSERT INTO Registro VALUES (6,6,6,6,6,6,6);
INSERT INTO Registro VALUES (7,7,7,7,7,7,7);
INSERT INTO Registro VALUES (8,8,8,8,8,8,8);
INSERT INTO Registro VALUES (9,9,9,9,9,9,9);
INSERT INTO Registro VALUES (10,10,10,10,10,10,10);

SELECT v.id_visitante, p.nombre AS nombre_persona, t.nombre AS tipo_visitante
FROM Visitante v
JOIN Persona p ON v.id_persona = p.id_persona
JOIN Tipo_Visitante t ON v.id_tipo_visitante = t.id_tipo_visitante;

SELECT e.nombre AS empresa, s.id_stand, pa.id_pabellon, f.nombre AS feria
FROM Stand s
JOIN Empresa e ON s.id_empresa = e.id_empresa
JOIN Pabellon pa ON s.id_pabellon = pa.id_pabellon
JOIN Feria f ON pa.id_feria = f.id_feria;

SELECT pr.nombre AS producto, pe.nombre AS responsable
FROM Producto pr
JOIN Responsable r ON pr.id_responsable = r.id_responsable
JOIN Persona pe ON r.id_persona = pe.id_persona;

SELECT c.nombre AS charla, p.nombre AS ponente
FROM Registro r
JOIN Charla c ON r.id_charla = c.id_charla
JOIN Ponente po ON r.id_ponente = po.id_ponente
JOIN Persona p ON po.id_persona = p.id_persona;


SELECT p.nombre AS visitante
FROM Visitante v
JOIN Persona p ON v.id_persona = p.id_persona
WHERE v.id_visitante IN (
    SELECT r.id_visitante
    FROM Registro r
    JOIN Feria f ON r.id_feria = f.id_feria
    WHERE f.nombre = 'Feria Tecnológica 2025'
);


--Obtener productos por empresa
USE feria;
GO

CREATE PROCEDURE productos_por_empresa
    @id_empresa INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT e.nombre AS empresa, pr.nombre AS producto, pe.nombre AS responsable
    FROM dbo.Producto pr
    INNER JOIN dbo.Stand s ON pr.id_stand = s.id_stand
    INNER JOIN dbo.Empresa e ON s.id_empresa = e.id_empresa
    INNER JOIN dbo.Responsable r ON pr.id_responsable = r.id_responsable
    INNER JOIN dbo.Persona pe ON r.id_persona = pe.id_persona
    WHERE e.id_empresa = @id_empresa;
END;
GO


EXEC productos_por_empresa 2;


--Consultar visitantes de una feria
CREATE PROCEDURE visitantes_por_feria
    @id_feria INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT DISTINCT per.nombre AS visitante, tv.nombre AS tipo_visitante
    FROM dbo.Registro r
    INNER JOIN dbo.Visitante v ON r.id_visitante = v.id_visitante
    INNER JOIN dbo.Persona per ON v.id_persona = per.id_persona
    INNER JOIN dbo.Tipo_Visitante tv ON v.id_tipo_visitante = tv.id_tipo_visitante
    WHERE r.id_feria = @id_feria;
END;
GO

EXEC visitantes_por_feria 2;

--validar que un visitante no se registre dos veces en la mmisma feria
CREATE TRIGGER trg_no_registro_duplicado
ON dbo.Registro
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM dbo.Registro r
        INNER JOIN inserted i ON r.id_visitante = i.id_visitante AND r.id_feria = i.id_feria
    )
    BEGIN
        RAISERROR('El visitante ya está registrado en esta feria.', 16, 1);
    END
    ELSE
    BEGIN
        INSERT INTO dbo.Registro (id_registro, id_charla, id_feria, id_empresa, id_ponente, id_demostracion, id_visitante)
        SELECT 
            (SELECT ISNULL(MAX(id_registro),0)+1 FROM dbo.Registro),
            id_charla, id_feria, id_empresa, id_ponente, id_demostracion, id_visitante
        FROM inserted;
    END
END;
GO

------------1 SCHEMA

CREATE SCHEMA seguridad;
GO

CREATE TABLE seguridad.Usuario (
    id_usuario INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    contrasena VARCHAR(100) NOT NULL
);

CREATE TABLE seguridad.Rol (
    id_rol INT IDENTITY(1,1) PRIMARY KEY,
    nombre_rol VARCHAR(50) NOT NULL
);

CREATE TABLE seguridad.Usuario_Rol (
    id_usuario INT,
    id_rol INT,
    PRIMARY KEY (id_usuario, id_rol),
    FOREIGN KEY (id_usuario) REFERENCES seguridad.Usuario(id_usuario),
    FOREIGN KEY (id_rol) REFERENCES seguridad.Rol(id_rol)
);

CREATE TABLE seguridad.Permiso (
    id_permiso INT IDENTITY(1,1) PRIMARY KEY,
    modulo VARCHAR(50),
    accion VARCHAR(50)
);

-----usuario
INSERT INTO seguridad.Usuario (nombre, contrasena) 
VALUES ('admin', '12345');

INSERT INTO seguridad.Usuario (nombre,contrasena)
VALUES ('Santiago','88779V');

---ROL
INSERT INTO seguridad.Rol (nombre_rol) 
VALUES ('Administrador');

INSERT INTO seguridad.Rol (nombre_rol)
VALUES ('organizador')

---Usuario Rol
INSERT INTO seguridad.Usuario_Rol (id_usuario, id_rol) 
VALUES (1,1);

INSERT INTO seguridad.Usuario_Rol (id_usuario, id_rol) 
VALUES (2,2);


SELECT id_usuario, nombre
FROM seguridad.Usuario
WHERE nombre = 'admin'
  AND contrasena = '12345';

SELECT id_usuario, nombre
FROM seguridad.Usuario
WHERE nombre = 'Santiago'
  AND contrasena = '88779V';

-----------2 SCHEMA 
GO
CREATE SCHEMA persona;
GO

ALTER SCHEMA persona TRANSFER dbo.Persona;
ALTER SCHEMA persona TRANSFER dbo.Tipo_Visitante;
ALTER SCHEMA persona TRANSFER dbo.Visitante;
ALTER SCHEMA persona TRANSFER dbo.Ponente;
ALTER SCHEMA persona TRANSFER dbo.Responsable;


GO 
CREATE SCHEMA feria;
GO

ALTER SCHEMA feria TRANSFER dbo.Feria;
ALTER SCHEMA feria TRANSFER dbo.Pabellon;
ALTER SCHEMA feria TRANSFER dbo.Charla;
ALTER SCHEMA feria TRANSFER dbo.Registro;
ALTER SCHEMA feria TRANSFER dbo.Demostracion;
ALTER SCHEMA feria TRANSFER dbo.Tematica;

GO
CREATE SCHEMA empresa;
GO
ALTER SCHEMA empresa TRANSFER dbo.Empresa;
ALTER SCHEMA empresa TRANSFER dbo.Producto;
ALTER SCHEMA empresa TRANSFER dbo.Stand;


CREATE LOGIN usuario WITH PASSWORD ='12345';

CREATE USER administrador FOR LOGIN usuario;