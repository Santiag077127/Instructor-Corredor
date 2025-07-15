--1 MER HOSPITAL
CREATE DATABASE hospital;
USE hospital;
CREATE TABLE Habitaciones (
  id_habitacion INT PRIMARY KEY,
  numero VARCHAR(10)
);

CREATE TABLE Pacientes (
  id_pac INT PRIMARY KEY,
  nombre VARCHAR(50),
  fecha_nacimiento DATE,
  id_habitacion INT,
  FOREIGN KEY (id_habitacion) REFERENCES Habitaciones(id_habitacion)
);

CREATE TABLE Médicos (
  id_med INT PRIMARY KEY,
  nombre VARCHAR(50)
);

CREATE TABLE Consultas (
  id_consulta INT PRIMARY KEY,
  fecha DATE,
  motivo VARCHAR(100),
  id_med INT,
  FOREIGN KEY (id_med) REFERENCES Médicos(id_med)
);

CREATE TABLE Especialidades (
  id_esp INT PRIMARY KEY,
  nombre VARCHAR(50)
);

CREATE TABLE Paciente_Consulta (
  id_pac INT,
  id_consulta INT,
  PRIMARY KEY (id_pac, id_consulta),
  FOREIGN KEY (id_pac) REFERENCES Pacientes(id_pac),
  FOREIGN KEY (id_consulta) REFERENCES Consultas(id_consulta)
);

CREATE TABLE Medico_Especialidad (
  id_med INT,
  id_esp INT,
  PRIMARY KEY (id_med, id_esp),
  FOREIGN KEY (id_med) REFERENCES Médicos(id_med),
  FOREIGN KEY (id_esp) REFERENCES Especialidades(id_esp)
);

INSERT INTO Habitaciones VALUES (1, 'A101');

INSERT INTO Pacientes VALUES (1, 'Laura Gómez', '1990-04-23', 1);

INSERT INTO Médicos VALUES (1, 'Dr. Martínez');

INSERT INTO Consultas VALUES (1001, '2025-07-01', 'Dolor de pecho', 1);

INSERT INTO Especialidades VALUES (201, 'Cardiología');

INSERT INTO Paciente_Consulta VALUES (1, 1001);

INSERT INTO Medico_Especialidad VALUES (1, 201);

SELECT * FROM Habitaciones;

SELECT numero FROM Habitaciones WHERE id_habitacion = 1;

SELECT h.numero, COUNT(p.id_pac) AS pacientes
FROM Habitaciones h
LEFT JOIN Pacientes p ON h.id_habitacion = p.id_habitacion
GROUP BY h.numero;

SELECT * FROM Pacientes;

SELECT nombre FROM Pacientes WHERE id_habitacion = 1;

SELECT nombre FROM Pacientes WHERE fecha_nacimiento < '2000-01-01';


SELECT * FROM Médicos;

SELECT nombre FROM Médicos WHERE especialidad = 'Cardiología';

SELECT m.nombre, COUNT(me.id_esp) AS especialidades
FROM Médicos m
JOIN Medico_Especialidad me ON m.id_med = me.id_med
GROUP BY m.nombre;

SELECT * FROM Consultas;

SELECT motivo FROM Consultas WHERE id_med = 1;

SELECT fecha FROM Consultas WHERE fecha >= '2025-07-01';

SELECT * FROM Especialidades;

SELECT nombre FROM Especialidades WHERE nombre LIKE '%Cardio%';

SELECT e.nombre, COUNT(me.id_med) AS total_medicos
FROM Especialidades e
LEFT JOIN Medico_Especialidad me ON e.id_esp = me.id_esp
GROUP BY e.nombre;

SELECT * FROM Paciente_Consulta;

SELECT id_consulta FROM Paciente_Consulta WHERE id_pac = 1;

SELECT id_pac FROM Paciente_Consulta WHERE id_consulta = 1001;

SELECT * FROM Medico_Especialidad;

SELECT id_esp FROM Medico_Especialidad WHERE id_med = 1;

SELECT id_med FROM Medico_Especialidad WHERE id_esp = 201;

-- Pacientes con consultas médicas
SELECT nombre FROM Pacientes
WHERE id_pac IN (
  SELECT id_pac FROM Paciente_Consulta
);

-- Consultas hechas por médicos especialistas en Cardiología
SELECT * FROM Consultas
WHERE id_med IN (
  SELECT id_med FROM Médicos WHERE especialidad = 'Cardiología'
);

-- Habitaciones ocupadas
SELECT * FROM Habitaciones
WHERE id_habitacion IN (
  SELECT id_habitacion FROM Pacientes
);
