--6
CREATE DATABASE cursos_online;
USE preyectos;
CREATE TABLE Usuarios (
  id_usuario INT PRIMARY KEY,
  nombre VARCHAR(100),
  email VARCHAR(100),
  tipo_usuario VARCHAR(20) -- estudiante, profesor
);

CREATE TABLE Cursos (
  id_curso INT PRIMARY KEY,
  titulo VARCHAR(100),
  descripcion TEXT
);

CREATE TABLE Categorias (
  id_categoria INT PRIMARY KEY,
  nombre VARCHAR(50)
);

CREATE TABLE Clases (
  id_clase INT PRIMARY KEY,
  titulo VARCHAR(100),
  id_curso INT,
  FOREIGN KEY (id_curso) REFERENCES Cursos(id_curso)
);

CREATE TABLE Inscripciones (
  id_usuario INT,
  id_curso INT,
  PRIMARY KEY (id_usuario, id_curso),
  FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
  FOREIGN KEY (id_curso) REFERENCES Cursos(id_curso)
);

CREATE TABLE Curso_Categoria (
  id_curso INT,
  id_categoria INT,
  PRIMARY KEY (id_curso, id_categoria),
  FOREIGN KEY (id_curso) REFERENCES Cursos(id_curso),
  FOREIGN KEY (id_categoria) REFERENCES Categorias(id_categoria)
);

CREATE TABLE Certificados (
  id_certificado INT PRIMARY KEY,
  id_usuario INT,
  id_curso INT,
  fecha_emision DATE,
  FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
  FOREIGN KEY (id_curso) REFERENCES Cursos(id_curso)
);

INSERT INTO Usuarios VALUES (1, 'Carlos Pérez', 'carlos@gmail.com', 'estudiante');

INSERT INTO Cursos VALUES (1, 'Python desde cero', 'Curso básico de programación en Python');

INSERT INTO Categorias VALUES (1, 'Programación');

INSERT INTO Clases VALUES (1, 'Introducción a Python', 1);

INSERT INTO Inscripciones VALUES (1, 1);

INSERT INTO Curso_Categoria VALUES (1, 1);

INSERT INTO Certificados VALUES (1, 1, 1, '2025-07-01');

SELECT * FROM Usuarios;

SELECT nombre FROM Usuarios WHERE tipo_usuario = 'estudiante';

SELECT email FROM Usuarios WHERE id_usuario = 1;

Editar
SELECT * FROM Cursos;

SELECT titulo FROM Cursos WHERE titulo LIKE '%Python%';

SELECT titulo FROM Cursos WHERE id_curso IN (
  SELECT id_curso FROM Inscripciones WHERE id_usuario = 1
);

SELECT * FROM Categorias;

SELECT nombre FROM Categorias WHERE nombre LIKE '%Progra%';

SELECT c.nombre, COUNT(cc.id_curso) AS total_cursos
FROM Categorias c
LEFT JOIN Curso_Categoria cc ON c.id_categoria = cc.id_categoria
GROUP BY c.nombre;

SELECT * FROM Clases;

SELECT titulo FROM Clases WHERE id_curso = 1;

SELECT COUNT(*) AS total_clases FROM Clases WHERE id_curso = 1;

SELECT * FROM Inscripciones;

SELECT id_curso FROM Inscripciones WHERE id_usuario = 1;

SELECT id_usuario FROM Inscripciones WHERE id_curso = 1;

SELECT * FROM Curso_Categoria;

SELECT id_categoria FROM Curso_Categoria WHERE id_curso = 1;

SELECT id_curso FROM Curso_Categoria WHERE id_categoria = 1;

SELECT * FROM Certificados;

SELECT fecha_emision FROM Certificados WHERE id_usuario = 1;

SELECT id_usuario FROM Certificados WHERE fecha_emision BETWEEN '2025-07-01' AND '2025-07-09';

UPDATE Usuarios SET email = 'c.perez@gmail.com' WHERE id_usuario = 1;

UPDATE Cursos SET titulo = 'Python Profesional' WHERE id_curso = 1;

UPDATE Certificados SET fecha_emision = '2025-07-02' WHERE id_certificado = 1;

DELETE FROM Inscripciones WHERE id_usuario = 1 AND id_curso = 1;

DELETE FROM Certificados WHERE id_certificado = 1;

DELETE FROM Cursos WHERE id_curso = 1;

DROP TABLE Certificados;
DROP TABLE Inscripciones;
DROP TABLE Cursos;

-- Cursos a los que está inscrito un usuario
SELECT titulo FROM Cursos
WHERE id_curso IN (
  SELECT id_curso FROM Inscripciones WHERE id_usuario = 1
);

-- Usuarios que tienen certificados
SELECT nombre FROM Usuarios
WHERE id_usuario IN (
  SELECT id_usuario FROM Certificados
);

-- Categorías de cursos donde participa un usuario
SELECT DISTINCT cat.nombre
FROM Categorias cat
JOIN Curso_Categoria cc ON cat.id_categoria = cc.id_categoria
WHERE cc.id_curso IN (
  SELECT id_curso FROM Inscripciones WHERE id_usuario = 1
);

-- Usuarios y cursos en los que están inscritos
SELECT u.nombre AS usuario, c.titulo AS curso
FROM Usuarios u
JOIN Inscripciones i ON u.id_usuario = i.id_usuario
JOIN Cursos c ON i.id_curso = c.id_curso;

-- Cursos y sus categorías
SELECT c.titulo, cat.nombre AS categoria
FROM Cursos c
JOIN Curso_Categoria cc ON c.id_curso = cc.id_curso
JOIN Categorias cat ON cc.id_categoria = cat.id_categoria;

-- Certificados emitidos con info de usuario y curso
SELECT u.nombre AS usuario, cu.titulo AS curso, ce.fecha_emision
FROM Certificados ce
JOIN Usuarios u ON ce.id_usuario = u.id_usuario
JOIN Cursos cu ON ce.id_curso = cu.id_curso;g.id_grupo = e.id_grupo;