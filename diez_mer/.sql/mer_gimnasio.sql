
-- MER 10: GIMNASIO
CREATE DATABASE gimnasio;
USE gimnasio;
-- CREACIÓN DE TABLAS
CREATE TABLE Clientes (
  id_cliente INT PRIMARY KEY,
  nombre VARCHAR(100),
  cedula VARCHAR(20),
  telefono VARCHAR(20)
);

CREATE TABLE Entrenadores (
  id_entrenador INT PRIMARY KEY,
  nombre VARCHAR(100),
  especialidad VARCHAR(50)
);

CREATE TABLE Planes (
  id_plan INT PRIMARY KEY,
  nombre VARCHAR(100),
  duracion_meses INT,
  precio DECIMAL(10,2)
);

CREATE TABLE Clases (
  id_clase INT PRIMARY KEY,
  nombre VARCHAR(100),
  horario TIME
);

CREATE TABLE Pagos (
  id_pago INT PRIMARY KEY,
  fecha DATE,
  monto DECIMAL(10,2),
  id_cliente INT,
  id_plan INT,
  FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
  FOREIGN KEY (id_plan) REFERENCES Planes(id_plan)
);

CREATE TABLE Cliente_Clase (
  id_cliente INT,
  id_clase INT,
  PRIMARY KEY (id_cliente, id_clase),
  FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
  FOREIGN KEY (id_clase) REFERENCES Clases(id_clase)
);

CREATE TABLE Entrenador_Clase (
  id_entrenador INT,
  id_clase INT,
  PRIMARY KEY (id_entrenador, id_clase),
  FOREIGN KEY (id_entrenador) REFERENCES Entrenadores(id_entrenador),
  FOREIGN KEY (id_clase) REFERENCES Clases(id_clase)
);

-- INSERTS
INSERT INTO Clientes VALUES (1, 'Carlos Ruiz', '123456789', '3001234567');
INSERT INTO Entrenadores VALUES (1, 'Laura Gómez', 'Cardio');
INSERT INTO Planes VALUES (1, 'Plan Mensual', 1, 50000);
INSERT INTO Clases VALUES (1, 'Spinning', '07:00:00');
INSERT INTO Pagos VALUES (1, '2025-07-09', 50000, 1, 1);
INSERT INTO Cliente_Clase VALUES (1, 1);
INSERT INTO Entrenador_Clase VALUES (1, 1);

-- SELECTS
SELECT * FROM Clientes;
SELECT nombre FROM Clientes WHERE cedula = '123456789';
SELECT nombre FROM Clientes WHERE id_cliente IN (SELECT id_cliente FROM Pagos);

SELECT * FROM Entrenadores;
SELECT nombre FROM Entrenadores WHERE especialidad = 'Cardio';
SELECT nombre FROM Entrenadores WHERE id_entrenador IN (SELECT id_entrenador FROM Entrenador_Clase);

SELECT * FROM Planes;
SELECT nombre FROM Planes WHERE precio < 60000;
SELECT nombre FROM Planes WHERE id_plan IN (SELECT id_plan FROM Pagos);

SELECT * FROM Clases;
SELECT nombre FROM Clases WHERE horario < '12:00:00';
SELECT nombre FROM Clases WHERE id_clase IN (SELECT id_clase FROM Cliente_Clase);

SELECT * FROM Pagos;
SELECT monto FROM Pagos WHERE id_cliente = 1;
SELECT monto FROM Pagos WHERE fecha = '2025-07-09';

SELECT * FROM Cliente_Clase;
SELECT id_clase FROM Cliente_Clase WHERE id_cliente = 1;
SELECT id_cliente FROM Cliente_Clase WHERE id_clase = 1;

SELECT * FROM Entrenador_Clase;
SELECT id_clase FROM Entrenador_Clase WHERE id_entrenador = 1;
SELECT id_entrenador FROM Entrenador_Clase WHERE id_clase = 1;

-- UPDATES
UPDATE Clientes SET telefono = '3007654321' WHERE id_cliente = 1;
UPDATE Planes SET precio = 55000 WHERE id_plan = 1;
UPDATE Clases SET horario = '08:00:00' WHERE id_clase = 1;

-- DELETES
DELETE FROM Cliente_Clase WHERE id_cliente = 1 AND id_clase = 1;
DELETE FROM Entrenador_Clase WHERE id_entrenador = 1 AND id_clase = 1;
DELETE FROM Pagos WHERE id_pago = 1;

-- DROPS
DROP TABLE Cliente_Clase;
DROP TABLE Entrenador_Clase;
DROP TABLE Pagos;

-- SUBCONSULTAS
SELECT nombre FROM Clientes WHERE id_cliente IN (SELECT id_cliente FROM Pagos);
SELECT nombre FROM Clases WHERE id_clase IN (SELECT id_clase FROM Cliente_Clase WHERE id_cliente = 1);
SELECT nombre FROM Entrenadores WHERE id_entrenador IN (
  SELECT id_entrenador FROM Clases WHERE horario < '10:00:00'
);

-- JOINS
SELECT p.fecha, p.monto, c.nombre AS cliente, pl.nombre AS plan
FROM Pagos p
JOIN Clientes c ON p.id_cliente = c.id_cliente
JOIN Planes pl ON p.id_plan = pl.id_plan;

SELECT cl.nombre AS clase, e.nombre AS entrenador
FROM Entrenador_Clase ec
JOIN Clases cl ON ec.id_clase = cl.id_clase
JOIN Entrenadores e ON ec.id_entrenador = e.id_entrenador;

SELECT c.nombre AS cliente, cl.nombre AS clase
FROM Cliente_Clase cc
JOIN Clientes c ON cc.id_cliente = c.id_cliente
JOIN Clases cl ON cc.id_clase = cl.id_clase;
