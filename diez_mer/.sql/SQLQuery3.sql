--8
CREATE DATABASE odontologia;
USE odontologia;
CREATE TABLE Pacientes (
  id_paciente INT PRIMARY KEY,
  nombre VARCHAR(100),
  cedula VARCHAR(20),
  telefono VARCHAR(20)
);

CREATE TABLE Odontologos (
  id_odontologo INT PRIMARY KEY,
  nombre VARCHAR(100)
);

CREATE TABLE Consultorios (
  id_consultorio INT PRIMARY KEY,
  numero INT,
  piso INT
);

CREATE TABLE Citas (
  id_cita INT PRIMARY KEY,
  fecha DATE,
  hora TIME,
  id_paciente INT,
  id_odontologo INT,
  id_consultorio INT,
  FOREIGN KEY (id_paciente) REFERENCES Pacientes(id_paciente),
  FOREIGN KEY (id_odontologo) REFERENCES Odontologos(id_odontologo),
  FOREIGN KEY (id_consultorio) REFERENCES Consultorios(id_consultorio)
);

CREATE TABLE Tratamientos (
  id_tratamiento INT PRIMARY KEY,
  nombre VARCHAR(100),
  descripcion TEXT
);

CREATE TABLE Cita_Tratamiento (
  id_cita INT,
  id_tratamiento INT,
  PRIMARY KEY (id_cita, id_tratamiento),
  FOREIGN KEY (id_cita) REFERENCES Citas(id_cita),
  FOREIGN KEY (id_tratamiento) REFERENCES Tratamientos(id_tratamiento)
);

CREATE TABLE Odontologo_Especialidad (
  id_odontologo INT,
  especialidad VARCHAR(50),
  PRIMARY KEY (id_odontologo, especialidad),
  FOREIGN KEY (id_odontologo) REFERENCES Odontologos(id_odontologo)
);
INSERT INTO Pacientes VALUES (1, 'Juan Pérez', '123456789', '3101234567');

INSERT INTO Odontologos VALUES (1, 'Dra. Natalia Gómez');

INSERT INTO Consultorios VALUES (1, 101, 1);

INSERT INTO Citas VALUES (1, '2025-07-10', '08:30:00', 1, 1, 1);

INSERT INTO Tratamientos VALUES (1, 'Limpieza dental', 'Remoción de placa y sarro');

INSERT INTO Cita_Tratamiento VALUES (1, 1);

INSERT INTO Odontologo_Especialidad VALUES (1, 'Ortodoncia');

SELECT * FROM Pacientes;

SELECT nombre FROM Pacientes WHERE cedula = '123456789';

SELECT nombre FROM Pacientes WHERE id_paciente IN (
  SELECT id_paciente FROM Citas
);

SELECT * FROM Odontologos;

SELECT nombre FROM Odontologos WHERE especialidad = 'Ortodoncia';

SELECT nombre FROM Odontologos WHERE id_odontologo IN (
  SELECT id_odontologo FROM Citas
);


SELECT * FROM Consultorios;

SELECT numero FROM Consultorios WHERE piso = 1;

SELECT numero FROM Consultorios WHERE id_consultorio IN (
  SELECT id_consultorio FROM Citas
);


SELECT * FROM Citas;

SELECT fecha FROM Citas WHERE id_paciente = 1

SELECT * FROM Odontologo_Especialidad;

SELECT especialidad FROM Odontologo_Especialidad WHERE id_odontologo = 1;

SELECT id_odontologo FROM Odontologo_Especialidad WHERE especialidad = 'Ortodoncia';




SELECT hora FROM Citas WHERE id_odontologo = 1;


SELECT * FROM Tratamientos;

SELECT nombre FROM Tratamientos WHERE nombre LIKE '%Limpieza%';

SELECT nombre FROM Tratamientos WHERE id_tratamiento IN (
  SELECT id_tratamiento FROM Cita_Tratamiento
);


SELECT * FROM Cita_Tratamiento;

SELECT id_tratamiento FROM Cita_Tratamiento WHERE id_cita = 1;

SELECT id_cita FROM Cita_Tratamiento WHERE id_tratamiento = 1;


-- Especialidades de odontólogos que atendieron citas el 2025-07-10
SELECT especialidad FROM Odontologo_Especialidad
WHERE id_odontologo IN (
  SELECT id_odontologo FROM Citas WHERE fecha = '2025-07-10'
);

-- Tratamientos realizados en citas del paciente Juan Pérez
SELECT nombre FROM Tratamientos
WHERE id_tratamiento IN (
  SELECT id_tratamiento FROM Cita_Tratamiento
  WHERE id_cita IN (
    SELECT id_cita FROM Citas
    WHERE id_paciente = (
      SELECT id_paciente FROM Pacientes WHERE nombre = 'Juan Pérez'
    )
  )
);

-- Citas con nombre de paciente y odontólogo
SELECT c.fecha, c.hora, p.nombre AS paciente, o.nombre AS odontologo
FROM Citas c
JOIN Pacientes p ON c.id_paciente = p.id_paciente
JOIN Odontologos o ON c.id_odontologo = o.id_odontologo;

-- Odontólogos con todas sus especialidades
SELECT o.nombre, oe.especialidad
FROM Odontologos o
JOIN Odontologo_Especialidad oe ON o.id_odontologo = oe.id_odontologo;


UPDATE Pacientes SET telefono = '3107654321' WHERE id_paciente = 1;

UPDATE Citas SET hora = '09:00:00' WHERE id_cita = 1;

UPDATE Consultorios SET piso = 2 WHERE id_consultorio = 1;

DELETE FROM Odontologo_Especialidad WHERE id_odontologo = 1 AND especialidad = 'Ortodoncia';

DELETE FROM Cita_Tratamiento WHERE id_cita = 1 AND id_tratamiento = 1;

DELETE FROM Citas WHERE id_cita = 1;
