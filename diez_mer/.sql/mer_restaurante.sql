---9
CREATE DATABASE restaurante;
USE restaurante;
-- CREACIÓN DE TABLAS
CREATE TABLE Clientes (
  id_cliente INT PRIMARY KEY,
  nombre VARCHAR(100),
  telefono VARCHAR(20)
);

CREATE TABLE Meseros (
  id_mesero INT PRIMARY KEY,
  nombre VARCHAR(100),
  turno VARCHAR(20)
);

CREATE TABLE Mesas (
  id_mesa INT PRIMARY KEY,
  numero INT,
  capacidad INT
);

CREATE TABLE Pedidos (
  id_pedido INT PRIMARY KEY,
  fecha DATE,
  id_cliente INT,
  id_mesa INT,
  FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
  FOREIGN KEY (id_mesa) REFERENCES Mesas(id_mesa)
);

CREATE TABLE Platos (
  id_plato INT PRIMARY KEY,
  nombre VARCHAR(100),
  precio DECIMAL(8,2)
);

CREATE TABLE Pedido_Plato (
  id_pedido INT,
  id_plato INT,
  cantidad INT,
  PRIMARY KEY (id_pedido, id_plato),
  FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido),
  FOREIGN KEY (id_plato) REFERENCES Platos(id_plato)
);

CREATE TABLE Mesero_Pedido (
  id_mesero INT,
  id_pedido INT,
  PRIMARY KEY (id_mesero, id_pedido),
  FOREIGN KEY (id_mesero) REFERENCES Meseros(id_mesero),
  FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido)
);

-- INSERTS
INSERT INTO Clientes VALUES (1, 'Andrea Pérez', '3112345678');
INSERT INTO Meseros VALUES (1, 'Luis Torres', 'Noche');
INSERT INTO Mesas VALUES (1, 12, 4);
INSERT INTO Pedidos VALUES (1, '2025-07-09', 1, 1);
INSERT INTO Platos VALUES (1, 'Pasta Alfredo', 23000);
INSERT INTO Pedido_Plato VALUES (1, 1, 2);
INSERT INTO Mesero_Pedido VALUES (1, 1);

-- SELECTS
SELECT * FROM Clientes;
SELECT nombre FROM Clientes WHERE telefono LIKE '311%';
SELECT nombre FROM Clientes WHERE id_cliente IN (SELECT id_cliente FROM Pedidos);

SELECT * FROM Meseros;
SELECT nombre FROM Meseros WHERE turno = 'Noche';
SELECT nombre FROM Meseros WHERE id_mesero IN (SELECT id_mesero FROM Mesero_Pedido);

SELECT * FROM Mesas;
SELECT numero FROM Mesas WHERE capacidad >= 4;
SELECT numero FROM Mesas WHERE id_mesa IN (SELECT id_mesa FROM Pedidos);

SELECT * FROM Pedidos;
SELECT fecha FROM Pedidos WHERE id_cliente = 1;
SELECT id_pedido FROM Pedidos WHERE fecha = '2025-07-09';

SELECT * FROM Platos;
SELECT nombre FROM Platos WHERE precio > 20000;
SELECT nombre FROM Platos WHERE id_plato IN (SELECT id_plato FROM Pedido_Plato);

SELECT * FROM Pedido_Plato;
SELECT cantidad FROM Pedido_Plato WHERE id_pedido = 1;
SELECT id_plato FROM Pedido_Plato WHERE cantidad > 1;

SELECT * FROM Mesero_Pedido;
SELECT id_mesero FROM Mesero_Pedido WHERE id_pedido = 1;
SELECT id_pedido FROM Mesero_Pedido WHERE id_mesero = 1;

-- UPDATES
UPDATE Clientes SET telefono = '3109876543' WHERE id_cliente = 1;
UPDATE Mesas SET capacidad = 6 WHERE id_mesa = 1;
UPDATE Platos SET precio = 25000 WHERE id_plato = 1;

-- DELETES
DELETE FROM Pedido_Plato WHERE id_pedido = 1 AND id_plato = 1;
DELETE FROM Mesero_Pedido WHERE id_pedido = 1 AND id_mesero = 1;
DELETE FROM Pedidos WHERE id_pedido = 1;

-- DROPS
DROP TABLE Pedido_Plato;
DROP TABLE Mesero_Pedido;
DROP TABLE Pedidos;

-- SUBCONSULTAS
SELECT nombre FROM Clientes WHERE id_cliente IN (SELECT id_cliente FROM Pedidos);
SELECT nombre FROM Platos WHERE id_plato IN (
  SELECT id_plato FROM Pedido_Plato
  WHERE id_pedido IN (
    SELECT id_pedido FROM Pedidos
    WHERE id_cliente = (
      SELECT id_cliente FROM Clientes WHERE nombre = 'Andrea Pérez'
    )
  )
);
SELECT nombre FROM Meseros WHERE id_mesero IN (
  SELECT id_mesero FROM Mesero_Pedido
  WHERE id_pedido IN (SELECT id_pedido FROM Pedidos WHERE fecha = '2025-07-09')
);

-- JOINS
SELECT p.id_pedido, p.fecha, c.nombre AS cliente, m.numero AS mesa
FROM Pedidos p
JOIN Clientes c ON p.id_cliente = c.id_cliente
JOIN Mesas m ON p.id_mesa = m.id_mesa;

SELECT pl.nombre, pp.cantidad
FROM Pedido_Plato pp
JOIN Platos pl ON pp.id_plato = pl.id_plato;

SELECT me.nombre AS mesero, pe.id_pedido
FROM Mesero_Pedido pe
JOIN Meseros me ON pe.id_mesero = me.id_mesero;
