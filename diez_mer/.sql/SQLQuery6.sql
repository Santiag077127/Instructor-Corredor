----3
CREATE DATABASE redSocial;
USE redSocial;
CREATE TABLE Usuarios (
  id_usuario INT PRIMARY KEY,
  nombre VARCHAR(100),
  email VARCHAR(100),
  tipo_usuario VARCHAR(20) -- estudiante, docente, etc.
);

CREATE TABLE Publicaciones (
  id_publicacion INT PRIMARY KEY,
  contenido TEXT,
  fecha DATE,
  id_usuario INT,
  FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

CREATE TABLE Comentarios (
  id_comentario INT PRIMARY KEY,
  contenido TEXT,
  fecha DATE,
  id_publicacion INT,
  id_usuario INT,
  FOREIGN KEY (id_publicacion) REFERENCES Publicaciones(id_publicacion),
  FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

CREATE TABLE Grupos (
  id_grupo INT PRIMARY KEY,
  nombre VARCHAR(100),
  descripcion TEXT
);

CREATE TABLE Mensajes (
  id_mensaje INT PRIMARY KEY,
  contenido TEXT,
  fecha DATE,
  id_remitente INT,
  id_destinatario INT,
  FOREIGN KEY (id_remitente) REFERENCES Usuarios(id_usuario),
  FOREIGN KEY (id_destinatario) REFERENCES Usuarios(id_usuario)
);

CREATE TABLE Usuario_Grupo (
  id_usuario INT,
  id_grupo INT,
  PRIMARY KEY (id_usuario, id_grupo),
  FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
  FOREIGN KEY (id_grupo) REFERENCES Grupos(id_grupo)
);

CREATE TABLE Reacciones (
  id_usuario INT,
  id_publicacion INT,
  tipo VARCHAR(20), -- like, love, etc.
  PRIMARY KEY (id_usuario, id_publicacion),
  FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
  FOREIGN KEY (id_publicacion) REFERENCES Publicaciones(id_publicacion)
);

INSERT INTO Usuarios VALUES (1, 'Andrea Soto', 'andrea@mail.com', 'estudiante');

INSERT INTO Grupos VALUES (1, 'Matemáticas Avanzadas', 'Grupo de ayuda académica');

INSERT INTO Publicaciones VALUES (1, '¿Alguien tiene el PDF del libro?', '2025-07-01', 1);

INSERT INTO Comentarios VALUES (1, 'Yo lo tengo, te lo paso.', '2025-07-01', 1, 1);

INSERT INTO Usuario_Grupo VALUES (1, 1);

INSERT INTO Reacciones VALUES (1, 1, 'like');

INSERT INTO Mensajes VALUES (1, 'Hola, ¿tienes las notas?', '2025-07-01', 1, 1);

SELECT * FROM Usuarios;

SELECT nombre FROM Usuarios WHERE tipo_usuario = 'docente';

SELECT nombre FROM Usuarios WHERE id_usuario IN (
  SELECT id_usuario FROM Usuario_Grupo WHERE id_grupo = 1
);

SELECT * FROM Publicaciones;

SELECT contenido FROM Publicaciones WHERE id_usuario = 1;

SELECT contenido FROM Publicaciones WHERE id_publicacion IN (
  SELECT id_publicacion FROM Reacciones WHERE tipo = 'like'
);

SELECT * FROM Comentarios;

SELECT contenido FROM Comentarios WHERE id_publicacion = 1;

SELECT contenido FROM Comentarios WHERE id_usuario = 1;

SELECT * FROM Grupos;

SELECT nombre FROM Grupos WHERE id_grupo = 1;

SELECT nombre FROM Grupos WHERE id_grupo IN (
  SELECT id_grupo FROM Usuario_Grupo WHERE id_usuario = 1
);

SELECT * FROM Mensajes;

SELECT contenido FROM Mensajes WHERE id_remitente = 1;

SELECT contenido FROM Mensajes WHERE id_destinatario = 1;

SELECT * FROM Usuario_Grupo;

SELECT id_grupo FROM Usuario_Grupo WHERE id_usuario = 1;

SELECT id_usuario FROM Usuario_Grupo WHERE id_grupo = 1;

SELECT * FROM Reacciones;

SELECT tipo FROM Reacciones WHERE id_publicacion = 1;

SELECT id_publicacion FROM Reacciones WHERE id_usuario = 1;

UPDATE Usuarios SET email = 'andrea123@mail.com' WHERE id_usuario = 1;

UPDATE Publicaciones SET contenido = '¿Alguien tiene el libro actualizado?' WHERE id_publicacion = 1;

UPDATE Mensajes SET contenido = 'Hola, ¿me pasas los apuntes?' WHERE id_mensaje = 1;

DELETE FROM Reacciones WHERE id_usuario = 1 AND id_publicacion = 1;

DELETE FROM Comentarios WHERE id_comentario = 1;

DELETE FROM Publicaciones WHERE id_publicacion = 1;

DROP TABLE Reacciones;
DROP TABLE Comentarios;
DROP TABLE Publicaciones;

-- Usuarios que reaccionaron a una publicación
SELECT nombre FROM Usuarios
WHERE id_usuario IN (
  SELECT id_usuario FROM Reacciones WHERE id_publicacion = 1
);

-- Publicaciones con al menos un comentario
SELECT id_publicacion FROM Publicaciones
WHERE id_publicacion IN (
  SELECT DISTINCT id_publicacion FROM Comentarios
);

-- Grupos con más de 1 miembro
SELECT nombre FROM Grupos
WHERE id_grupo IN (
  SELECT id_grupo FROM Usuario_Grupo
  GROUP BY id_grupo HAVING COUNT(*) > 1
);

-- Publicaciones y su autor
SELECT p.contenido, u.nombre AS autor
FROM Publicaciones p
JOIN Usuarios u ON p.id_usuario = u.id_usuario;

-- Comentarios con autor y publicación
SELECT c.contenido AS comentario, u.nombre AS autor, p.contenido AS publicacion
FROM Comentarios c
JOIN Usuarios u ON c.id_usuario = u.id_usuario
JOIN Publicaciones p ON c.id_publicacion = p.id_publicacion;

-- Usuarios y los grupos a los que pertenecen
SELECT u.nombre, g.nombre AS grupo
FROM Usuarios u
JOIN Usuario_Grupo ug ON u.id_usuario = ug.id_usuario
JOIN Grupos g ON ug.id_grupo = g.id_grupo;