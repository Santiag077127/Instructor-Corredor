CREATE TABLE Categorias (
  id_categoria INT PRIMARY KEY,
  nombre VARCHAR(50)
);

CREATE TABLE Proveedores (
  id_proveedor INT PRIMARY KEY,
  nombre VARCHAR(100),
  telefono VARCHAR(20)
);

CREATE TABLE Usuarios (
  id_usuario INT PRIMARY KEY,
  nombre VARCHAR(100),
  cargo VARCHAR(50)
);

CREATE TABLE Productos (
  id_producto INT PRIMARY KEY,
  nombre VARCHAR(100),
  tipo VARCHAR(50),
  stock INT,
  id_proveedor INT,
  FOREIGN KEY (id_proveedor) REFERENCES Proveedores(id_proveedor)
);

CREATE TABLE Producto_Categoria (
  id_producto INT,
  id_categoria INT,
  PRIMARY KEY (id_producto, id_categoria),
  FOREIGN KEY (id_producto) REFERENCES Productos(id_producto),
  FOREIGN KEY (id_categoria) REFERENCES Categorias(id_categoria)
);

CREATE TABLE Solicitudes (
  id_solicitud INT PRIMARY KEY,
  fecha DATE,
  estado VARCHAR(30),
  id_usuario INT,
  FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

CREATE TABLE Detalle_Solicitud (
  id_solicitud INT,
  id_producto INT,
  cantidad INT,
  PRIMARY KEY (id_solicitud, id_producto),
  FOREIGN KEY (id_solicitud) REFERENCES Solicitudes(id_solicitud),
  FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

INSERT INTO Categorias VALUES (1, 'Papelería');

INSERT INTO Proveedores VALUES (1, 'Distribuciones Escolar S.A.', '3100000000');

INSERT INTO Usuarios VALUES (1, 'Lucía Ramírez', 'Coordinadora');

INSERT INTO Productos VALUES (1, 'Resma de papel A4', 'Material de oficina', 100, 1);

INSERT INTO Producto_Categoria VALUES (1, 1);

INSERT INTO Solicitudes VALUES (1, '2025-07-05', 'Pendiente', 1);

INSERT INTO Detalle_Solicitud VALUES (1, 1, 20);

SELECT * FROM Productos;

SELECT nombre FROM Productos WHERE stock < 50;

SELECT nombre FROM Productos WHERE id_producto IN (
  SELECT id_producto FROM Detalle_Solicitud WHERE cantidad > 10
);

SELECT * FROM Categorias;

SELECT nombre FROM Categorias WHERE nombre LIKE '%papel%';

SELECT nombre FROM Categorias WHERE id_categoria IN (
  SELECT id_categoria FROM Producto_Categoria
);

SELECT * FROM Proveedores;

SELECT nombre FROM Proveedores WHERE telefono LIKE '310%';

SELECT nombre FROM Proveedores WHERE id_proveedor IN (
  SELECT id_proveedor FROM Productos
);

SELECT * FROM Usuarios;

SELECT nombre FROM Usuarios WHERE cargo = 'Coordinadora';

SELECT nombre FROM Usuarios WHERE id_usuario IN (
  SELECT id_usuario FROM Solicitudes
);

SELECT * FROM Solicitudes;

SELECT fecha FROM Solicitudes WHERE estado = 'Pendiente';

SELECT id_solicitud FROM Solicitudes WHERE id_usuario = 1;
🧾 Producto_Categoria (pivote)
sql
Copiar
Editar
SELECT * FROM Producto_Categoria;

SELECT id_producto FROM Producto_Categoria WHERE id_categoria = 1;

SELECT id_categoria FROM Producto_Categoria WHERE id_producto = 1;

SELECT * FROM Detalle_Solicitud;

SELECT cantidad FROM Detalle_Solicitud WHERE id_solicitud = 1;

SELECT id_producto FROM Detalle_Solicitud WHERE cantidad > 10;

UPDATE Productos SET stock = stock - 20 WHERE id_producto = 1;

UPDATE Solicitudes SET estado = 'Aprobada' WHERE id_solicitud = 1;

UPDATE Usuarios SET cargo = 'Jefe de compras' WHERE id_usuario = 1;

DELETE FROM Detalle_Solicitud WHERE id_solicitud = 1 AND id_producto = 1;

DELETE FROM Producto_Categoria WHERE id_producto = 1 AND id_categoria = 1;

DELETE FROM Solicitudes WHERE id_solicitud = 1;

DROP TABLE Detalle_Solicitud;
DROP TABLE Producto_Categoria;
DROP TABLE Solicitudes;

-- Productos pedidos en solicitudes pendientes
SELECT nombre FROM Productos
WHERE id_producto IN (
  SELECT id_producto FROM Detalle_Solicitud
  WHERE id_solicitud IN (
    SELECT id_solicitud FROM Solicitudes WHERE estado = 'Pendiente'
  )
);

-- Usuarios que han hecho solicitudes
SELECT nombre FROM Usuarios
WHERE id_usuario IN (
  SELECT id_usuario FROM Solicitudes
);

-- Categorías asociadas a productos solicitados
SELECT DISTINCT c.nombre
FROM Categorias c
WHERE id_categoria IN (
  SELECT pc.id_categoria
  FROM Producto_Categoria pc
  JOIN Detalle_Solicitud ds ON pc.id_producto = ds.id_producto
);

-- Productos y sus proveedores
SELECT p.nombre, pr.nombre AS proveedor
FROM Productos p
JOIN Proveedores pr ON p.id_proveedor = pr.id_proveedor;

-- Solicitudes con nombre del usuario solicitante
SELECT s.id_solicitud, u.nombre AS solicitante
FROM Solicitudes s
JOIN Usuarios u ON s.id_usuario = u.id_usuario;

-- Productos solicitados con cantidades y categorías
SELECT pr.nombre AS producto, ds.cantidad, c.nombre AS categoria
FROM Detalle_Solicitud ds
JOIN Productos pr ON ds.id_producto = pr.id_producto
JOIN Producto_Categoria pc ON pr.id_producto = pc.id_producto
JOIN Categorias c ON pc.id_categoria = c.id_categoria;