----5
CREATE DATABASE preyectos;
use preyectos;
CREATE TABLE Proyectos (
  id_proyecto INT PRIMARY KEY,
  nombre VARCHAR(100),
  fecha_inicio DATE,
  estado VARCHAR(20)
);

CREATE TABLE Tareas (
  id_tarea INT PRIMARY KEY,
  nombre VARCHAR(100),
  estado VARCHAR(20),
  id_proyecto INT,
  FOREIGN KEY (id_proyecto) REFERENCES Proyectos(id_proyecto)
);

CREATE TABLE Empleados (
  id_empleado INT PRIMARY KEY,
  nombre VARCHAR(100),
  cargo VARCHAR(50)
);

CREATE TABLE Departamentos (
  id_departamento INT PRIMARY KEY,
  nombre VARCHAR(50)
);

CREATE TABLE Roles (
  id_rol INT PRIMARY KEY,
  nombre VARCHAR(50)
);

CREATE TABLE Empleado_Proyecto (
  id_empleado INT,
  id_proyecto INT,
  PRIMARY KEY (id_empleado, id_proyecto),
  FOREIGN KEY (id_empleado) REFERENCES Empleados(id_empleado),
  FOREIGN KEY (id_proyecto) REFERENCES Proyectos(id_proyecto)
);

CREATE TABLE Empleado_Departamento (
  id_empleado INT,
  id_departamento INT,
  id_rol INT,
  PRIMARY KEY (id_empleado, id_departamento),
  FOREIGN KEY (id_empleado) REFERENCES Empleados(id_empleado),
  FOREIGN KEY (id_departamento) REFERENCES Departamentos(id_departamento),
  FOREIGN KEY (id_rol) REFERENCES Roles(id_rol)
);

INSERT INTO Proyectos VALUES (1, 'Sistema Contable', '2025-06-01', 'Activo');

INSERT INTO Empleados VALUES (1, 'Luis Gómez', 'Desarrollador');

INSERT INTO Departamentos VALUES (1, 'TI');

INSERT INTO Roles VALUES (1, 'Líder Técnico');

INSERT INTO Tareas VALUES (1, 'Diseño de base de datos', 'Pendiente', 1);

INSERT INTO Empleado_Proyecto VALUES (1, 1);

INSERT INTO Empleado_Departamento VALUES (1, 1, 1);

SELECT * FROM Proyectos;

SELECT nombre FROM Proyectos WHERE estado = 'Activo';

SELECT nombre FROM Proyectos WHERE fecha_inicio < '2025-07-01';

SELECT * FROM Tareas;

SELECT nombre FROM Tareas WHERE estado = 'Pendiente';

SELECT COUNT(*) AS tareas_total FROM Tareas WHERE id_proyecto = 1;

SELECT * FROM Empleados;

SELECT nombre FROM Empleados WHERE cargo = 'Desarrollador';

SELECT nombre FROM Empleados WHERE id_empleado IN (
  SELECT id_empleado FROM Empleado_Proyecto WHERE id_proyecto = 1
);

SELECT * FROM Departamentos;

SELECT nombre FROM Departamentos WHERE id_departamento = 1;

SELECT d.nombre, COUNT(ed.id_empleado) AS total_empleados
FROM Departamentos d
LEFT JOIN Empleado_Departamento ed ON d.id_departamento = ed.id_departamento
GROUP BY d.nombre;

SELECT * FROM Roles;

SELECT nombre FROM Roles WHERE nombre LIKE '%Líder%';

SELECT nombre FROM Roles WHERE id_rol IN (
  SELECT id_rol FROM Empleado_Departamento
);

SELECT * FROM Empleado_Proyecto;

SELECT id_proyecto FROM Empleado_Proyecto WHERE id_empleado = 1;

SELECT id_empleado FROM Empleado_Proyecto WHERE id_proyecto = 1;

SELECT * FROM Empleado_Departamento;

SELECT id_departamento FROM Empleado_Departamento WHERE id_empleado = 1;

SELECT id_empleado FROM Empleado_Departamento WHERE id_departamento = 1;

UPDATE Proyectos SET estado = 'Finalizado' WHERE id_proyecto = 1;

UPDATE Tareas SET estado = 'Completada' WHERE id_tarea = 1;

UPDATE Empleados SET cargo = 'Analista' WHERE id_empleado = 1;

DELETE FROM Empleado_Proyecto WHERE id_empleado = 1 AND id_proyecto = 1;

DELETE FROM Tareas WHERE id_tarea = 1;

DELETE FROM Roles WHERE id_rol = 1;

DROP TABLE Empleado_Proyecto;
DROP TABLE Tareas;
DROP TABLE Roles;

-- Empleados que trabajan en el proyecto 1
SELECT nombre FROM Empleados
WHERE id_empleado IN (
  SELECT id_empleado FROM Empleado_Proyecto WHERE id_proyecto = 1
);

-- Proyectos con tareas pendientes
SELECT nombre FROM Proyectos
WHERE id_proyecto IN (
  SELECT id_proyecto FROM Tareas WHERE estado = 'Pendiente'
);

-- Departamentos con empleados asignados
SELECT nombre FROM Departamentos
WHERE id_departamento IN (
  SELECT id_departamento FROM Empleado_Departamento
);

-- Empleados y sus proyectos
SELECT e.nombre AS empleado, p.nombre AS proyecto
FROM Empleados e
JOIN Empleado_Proyecto ep ON e.id_empleado = ep.id_empleado
JOIN Proyectos p ON ep.id_proyecto = p.id_proyecto;

-- Tareas de un proyecto
SELECT p.nombre AS proyecto, t.nombre AS tarea, t.estado
FROM Proyectos p
JOIN Tareas t ON p.id_proyecto = t.id_proyecto;

-- Empleados y sus departamentos + rol
SELECT e.nombre AS empleado, d.nombre AS departamento, r.nombre AS rol
FROM Empleados e
JOIN Empleado_Departamento ed ON e.id_empleado = ed.id_empleado
JOIN Departamentos d ON ed.id_departamento = d.id_departamento
JOIN Roles r ON ed.id_rol = r.id_rol;