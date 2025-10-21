
CREATE DATABASE UniversidadDB;


USE UniversidadDB;

GO

CREATE OR ALTER PROCEDURE sp_CrearTablasUniversidad
AS
BEGIN

    IF OBJECT_ID('Estudiante') IS NULL
    BEGIN
        CREATE TABLE Estudiante (
            id_estudiante INT PRIMARY KEY,
            nombre VARCHAR(100) NOT NULL,
            edad INT CHECK (edad > 0),
            correo VARCHAR(100) UNIQUE
        );
    END;

 
    IF OBJECT_ID('Profesor') IS NULL
    BEGIN
        CREATE TABLE Profesor (
            id_profesor INT PRIMARY KEY,
            nombre VARCHAR(100) NOT NULL,
            especialidad VARCHAR(100)
        );
    END;

  
    IF OBJECT_ID('Curso') IS NULL
    BEGIN
        CREATE TABLE Curso (
            id_curso INT PRIMARY KEY,
            nombre VARCHAR(100) NOT NULL,
            creditos INT CHECK (creditos > 0)
        );
    END;

   
    IF OBJECT_ID('Aula') IS NULL
    BEGIN
        CREATE TABLE Aula (
            id_aula INT PRIMARY KEY,
            capacidad INT CHECK (capacidad > 0),
            ubicacion VARCHAR(100)
        );
    END;

    
    IF OBJECT_ID('Horario', 'U') IS NULL
    BEGIN
        CREATE TABLE Horario (
            id_horario INT PRIMARY KEY,
            id_curso INT FOREIGN KEY REFERENCES Curso(id_curso),
            id_profesor INT FOREIGN KEY REFERENCES Profesor(id_profesor),
            id_aula INT FOREIGN KEY REFERENCES Aula(id_aula),
            dia VARCHAR(20),
            hora TIME
        );
    END;

   
    IF OBJECT_ID('Matricula') IS NULL
    BEGIN
        CREATE TABLE Matricula (
            id_matricula INT PRIMARY KEY,
            id_estudiante INT FOREIGN KEY REFERENCES Estudiante(id_estudiante),
            id_curso INT FOREIGN KEY REFERENCES Curso(id_curso),
            fecha DATE
        );
    END;

    IF OBJECT_ID('Nota') IS NULL
    BEGIN
        CREATE TABLE Nota (
            id_nota INT PRIMARY KEY,
            id_matricula INT FOREIGN KEY REFERENCES Matricula(id_matricula),
            nota DECIMAL(3,1) CHECK (nota >= 0 AND nota <= 5)
        );
    END;
END;
GO

EXEC sp_CrearTablasUniversidad;

GO

CREATE OR ALTER PROCEDURE sp_InsertarDatosUniversidad
AS
BEGIN
    -- Estudiantes
    IF NOT EXISTS (SELECT 1 FROM Estudiante)
    BEGIN
        INSERT INTO Estudiante VALUES
        (1,'Carlos Pérez',20,'carlos@uni.edu'),
        (2,'Ana Gómez',22,'ana@uni.edu'),
        (3,'Luis Torres',19,'luis@uni.edu'),
        (4,'María Ruiz',21,'maria@uni.edu'),
        (5,'Pedro López',23,'pedro@uni.edu'),
        (6,'Laura Díaz',18,'laura@uni.edu'),
        (7,'Diego Castro',24,'diego@uni.edu'),
        (8,'Paula Méndez',20,'paula@uni.edu'),
        (9,'Jorge Rojas',25,'jorge@uni.edu'),
        (10,'Elena Vargas',19,'elena@uni.edu');
    END;

    -- Profesores
    IF NOT EXISTS (SELECT 1 FROM Profesor)
    BEGIN
        INSERT INTO Profesor VALUES
        (1,'Juan Martínez','Matemáticas'),
        (2,'Sofía Herrera','Historia'),
        (3,'Andrés Morales','Programación'),
        (4,'Gabriela Castro','Física'),
        (5,'Héctor Ramírez','Biología'),
        (6,'Verónica Salas','Química'),
        (7,'Camilo Rodríguez','Estadística'),
        (8,'Daniela Ortiz','Literatura'),
        (9,'Felipe Torres','Filosofía'),
        (10,'Natalia Jiménez','Sociología');
    END;

    -- Cursos
    IF NOT EXISTS (SELECT 1 FROM Curso)
    BEGIN
        INSERT INTO Curso VALUES
        (1,'Álgebra Lineal',4),
        (2,'Historia Universal',3),
        (3,'Programación I',5),
        (4,'Física Mecánica',4),
        (5,'Biología General',3),
        (6,'Química Orgánica',4),
        (7,'Estadística I',3),
        (8,'Literatura Española',2),
        (9,'Filosofía Antigua',2),
        (10,'Sociología Moderna',3);
    END;

    -- Aulas
    IF NOT EXISTS (SELECT 1 FROM Aula)
    BEGIN
        INSERT INTO Aula VALUES
        (1,40,'Edificio A - 201'),
        (2,35,'Edificio A - 202'),
        (3,30,'Edificio B - 101'),
        (4,25,'Edificio B - 102'),
        (5,50,'Edificio C - 301'),
        (6,40,'Edificio C - 302'),
        (7,20,'Edificio D - 401'),
        (8,60,'Auditorio Principal'),
        (9,15,'Laboratorio 1'),
        (10,15,'Laboratorio 2');
    END;

    -- Horarios
    IF NOT EXISTS (SELECT 1 FROM Horario)
    BEGIN
        INSERT INTO Horario VALUES
        (1,1,1,1,'Lunes','08:00'),
        (2,2,2,2,'Martes','10:00'),
        (3,3,3,3,'Miércoles','14:00'),
        (4,4,4,4,'Jueves','09:00'),
        (5,5,5,5,'Viernes','11:00'),
        (6,6,6,6,'Lunes','13:00'),
        (7,7,7,7,'Martes','15:00'),
        (8,8,8,8,'Miércoles','08:00'),
        (9,9,9,9,'Jueves','10:00'),
        (10,10,10,10,'Viernes','12:00');
    END;

    -- Matrículas
    IF NOT EXISTS (SELECT 1 FROM Matricula)
    BEGIN
        INSERT INTO Matricula VALUES
        (1,1,1,'2025-01-15'),
        (2,2,2,'2025-01-16'),
        (3,3,3,'2025-01-17'),
        (4,4,4,'2025-01-18'),
        (5,5,5,'2025-01-19'),
        (6,6,6,'2025-01-20'),
        (7,7,7,'2025-01-21'),
        (8,8,8,'2025-01-22'),
        (9,9,9,'2025-01-23'),
        (10,10,10,'2025-01-24');
    END;

    -- Notas
    IF NOT EXISTS (SELECT 1 FROM Nota)
    BEGIN
        INSERT INTO Nota VALUES
        (1,1,4.5),(2,2,3.8),(3,3,2.9),(4,4,4.0),(5,5,3.5),
        (6,6,2.5),(7,7,4.8),(8,8,3.0),(9,9,4.2),(10,10,1.9);
    END;
END;
GO


--REPORTES
-- Estudiantes con sus cursos

CREATE VIEW vw_EstudiantesCurso AS
SELECT e.id_estudiante, e.nombre AS estudiante, c.nombre AS curso, m.fecha
FROM Estudiante e
INNER JOIN Matricula m ON e.id_estudiante = m.id_estudiante
INNER JOIN Curso c ON m.id_curso = c.id_curso;
GO

-- Profesores con los cursos que dictan
CREATE VIEW vw_ProfesoresCurso AS
SELECT p.id_profesor, p.nombre AS profesor, c.nombre AS curso, h.dia, h.hora
FROM Profesor p
INNER JOIN Horario h ON p.id_profesor = h.id_profesor
INNER JOIN Curso c ON h.id_curso = c.id_curso;
GO

-- Promedio de notas por estudiante
CREATE VIEW vw_PromedioNotasEstudiante AS
SELECT e.id_estudiante, e.nombre, AVG(n.nota) AS promedio
FROM Estudiante e
INNER JOIN Matricula m ON e.id_estudiante = m.id_estudiante
INNER JOIN Nota n ON m.id_matricula = n.id_matricula
GROUP BY e.id_estudiante, e.nombre;
GO

-- Cursos con cantidad de estudiantes
CREATE VIEW vw_CursosConEstudiante AS
SELECT c.id_curso, c.nombre AS curso, COUNT(m.id_estudiante) AS total_estudiantes
FROM Curso c
LEFT JOIN Matricula m ON c.id_curso = m.id_curso
GROUP BY c.id_curso, c.nombre;
GO

-- Aulas con cursos asignados
CREATE VIEW vw_AulasCurso AS
SELECT a.id_aula, a.ubicacion, a.capacidad, c.nombre AS curso, h.dia, h.hora
FROM Aula a
INNER JOIN Horario h ON a.id_aula = h.id_aula
INNER JOIN Curso c ON h.id_curso = c.id_curso;
GO

-- Insertar registros
EXEC sp_InsertarDatosUniversidad;

-- Consultar las vistas (reportes)
SELECT TOP 10 * FROM vw_EstudiantesCursos;
SELECT TOP 10 * FROM vw_ProfesoresCursos;
SELECT TOP 10 * FROM vw_PromedioNotasEstudiantes;
SELECT TOP 10 * FROM vw_CursosConEstudiantes;
SELECT TOP 10 * FROM vw_AulasCursos;

--Estudiante
CREATE INDEX idx_estudiante_nombre ON estudiante(nombre);

SELECT nombre FROM estudiante;

--Profesor
CREATE NONCLUSTERED INDEX idx_profesor_nombre ON Profesor(nombre);

SELECT nombre FROM Profesor;

---Curso
create index idx_curso_creditos on curso(nombre,creditos);

select nombre from curso;

---Nota
CREATE INDEX edx_nota ON Nota (nota);
select nota from Nota;

---Horario
CREATE INDEX idx_horario ON Horario(dia,hora);
SELECT dia FROM Horario;