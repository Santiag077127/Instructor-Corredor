-- ========================================
-- 1. CREAR BASE DE DATOS
-- ========================================
IF DB_ID('RedSocialDB') IS NULL
    CREATE DATABASE RedSocialDB;
GO

USE RedSocialDB;


-- ========================================
-- 2. PROCEDIMIENTO PARA CREAR TABLAS
-- ========================================
GO
CREATE PROCEDURE sp_CrearTablasRedSocial
AS
BEGIN
    -- Usuarios
    IF OBJECT_ID('Usuario') IS NULL
        CREATE TABLE Usuario (
            id_usuario INT PRIMARY KEY,
            nombre NVARCHAR(100) NOT NULL,
            correo NVARCHAR(100) UNIQUE,
            telefono NVARCHAR(20)
        );

    -- Amigos (relación entre usuarios)
    IF OBJECT_ID('Amigo') IS NULL
        CREATE TABLE Amigo (
            id_amigo INT PRIMARY KEY,
            id_usuario1 INT FOREIGN KEY REFERENCES Usuario(id_usuario),
            id_usuario2 INT FOREIGN KEY REFERENCES Usuario(id_usuario),
            fecha DATE NOT NULL
        );

    -- Publicaciones
    IF OBJECT_ID('Publicacion') IS NULL
        CREATE TABLE Publicacion (
            id_publicacion INT PRIMARY KEY,
            id_usuario INT FOREIGN KEY REFERENCES Usuario(id_usuario),
            contenido NVARCHAR(500) NOT NULL,
            fecha DATETIME NOT NULL
        );

    -- Comentarios
    IF OBJECT_ID('Comentario') IS NULL
        CREATE TABLE Comentario (
            id_comentario INT PRIMARY KEY,
            id_publicacion INT FOREIGN KEY REFERENCES Publicacion(id_publicacion),
            id_usuario INT FOREIGN KEY REFERENCES Usuario(id_usuario),
            contenido NVARCHAR(300) NOT NULL,
            fecha DATETIME NOT NULL
        );

    -- Reacciones (Me gusta, Me encanta, etc.)
    IF OBJECT_ID('Reaccion') IS NULL
        CREATE TABLE Reaccion (
            id_reaccion INT PRIMARY KEY,
            id_publicacion INT FOREIGN KEY REFERENCES Publicacion(id_publicacion),
            id_usuario INT FOREIGN KEY REFERENCES Usuario(id_usuario),
            tipo NVARCHAR(50) NOT NULL, -- Ej: Like, Love, Wow
            fecha DATETIME NOT NULL
        );

    -- Mensajes privados
    IF OBJECT_ID('Mensaje') IS NULL
        CREATE TABLE Mensaje (
            id_mensaje INT PRIMARY KEY,
            id_emisor INT FOREIGN KEY REFERENCES Usuario(id_usuario),
            id_receptor INT FOREIGN KEY REFERENCES Usuario(id_usuario),
            contenido NVARCHAR(500) NOT NULL,
            fecha DATETIME NOT NULL
        );

    -- Grupos
    IF OBJECT_ID('Grupo') IS NULL
        CREATE TABLE Grupo (
            id_grupo INT PRIMARY KEY,
            nombre NVARCHAR(100) NOT NULL,
            descripcion NVARCHAR(300),
            fecha_creacion DATE NOT NULL
        );
END;


EXEC sp_CrearTablasRedSocial;

-- ========================================
-- 3. PROCEDIMIENTO PARA INSERTAR DATOS
-- ========================================
GO
CREATE PROCEDURE sp_InsertarDatosRedSocial
AS
BEGIN
    -- Usuarios
    IF NOT EXISTS (SELECT 1 FROM Usuario)
    BEGIN
        INSERT INTO Usuario VALUES
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

    -- Grupos
    IF NOT EXISTS (SELECT 1 FROM Grupo)
    BEGIN
        INSERT INTO Grupo VALUES
        (1,'Amigos de la U','Grupo de la universidad','2025-01-01'),
        (2,'Fútbol','Amigos futboleros','2025-01-02'),
        (3,'Viajeros','Compartiendo viajes','2025-01-03'),
        (4,'Gamers','Jugadores online','2025-01-04'),
        (5,'Música','Amantes de la música','2025-01-05'),
        (6,'Cine','Películas y series','2025-01-06'),
        (7,'Programación','Compartiendo código','2025-01-07'),
        (8,'Cocina','Recetas y tips','2025-01-08'),
        (9,'Mascotas','Grupo de animales','2025-01-09'),
        (10,'Fitness','Entrenamiento y salud','2025-01-10');
    END;

    -- Publicaciones
    IF NOT EXISTS (SELECT 1 FROM Publicacion)
    BEGIN
        INSERT INTO Publicacion VALUES
        (1,1,'Hola mundo!','2025-09-01 10:00'),
        (2,2,'Mi primer post','2025-09-01 11:00'),
        (3,3,'Foto del día','2025-09-01 12:00'),
        (4,4,'Buenos días!','2025-09-01 13:00'),
        (5,5,'Nueva receta','2025-09-01 14:00'),
        (6,6,'Entrenando duro','2025-09-01 15:00'),
        (7,7,'Nuevo proyecto','2025-09-01 16:00'),
        (8,8,'De viaje a la playa','2025-09-01 17:00'),
        (9,9,'Partido de fútbol','2025-09-01 18:00'),
        (10,10,'Maratón de series','2025-09-01 19:00');
    END;

    -- Comentarios
    IF NOT EXISTS (SELECT 1 FROM Comentario)
    BEGIN
        INSERT INTO Comentario VALUES
        (1,1,2,'¡Qué bien!','2025-09-01 10:30'),
        (2,2,3,'Felicidades','2025-09-01 11:30'),
        (3,3,4,'Excelente foto','2025-09-01 12:30'),
        (4,4,5,'Saludos!','2025-09-01 13:30'),
        (5,5,6,'Me encanta','2025-09-01 14:30'),
        (6,6,7,'Muy motivador','2025-09-01 15:30'),
        (7,7,8,'Buen trabajo','2025-09-01 16:30'),
        (8,8,9,'Disfruta mucho','2025-09-01 17:30'),
        (9,9,10,'Vamos con toda','2025-09-01 18:30'),
        (10,10,1,'Gran plan','2025-09-01 19:30');
    END;

    -- Reacciones
    IF NOT EXISTS (SELECT 1 FROM Reaccion)
    BEGIN
        INSERT INTO Reaccion VALUES
        (1,1,3,'Like','2025-09-01 10:40'),
        (2,2,4,'Love','2025-09-01 11:40'),
        (3,3,5,'Like','2025-09-01 12:40'),
        (4,4,6,'Wow','2025-09-01 13:40'),
        (5,5,7,'Like','2025-09-01 14:40'),
        (6,6,8,'Love','2025-09-01 15:40'),
        (7,7,9,'Like','2025-09-01 16:40'),
        (8,8,10,'Wow','2025-09-01 17:40'),
        (9,9,1,'Like','2025-09-01 18:40'),
        (10,10,2,'Love','2025-09-01 19:40');
    END;

    -- Mensajes
    IF NOT EXISTS (SELECT 1 FROM Mensaje)
    BEGIN
        INSERT INTO Mensaje VALUES
        (1,1,2,'Hola, ¿cómo estás?','2025-09-01 09:00'),
        (2,2,1,'Bien, ¿y tú?','2025-09-01 09:05'),
        (3,3,4,'¿Jugamos esta noche?','2025-09-01 09:10'),
        (4,4,3,'Sí, claro','2025-09-01 09:15'),
        (5,5,6,'Te paso la receta','2025-09-01 09:20'),
        (6,6,5,'Gracias','2025-09-01 09:25'),
        (7,7,8,'Checa este código','2025-09-01 09:30'),
        (8,8,7,'Está genial','2025-09-01 09:35'),
        (9,9,10,'Nos vemos mañana','2025-09-01 09:40'),
        (10,10,9,'Perfecto','2025-09-01 09:45');
    END;
END;
GO

EXEC sp_InsertarDatosRedSocial;
GO

-- ========================================
-- 4. VISTAS (REPORTES)
-- ========================================

-- Publicaciones con usuario y cantidad de comentarios
CREATE OR ALTER VIEW vw_PublicacionesComentarios AS
SELECT p.id_publicacion, u.nombre AS Usuario, p.contenido, p.fecha,
       COUNT(c.id_comentario) AS TotalComentarios
FROM Publicacion p
INNER JOIN Usuario u ON p.id_usuario = u.id_usuario
LEFT JOIN Comentario c ON p.id_publicacion = c.id_publicacion
GROUP BY p.id_publicacion, u.nombre, p.contenido, p.fecha;

-- Reacciones por publicación
CREATE OR ALTER VIEW vw_ReaccionesPorPublicacion AS
SELECT p.id_publicacion, p.contenido, COUNT(r.id_reaccion) AS TotalReacciones
FROM Publicacion p
LEFT JOIN Reaccion r ON p.id_publicacion = r.id_publicacion
GROUP BY p.id_publicacion, p.contenido;

-- Mensajes enviados por usuario
CREATE OR ALTER VIEW vw_MensajesEnviados AS
SELECT u.id_usuario, u.nombre, COUNT(m.id_mensaje) AS TotalMensajes
FROM Usuario u
LEFT JOIN Mensaje m ON u.id_usuario = m.id_emisor
GROUP BY u.id_usuario, u.nombre;

-- Amigos por usuario
CREATE OR ALTER VIEW vw_AmigosPorUsuario AS
SELECT u.id_usuario, u.nombre, COUNT(a.id_amigo) AS TotalAmigos
FROM Usuario u
LEFT JOIN Amigo a ON u.id_usuario = a.id_usuario1 OR u.id_usuario = a.id_usuario2
GROUP BY u.id_usuario, u.nombre;

-- Publicaciones más recientes
CREATE OR ALTER VIEW vw_PublicacionesRecientes AS
SELECT TOP 10 p.id_publicacion, u.nombre AS Usuario, p.contenido, p.fecha
FROM Publicacion p
INNER JOIN Usuario u ON p.id_usuario = u.id_usuario
ORDER BY p.fecha DESC;

-- ========================================
-- 5. CONSULTAS DE PRUEBA
-- ========================================
SELECT TOP 10 * FROM vw_PublicacionesComentarios;
SELECT TOP 10 * FROM vw_ReaccionesPorPublicacion;
SELECT TOP 10 * FROM vw_MensajesEnviados;
SELECT TOP 10 * FROM vw_AmigosPorUsuario;
SELECT TOP 10 * FROM vw_PublicacionesRecientes;
