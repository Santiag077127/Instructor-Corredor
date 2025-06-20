----1MER
CREATE DATABASE club;
USE club;
CREATE TABLE socio (
    id_socio INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    fecha_nacimiento DATE,
    estado VARCHAR(20)
);


CREATE TABLE Disciplina (
    id_disciplina INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    categoria VARCHAR(30),  
    nivel VARCHAR(20),     
    estado VARCHAR(20)
);


CREATE TABLE Monitor (
    id_monitor INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    especialidad VARCHAR(50),
    años_experiencia INT,
    estado VARCHAR(20)
);


CREATE TABLE Sala (
    id_sala INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    capacidad INT,
    disponibilidad VARCHAR(20), 
    ubicacion VARCHAR(50)
);


CREATE TABLE Inscripcion (
    id_socio INT,
    id_disciplina INT,
    fecha_inicio DATE,
    horario TIME,
    estado VARCHAR(20),
    PRIMARY KEY (id_socio, id_disciplina),
    FOREIGN KEY (id_Socio) REFERENCES socio(id_socio),
    FOREIGN KEY (id_disciplina) REFERENCES Disciplina(id_disciplina)
);


CREATE TABLE Asignacion_Monitor (
    id_monitor INT,
    id_disciplina INT,
    fecha_asignacion DATE,
    turno VARCHAR(20),
    activo BIT,
    PRIMARY KEY (id_monitor, id_disciplina),
    FOREIGN KEY (id_monitor) REFERENCES Monitor(id_monitor),
    FOREIGN KEY (id_disciplina) REFERENCES Disciplina(id_disciplina)
);

CREATE TABLE Reserva_Sala (
    id_sala INT,
    id_disciplina INT,
    fecha_reserva DATE,
    hora_inicio TIME,
    hora_fin TIME,
    PRIMARY KEY (id_sala, id_disciplina, fecha_reserva),
    FOREIGN KEY (id_sala) REFERENCES Sala(id_sala),
    FOREIGN KEY (id_disciplina) REFERENCES Disciplina(id_disciplina)
);



INSERT INTO socio VALUES (1, 'Andrés', 'García', '1990-06-20', 'Activo');
INSERT INTO Disciplina VALUES (1, 'Spinning', 'Cardio', 'Intermedio', 'Activa');
INSERT INTO Monitor VALUES (1, 'Laura Pérez', 'Spinning', 5, 'Activo');
INSERT INTO Sala VALUES (1, 'Sala 1', 30, 'Disponible', 'Segundo piso');
INSERT INTO Inscripcion VALUES (1, 1, '2024-01-10', '18:00', 'Activo');
INSERT INTO Asignacion_Monitor VALUES (1, 1, '2024-01-01', 'Mañana', TRUE);
INSERT INTO Reserva_Sala VALUES (1, 1, '2024-06-25', '08:00', '10:00');


SELECT * FROM socio;

SELECT nombre FROM Socio WHERE estado = 'Activo';

SELECT nombre FROM Socio WHERE id_socio IN (
  SELECT id_socio FROM Inscripcion WHERE estado = 'Activo'
);

SELECT s.nombre, d.nombre FROM Socio s
JOIN Inscripcion i ON s.id_socio = i.id_socio
JOIN Disciplina d ON i.id_disciplina = d.id_disciplina;

SELECT nombre FROM Socio WHERE fecha_nacimiento < '1995-01-01';

    

SELECT * FROM Disciplina;

SELECT nombre FROM Disciplina WHERE categoria = 'Cardio';

SELECT nombre FROM Disciplina WHERE id_disciplina IN (
  SELECT id_disciplina FROM Inscripcion GROUP BY id_disciplina HAVING COUNT(*) > 1
);

SELECT d.nombre, m.nombre FROM Disciplina d
JOIN Asignacion_Monitor am ON d.id_disciplina = am.id_disciplina
JOIN Monitor m ON am.id_monitor = m.id_monitor;

SELECT nombre FROM Disciplina WHERE estado = 'Activa';



SELECT * FROM Monitor;

SELECT nombre FROM Monitor WHERE especialidad = 'Spinning';

SELECT nombre FROM Monitor WHERE id_monitor IN (
  SELECT id_monitor FROM Asignacion_Monitor WHERE activo = TRUE
);

SELECT m.nombre, d.nombre FROM Monitor m
JOIN Asignacion_Monitor am ON m.id_monitor = am.id_monitor
JOIN Disciplina d ON am.id_disciplina = d.id_disciplina;

SELECT nombre FROM Monitor WHERE años_experiencia >= 3;



SELECT * FROM Sala;

SELECT nombre FROM Sala WHERE disponibilidad = 'Disponible';

SELECT nombre FROM Sala WHERE capacidad > 20;

SELECT s.nombre, d.nombre FROM Sala s
JOIN Reserva_Sala rs ON s.id_sala = rs.id_sala
JOIN Disciplina d ON rs.id_disciplina = d.id_disciplina;

SELECT nombre FROM Sala WHERE ubicacion = 'Segundo piso';



SELECT * FROM Inscripcion;

SELECT id_socio FROM Inscripcion WHERE estado = 'Activo';

SELECT id_disciplina FROM Inscripcion WHERE horario = '18:00';

SELECT s.nombre, d.nombre FROM Inscripcion i
JOIN Socio s ON i.id_socio = s.id_socio
JOIN Disciplina d ON i.id_disciplina = d.id_disciplina;

SELECT COUNT(*) FROM Inscripcion WHERE estado = 'Activo';



SELECT * FROM Asignacion_Monitor;

SELECT id_monitor FROM Asignacion_Monitor WHERE activo = TRUE;

SELECT id_disciplina FROM Asignacion_Monitor WHERE turno = 'Mañana';

SELECT m.nombre, d.nombre FROM Asignacion_Monitor am
JOIN Monitor m ON am.id_monitor = m.id_monitor
JOIN Disciplina d ON am.id_disciplina = d.id_disciplina;

SELECT COUNT(*) FROM Asignacion_Monitor WHERE activo = TRUE;
SELECT * FROM Asignacion_Monitor;

SELECT id_monitor FROM Asignacion_Monitor WHERE activo = TRUE;

SELECT id_disciplina FROM Asignacion_Monitor WHERE turno = 'Mañana';

SELECT m.nombre, d.nombre FROM Asignacion_Monitor am
JOIN Monitor m ON am.id_monitor = m.id_monitor
JOIN Disciplina d ON am.id_disciplina = d.id_disciplina;

SELECT COUNT(*) FROM Asignacion_Monitor WHERE activo = TRUE;



SELECT * FROM Reserva_Sala;

SELECT id_sala FROM Reserva_Sala WHERE fecha_reserva = '2024-06-25';

SELECT id_disciplina FROM Reserva_Sala WHERE hora_inicio = '08:00';

SELECT sa.nombre, d.nombre FROM Reserva_Sala rs
JOIN Sala sa ON rs.id_sala = sa.id_sala
JOIN Disciplina d ON rs.id_disciplina = d.id_disciplina;

SELECT COUNT(*) FROM Reserva_Sala WHERE hora_fin > '10:00';


--2 MER
CREATE DATABASE hospital
USE hospital;
CREATE TABLE Paciente (
    id_paciente INT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    fecha_nacimiento DATE,
    estado VARCHAR(20)
);

CREATE TABLE Medico (
    id_medico INT PRIMARY KEY,
    nombre VARCHAR(50),
    especialidad VARCHAR(50),
    años_experiencia INT,
    estado VARCHAR(20)
);

CREATE TABLE Sala(
    id_sala INT PRIMARY KEY,
    numero VARCHAR(100),
    tipo VARCHAR(30),
    capacidad INT,
    disponible BIT
);

CREATE TABLE Tratamiento (
    id_tratamiento INT PRIMARY KEY,
    nombre VARCHAR(50),
    descripcion TEXT,
    duracion_dias INT,
    estado VARCHAR(20)
);

CREATE TABLE Consulta (
    id_paciente INT,
    id_medico INT,
    fecha_consulta DATE,
    diagnostico TEXT,
    estado VARCHAR(20),
    PRIMARY KEY (id_paciente, id_medico, fecha_consulta),
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente),
    FOREIGN KEY (id_medico) REFERENCES Medico(id_medico)
);

CREATE TABLE Aplicacion_Tratamiento (
    id_paciente INT,
    id_tratamiento INT,
    fecha_inicio DATE,
    fecha_fin DATE,
    resultado TEXT,
    PRIMARY KEY (id_paciente, id_tratamiento, fecha_inicio),
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente),
    FOREIGN KEY (id_tratamiento) REFERENCES Tratamiento(id_tratamiento)
);

CREATE TABLE Asignacion_Sala (
    id_sala INT,
    id_paciente INT,
    fecha_ingreso DATE,
    fecha_salida DATE,
    estado VARCHAR(20),
    PRIMARY KEY (id_sala, id_paciente, fecha_ingreso),
    FOREIGN KEY (id_sala) REFERENCES Sala(id_sala),
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente)
);



INSERT INTO Paciente VALUES (1, 'Ana', 'Rojas', '1990-05-12', 'Activo');
INSERT INTO Medico VALUES (1, 'Dr. Pedro', 'Cardiología', 15, 'Activo');
INSERT INTO Sala VALUES (1, 'U101', 'Urgencias', 4, 1);
INSERT INTO Tratamiento VALUES (1, 'Fisioterapia', 'Terapia postoperatoria', 10, 'Activo');
INSERT INTO Tratamiento VALUES (2, 'Inmovilización', 'Tratamiento para fracturas', 15, 'Activo');
INSERT INTO Tratamiento VALUES (3, 'Antibióticos', 'Para infecciones y fiebre', 7, 'Activo');

INSERT INTO Consulta VALUES (1, 1, '2025-06-10', 'Hipertensión leve', 'Atendida');
INSERT INTO Aplicacion_Tratamiento VALUES (1, 1, '2025-06-11', '2025-06-21', 'Mejoría');
INSERT INTO Asignacion_Sala VALUES (1, 1, '2025-06-10', '2025-06-15', 'Finalizado');



UPDATE Paciente SET estado = 'Egresado' WHERE id_paciente = 1;
UPDATE Tratamiento SET estado = 'Inactivo' WHERE id_tratamiento = 1;
UPDATE Consulta SET estado = 'En seguimiento' WHERE id_paciente = 1 AND id_medico = 1 AND fecha_consulta = '2025-06-10';
UPDATE Aplicacion_Tratamiento SET resultado = 'Recuperación total' WHERE id_paciente = 1 AND id_tratamiento = 1;
UPDATE Asignacion_Sala SET fecha_salida = '2025-06-14' WHERE id_sala = 1 AND id_paciente = 1;


DELETE FROM Consulta WHERE id_paciente = 1 AND id_medico = 1 AND fecha_consulta = '2025-06-10';


ALTER TABLE Paciente ADD correo VARCHAR(100);
EXEC sp_rename 'Medico.estado', 'estatus', 'COLUMN';
ALTER TABLE Tratamiento DROP COLUMN duracion_dias;

SELECT * FROM Paciente;
SELECT nombre FROM Paciente WHERE estado = 'Activo';
SELECT nombre FROM Paciente WHERE fecha_nacimiento < '1980-01-01';
SELECT p.nombre, m.nombre FROM Paciente p
JOIN Consulta c ON p.id_paciente = c.id_paciente
JOIN Medico m ON c.id_medico = m.id_medico;
SELECT COUNT(*) FROM Paciente WHERE estado = 'Egresado';


SELECT * FROM Medico;
SELECT nombre FROM Medico WHERE especialidad = 'Cardiología';
SELECT nombre FROM Medico WHERE años_experiencia > 10;
SELECT m.nombre, p.nombre FROM Medico m
JOIN Consulta c ON m.id_medico = c.id_medico
JOIN Paciente p ON c.id_paciente = p.id_paciente;
SELECT COUNT(*) FROM Medico WHERE estado = 'Activo';


SELECT * FROM Tratamiento;
SELECT nombre FROM Tratamiento WHERE estado = 'Activo';
SELECT nombre FROM Tratamiento WHERE descripcion LIKE '%terapia%';
SELECT t.nombre, p.nombre FROM Tratamiento t
JOIN Aplicacion_Tratamiento at ON t.id_tratamiento = at.id_tratamiento
JOIN Paciente p ON at.id_paciente = p.id_paciente;
SELECT COUNT(*) FROM Tratamiento;


SELECT * FROM Consulta;
SELECT id_medico FROM Consulta WHERE estado = 'Atendida';
SELECT fecha_consulta FROM Consulta WHERE diagnostico LIKE '%leve%';
SELECT c.fecha_consulta, p.nombre, m.nombre FROM Consulta c
JOIN Paciente p ON c.id_paciente = p.id_paciente
JOIN Medico m ON c.id_medico = m.id_medico;
SELECT COUNT(*) FROM Consulta WHERE estado = 'En seguimiento';


SELECT * FROM Aplicacion_Tratamiento;
SELECT id_tratamiento FROM Aplicacion_Tratamiento WHERE resultado = 'Mejoría';
SELECT fecha_fin FROM Aplicacion_Tratamiento WHERE fecha_inicio = '2025-06-11';
SELECT at.fecha_inicio, p.nombre, t.nombre FROM Aplicacion_Tratamiento at
JOIN Paciente p ON at.id_paciente = p.id_paciente
JOIN Tratamiento t ON at.id_tratamiento = t.id_tratamiento;
SELECT COUNT(*) FROM Aplicacion_Tratamiento;


SELECT * FROM Asignacion_Sala;
SELECT id_paciente FROM Asignacion_Sala WHERE estado = 'Finalizado';
SELECT fecha_salida FROM Asignacion_Sala WHERE fecha_ingreso = '2025-06-10';
SELECT COUNT(*) FROM Asignacion_Sala;

DELETE FROM socio WHERE id_socio = 1;


DELETE FROM Disciplina WHERE id_disciplina = 1;


--3 MER
CREATE DATABASE taller;
USE taller;
CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(100),
    correo VARCHAR(100),
    telefono VARCHAR(20)
);

CREATE TABLE Vehiculo (
    id_vehiculo INT PRIMARY KEY,
    placa VARCHAR(10),
    marca VARCHAR(50),
    modelo VARCHAR(50),
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

CREATE TABLE Taller (
    id_taller INT PRIMARY KEY,
    nombre_taller VARCHAR(100),
    direccion VARCHAR(200)
);

CREATE TABLE Vehiculo_Taller (
    id_vehiculo INT,
    id_taller INT,
    fecha_ingreso DATE,
    fecha_salida DATE,
    PRIMARY KEY (id_vehiculo, id_taller),
    FOREIGN KEY (id_vehiculo) REFERENCES Vehiculo(id_vehiculo),
    FOREIGN KEY (id_taller) REFERENCES Taller(id_taller)
);

CREATE TABLE Servicio (
    id_servicio INT PRIMARY KEY,
    descripcion VARCHAR(200),
    costo DECIMAL(10,2)
);

CREATE TABLE Repuesto (
    id_repuesto INT PRIMARY KEY,
    nombre VARCHAR(100),
    precio DECIMAL(10,2)
);

CREATE TABLE Servicio_Repuesto (
    id_servicio INT,
    id_repuesto INT,
    cantidad INT,
    PRIMARY KEY (id_servicio, id_repuesto),
    FOREIGN KEY (id_servicio) REFERENCES Servicio(id_servicio),
    FOREIGN KEY (id_repuesto) REFERENCES Repuesto(id_repuesto)
);

INSERT INTO Cliente VALUES
(1, 'Carlos Pérez', 'carlos@mail.com', '3001234567'),
(2, 'Laura Gómez', 'laura@mail.com', '3017654321');


INSERT INTO Vehiculo VALUES
(1, 'ABC123', 'Toyota', 'Corolla', 1),
(2, 'XYZ789', 'Mazda', '3', 1);

INSERT INTO Taller VALUES
(1, 'Taller Motor', 'Cra 10 #23-45'),
(2, 'AutoFix', 'Calle 50 #15-30');

INSERT INTO Vehiculo_Taller VALUES
(1, 1, '2025-06-01', '2025-06-05');

INSERT INTO Servicio VALUES
(1, 'Cambio de aceite', 80000),
(2, 'Alineación y balanceo', 120000);

INSERT INTO Repuesto VALUES
(1, 'Filtro de aceite', 35000),
(2, 'Llanta Rin 15', 180000);


INSERT INTO Servicio_Repuesto VALUES
(1, 1, 1);

SELECT * FROM Cliente;
SELECT nombre FROM Cliente WHERE correo LIKE '%@mail.com';
SELECT c.nombre, v.placa FROM Cliente c JOIN Vehiculo v ON c.id_cliente = v.id_cliente;
SELECT nombre FROM Cliente WHERE id_cliente IN (
    SELECT id_cliente FROM Vehiculo GROUP BY id_cliente HAVING COUNT(*) > 1
);
SELECT c.nombre, t.nombre_taller FROM Cliente c
JOIN Vehiculo v ON c.id_cliente = v.id_cliente
JOIN Vehiculo_Taller vt ON v.id_vehiculo = vt.id_vehiculo
JOIN Taller t ON vt.id_taller = t.id_taller;


SELECT * FROM Vehiculo;
SELECT placa FROM Vehiculo WHERE marca = 'Mazda';
SELECT v.placa, c.nombre FROM Vehiculo v JOIN Cliente c ON v.id_cliente = c.id_cliente;
SELECT placa FROM Vehiculo WHERE id_vehiculo IN (SELECT id_vehiculo FROM Vehiculo_Taller);
SELECT v.placa, t.nombre_taller FROM Vehiculo v
JOIN Vehiculo_Taller vt ON v.id_vehiculo = vt.id_vehiculo
JOIN Taller t ON vt.id_taller = t.id_taller;


SELECT * FROM Taller;
SELECT nombre_taller FROM Taller WHERE direccion LIKE '%Cra%';
SELECT t.nombre_taller, vt.fecha_ingreso FROM Taller t JOIN Vehiculo_Taller vt ON t.id_taller = vt.id_taller;
SELECT nombre_taller FROM Taller WHERE id_taller IN (SELECT id_taller FROM Vehiculo_Taller);
SELECT t.nombre_taller, v.placa FROM Taller t
JOIN Vehiculo_Taller vt ON t.id_taller = vt.id_taller
JOIN Vehiculo v ON vt.id_vehiculo = v.id_vehiculo;


SELECT * FROM Vehiculo_Taller;
SELECT * FROM Vehiculo_Taller WHERE fecha_salida IS NULL;
SELECT vt.fecha_ingreso, v.placa FROM Vehiculo_Taller vt JOIN Vehiculo v ON vt.id_vehiculo = v.id_vehiculo;
SELECT id_vehiculo FROM Vehiculo_Taller 
WHERE id_taller IN (SELECT id_taller FROM Taller WHERE nombre_taller = 'Taller Motor');
SELECT vt.fecha_ingreso, c.nombre FROM Vehiculo_Taller vt
JOIN Vehiculo v ON vt.id_vehiculo = v.id_vehiculo
JOIN Cliente c ON v.id_cliente = c.id_cliente;


SELECT * FROM Servicio;
SELECT descripcion FROM Servicio WHERE costo > 100000;
SELECT s.descripcion, sr.cantidad FROM Servicio s JOIN Servicio_Repuesto sr ON s.id_servicio = sr.id_servicio;
SELECT id_servicio FROM Servicio WHERE id_servicio IN (
    SELECT id_servicio FROM Servicio_Repuesto
);
SELECT s.descripcion FROM Servicio s
JOIN Servicio_Repuesto sr ON s.id_servicio = sr.id_servicio
JOIN Repuesto r ON sr.id_repuesto = r.id_repuesto
WHERE r.nombre = 'Filtro de aceite';



SELECT * FROM Repuesto;
SELECT nombre FROM Repuesto WHERE precio > 50000;
SELECT r.nombre, sr.cantidad FROM Repuesto r JOIN Servicio_Repuesto sr ON r.id_repuesto = sr.id_repuesto;
SELECT id_repuesto FROM Repuesto 
WHERE id_repuesto IN (SELECT id_repuesto FROM Servicio_Repuesto);
SELECT r.nombre FROM Repuesto r
JOIN Servicio_Repuesto sr ON r.id_repuesto = sr.id_repuesto
JOIN Servicio s ON sr.id_servicio = s.id_servicio
WHERE s.descripcion LIKE '%aceite%';

SELECT * FROM Servicio_Repuesto;
SELECT * FROM Servicio_Repuesto WHERE cantidad >= 1;
SELECT sr.cantidad, s.descripcion FROM Servicio_Repuesto sr JOIN Servicio s ON sr.id_servicio = s.id_servicio;
SELECT id_servicio FROM Servicio_Repuesto 
WHERE id_repuesto = (SELECT id_repuesto FROM Repuesto WHERE nombre = 'Filtro de aceite');
SELECT sr.cantidad, r.nombre FROM Servicio_Repuesto sr
JOIN Repuesto r ON sr.id_repuesto = r.id_repuesto
WHERE sr.id_servicio = 1;

DELETE FROM Cliente WHERE id_cliente = 2;
DELETE FROM Vehiculo WHERE id_vehiculo = 2;
DELETE FROM Taller WHERE id_taller = 2;


UPDATE Cliente SET telefono = '3000000000' WHERE id_cliente = 1;
UPDATE Vehiculo SET modelo = 'Yaris' WHERE id_vehiculo = 1;
UPDATE Taller SET direccion = 'Av. Siempre Viva #123' WHERE id_taller = 1;


--4 MER
CREATE DATABASE hotel;
use hotel;
CREATE TABLE Huesped (
    id_huesped INT PRIMARY KEY,
    nombre VARCHAR(100),
    correo VARCHAR(100),
    telefono VARCHAR(20)
);

CREATE TABLE Habitacion (
    id_habitacion INT PRIMARY KEY,
    numero VARCHAR(10),
    tipo VARCHAR(50),
    precio_noche DECIMAL(10,2)
);

CREATE TABLE Empleado (
    id_empleado INT PRIMARY KEY,
    nombre VARCHAR(100),
    cargo VARCHAR(50)
);

CREATE TABLE Reserva (
    id_reserva INT PRIMARY KEY,
    id_huesped INT,
    id_habitacion INT,
    fecha_ingreso DATE,
    fecha_salida DATE,
    FOREIGN KEY (id_huesped) REFERENCES Huesped(id_huesped),
    FOREIGN KEY (id_habitacion) REFERENCES Habitacion(id_habitacion)
);

CREATE TABLE Servicio (
    id_servicio INT PRIMARY KEY,
    nombre VARCHAR(100),
    costo DECIMAL(10,2)
);

CREATE TABLE Factura (
    id_factura INT PRIMARY KEY,
    id_reserva INT,
    fecha_emision DATE,
    total DECIMAL(10,2),
    FOREIGN KEY (id_reserva) REFERENCES Reserva(id_reserva)
);

CREATE TABLE Reserva_Servicio (
    id_reserva INT,
    id_servicio INT,
    cantidad INT,
    PRIMARY KEY (id_reserva, id_servicio),
    FOREIGN KEY (id_reserva) REFERENCES Reserva(id_reserva),
    FOREIGN KEY (id_servicio) REFERENCES Servicio(id_servicio)
);

INSERT INTO Huesped VALUES
(1, 'Juan Pérez', 'juan@mail.com', '3101234567'),
(2, 'María López', 'maria@mail.com', '3127654321');

INSERT INTO Habitacion VALUES
(1, '101', 'Doble', 200000),
(2, '102', 'Suite', 350000);


INSERT INTO Empleado VALUES
(1, 'Carlos Méndez', 'Recepcionista'),
(2, 'Laura Torres', 'Limpieza');

INSERT INTO Reserva VALUES
(1, 1, 1, '2025-06-10', '2025-06-12'),
(2, 2, 2, '2025-06-11', '2025-06-13');

INSERT INTO Servicio VALUES
(1, 'Desayuno buffet', 30000),
(2, 'Spa', 80000);

INSERT INTO Factura VALUES
(1, 1, '2025-06-12', 460000),
(2, 2, '2025-06-13', 510000);

INSERT INTO Reserva_Servicio VALUES
(1, 1, 2),
(2, 2, 1);

SELECT * FROM Huesped;
SELECT nombre FROM Huesped WHERE correo LIKE '%@mail.com';
SELECT h.nombre, r.fecha_ingreso FROM Huesped h JOIN Reserva r ON h.id_huesped = r.id_huesped;
SELECT nombre FROM Huesped WHERE id_huesped IN (
    SELECT id_huesped FROM Reserva GROUP BY id_huesped HAVING COUNT(*) > 1
);
SELECT h.nombre, ha.numero FROM Huesped h
JOIN Reserva r ON h.id_huesped = r.id_huesped
JOIN Habitacion ha ON r.id_habitacion = ha.id_habitacion;


SELECT * FROM Habitacion;
SELECT numero FROM Habitacion WHERE tipo = 'Suite';
SELECT ha.numero, r.fecha_ingreso FROM Habitacion ha JOIN Reserva r ON ha.id_habitacion = r.id_habitacion;
SELECT numero FROM Habitacion WHERE id_habitacion IN (
    SELECT id_habitacion FROM Reserva
);
SELECT ha.numero, h.nombre FROM Habitacion ha
JOIN Reserva r ON ha.id_habitacion = r.id_habitacion
JOIN Huesped h ON r.id_huesped = h.id_huesped;


SELECT * FROM Empleado;
SELECT nombre FROM Empleado WHERE cargo = 'Recepcionista';
SELECT e.nombre FROM Empleado e WHERE e.id_empleado IN (
    SELECT id_empleado FROM Empleado WHERE cargo LIKE '%Limpieza%'
);
SELECT nombre FROM Empleado WHERE id_empleado IS NOT NULL;
SELECT nombre, cargo FROM Empleado WHERE cargo IN ('Recepcionista', 'Limpieza');


SELECT * FROM Reserva;
SELECT * FROM Reserva WHERE fecha_salida = '2025-06-13';
SELECT r.id_reserva, h.nombre FROM Reserva r JOIN Huesped h ON r.id_huesped = h.id_huesped;
SELECT id_reserva FROM Reserva WHERE id_habitacion = 1;
SELECT r.id_reserva, ha.numero FROM Reserva r
JOIN Habitacion ha ON r.id_habitacion = ha.id_habitacion;


SELECT * FROM Servicio;
SELECT nombre FROM Servicio WHERE costo > 50000;
SELECT s.nombre, rs.cantidad FROM Servicio s JOIN Reserva_Servicio rs ON s.id_servicio = rs.id_servicio;
SELECT id_servicio FROM Servicio WHERE id_servicio IN (
    SELECT id_servicio FROM Reserva_Servicio
);
SELECT s.nombre FROM Servicio s
JOIN Reserva_Servicio rs ON s.id_servicio = rs.id_servicio
JOIN Reserva r ON rs.id_reserva = r.id_reserva
WHERE r.id_reserva = 1;


SELECT * FROM Factura;
SELECT total FROM Factura WHERE total > 500000;
SELECT f.total, r.fecha_ingreso FROM Factura f JOIN Reserva r ON f.id_reserva = r.id_reserva;
SELECT id_factura FROM Factura WHERE id_reserva = 1;
SELECT f.total, h.nombre FROM Factura f
JOIN Reserva r ON f.id_reserva = r.id_reserva
JOIN Huesped h ON r.id_huesped = h.id_huesped;


SELECT * FROM Reserva_Servicio;
SELECT * FROM Reserva_Servicio WHERE cantidad >= 1;
SELECT rs.cantidad, s.nombre FROM Reserva_Servicio rs JOIN Servicio s ON rs.id_servicio = s.id_servicio;
SELECT id_servicio FROM Reserva_Servicio WHERE id_reserva = 2;
SELECT s.nombre FROM Reserva_Servicio rs
JOIN Servicio s ON rs.id_servicio = s.id_servicio
WHERE rs.id_reserva = 1;


DELETE FROM Huesped WHERE id_huesped = 2;
DELETE FROM Habitacion WHERE id_habitacion = 2;
DELETE FROM Empleado WHERE id_empleado = 2;
DELETE FROM Reserva WHERE id_reserva = 2;


UPDATE Huesped SET telefono = '3009999999' WHERE id_huesped = 1;
UPDATE Habitacion SET precio_noche = 210000 WHERE id_habitacion = 1;
UPDATE Empleado SET cargo = 'Supervisor' WHERE id_empleado = 1;
UPDATE Reserva SET fecha_salida = '2025-06-13' WHERE id_reserva = 1;


--- 5 MER

Create database universidad;
USE universidad;

CREATE TABLE Estudiante (
    id_estudiante INT PRIMARY KEY,
    nombre VARCHAR(30),
    apellido VARCHAR(50)
);

CREATE TABLE Profesor (
    id_profesor INT PRIMARY KEY,
    apellido VARCHAR(30),
    email VARCHAR(30)
);

CREATE TABLE Departamento (
    id_departamento INT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE Salon (
    id_salon INT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE Curso (
    id_curso INT PRIMARY KEY,
    descripcion VARCHAR(200),
    id_departamento INT FOREIGN KEY REFERENCES Departamento(id_departamento),
    id_salon INT FOREIGN KEY REFERENCES Salon(id_salon)
);


CREATE TABLE estudiante_curso (
    id_estudiante INT,
    id_curso INT,
    PRIMARY KEY (id_estudiante, id_curso),
    FOREIGN KEY (id_estudiante) REFERENCES estudiante(id_estudiante),
    FOREIGN KEY (id_curso) REFERENCES curso(id_curso)
);

CREATE TABLE profesor_curso (
    id_profesor INT,
    id_curso INT,
    PRIMARY KEY (id_profesor, id_curso),
    FOREIGN KEY (id_profesor) REFERENCES profesor(id_profesor),
    FOREIGN KEY (id_curso) REFERENCES curso(id_curso)
);

INSERT INTO departamento VALUES (1, 'Ingeniería');
INSERT INTO departamento VALUES (2, 'Ciencias Sociales');

INSERT INTO salon VALUES (101, 'Aula A');
INSERT INTO salon VALUES (102, 'Laboratorio 1');

INSERT INTO curso VALUES (1001, 'Programación I', 1, 101);
INSERT INTO curso VALUES (1002, 'Sociología', 2, 102);

INSERT INTO estudiante VALUES (1, 'Ana', 'Perez');
INSERT INTO estudiante VALUES (2, 'Luis', 'Gomez');

INSERT INTO profesor VALUES (10, 'Rodriguez', 'rodriguez@gmail.com');
INSERT INTO profesor VALUES (11, 'Martinez', 'martinez@gmail.com');

INSERT INTO profesor_curso VALUES (10, 1001);
INSERT INTO profesor_curso VALUES (11, 1002);

INSERT INTO estudiante_curso VALUES (1, 1001);
INSERT INTO estudiante_curso VALUES (2, 1002);

SELECT * FROM estudiante;

SELECT * FROM curso
WHERE id_departamento = 1;

SELECT * FROM profesor
WHERE apellido LIKE 'M%';

SELECT * FROM salon
WHERE nombre LIKE '%aula%';

SELECT descripcion FROM curso
WHERE id_curso > 1000;

SELECT e.nombre, e.apellido, c.descripcion AS curso
FROM estudiante e
JOIN estudiante_curso ec ON e.id_estudiante = ec.id_estudiante
JOIN curso c ON ec.id_curso = c.id_curso;

SELECT c.descripcion, d.nombre AS departamento
FROM curso c
JOIN departamento d ON c.id_departamento = d.id_departamento;

SELECT p.apellido, c.descripcion AS curso
FROM profesor p
JOIN profesor_curso pc ON p.id_profesor = pc.id_profesor
JOIN curso c ON pc.id_curso = c.id_curso;


SELECT c.descripcion AS curso, s.nombre AS salon
FROM curso c
JOIN salon s ON c.id_salon = s.id_salon;

SELECT e.nombre, c.descripcion AS curso, p.apellido AS profesor
FROM estudiante e
JOIN estudiante_curso ec ON e.id_estudiante = ec.id_estudiante
JOIN curso c ON ec.id_curso = c.id_curso
JOIN profesor_curso pc ON c.id_curso = pc.id_curso
JOIN profesor p ON pc.id_profesor = p.id_profesor;

SELECT nombre FROM salon
WHERE id_salon IN (
    SELECT id_salon FROM curso
    WHERE descripcion LIKE 'Programacion%'
);

SELECT nombre FROM departamento
WHERE id_departamento IN (
    SELECT DISTINCT id_departamento FROM curso
);

SELECT descripcion FROM curso
WHERE id_curso IN (
    SELECT id_curso
    FROM estudiante_curso
    GROUP BY id_curso
    HAVING COUNT(*) >= 1
);

SELECT apellido FROM profesor
WHERE id_profesor IN (
    SELECT pc.id_profesor
    FROM profesor_curso pc
    JOIN curso c ON pc.id_curso = c.id_curso
    JOIN departamento d ON c.id_departamento = d.id_departamento
);

SELECT nombre, apellido FROM estudiante
WHERE id_estudiante IN (
    SELECT id_estudiante FROM estudiante_curso
    WHERE id_curso = 1001
);

DROP TABLE estudiante_curso;

ALTER TABLE profesor
DROP COLUMN email;
