![PostgreSQL](https://img.shields.io/badge/PostgreSQL-336791?style=for-the-badge&logo=postgresql&logoColor=white)

# Reto SQL 30 Días

Este repositorio contiene ejercicios para aprender SQL en 30 días, inspirado en el reto del canal **Zero Analyst** en YouTube.

## Requisitos

- **Gestor de bases de datos**: PostgreSQL o MySQL.
- **IDE recomendado**: DBeaver.

# Estructura de Archivos
tienda_minorista.sql
Este archivo contiene:

- Creación de la base de datos tienda_minorista.
- Estructura de las tablas (clientes, productos, ventas).
- Insertar datos de ejemplo en las tablas.

consultas_basicas.sql
Este archivo contiene ejemplos de consultas SQL básicas:

- SELECT, FROM y WHERE.

# Temas cubiertos
- Día 1: Introducción a SQL
- Día 2: Instalacion de postgresql
- Día 3: Comandos basicos, SELECT, FROM, WHERE

## Schema

```sql
-- Crear la base de datos (opcional si no está creada)
-- CREATE DATABASE tienda_minorista;
-- 
-- \ Conectar a la base de datos
-- \c tienda_minorista;

-- Tabla de productos
CREATE TABLE Productos (
    id_producto SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    id_proveedor INT
);

-- Tabla de clientes
CREATE TABLE Clientes (
    id_cliente SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(150),
    telefono VARCHAR(15),
    direccion TEXT
);

-- Tabla de ventas
CREATE TABLE Ventas (
    id_venta SERIAL PRIMARY KEY,
    id_cliente INT REFERENCES Clientes(id_cliente),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10, 2) NOT NULL
);

-- Tabla de detalle de ventas
CREATE TABLE DetalleVentas (
    id_detalle SERIAL PRIMARY KEY,
    id_venta INT REFERENCES Ventas(id_venta) ON DELETE CASCADE,
    id_producto INT REFERENCES Productos(id_producto),
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10, 2) NOT NULL,
    subtotal DECIMAL(10, 2) NOT NULL
);

-- Tabla de proveedores
CREATE TABLE Proveedores (
    id_proveedor SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    contacto VARCHAR(100),
    telefono VARCHAR(15),
    direccion TEXT
);

```

```sql

-- Datos de ejemplo de productos

INSERT INTO Productos (nombre, descripcion, precio, stock, id_proveedor) VALUES
('Laptop', 'Laptop de 14 pulgadas con 8GB de RAM', 800.00, 10, 1),
('Mouse', 'Mouse óptico inalámbrico', 25.50, 50, 2),
('Teclado', 'Teclado mecánico retroiluminado', 45.00, 30, 3),
('Monitor', 'Monitor LED de 24 pulgadas', 150.00, 15, 1),
('Impresora', 'Impresora multifunción', 120.00, 20, 2),
('Disco Duro', 'Disco duro externo de 1TB', 80.00, 25, 3),
('Auriculares', 'Auriculares inalámbricos con cancelación de ruido', 60.00, 40, 1),
('Cable HDMI', 'Cable HDMI de alta velocidad', 10.00, 100, 2),
('Router', 'Router inalámbrico de doble banda', 70.00, 15, 1),
('Webcam', 'Webcam Full HD con micrófono integrado', 50.00, 20, 2);

-- Datos de clientes

INSERT INTO Clientes (nombre, correo, telefono, direccion) VALUES
('Juan Pérez', 'juan.perez@email.com', '1234567890', 'Calle Falsa 123'),
('María López', 'maria.lopez@email.com', '0987654321', 'Av. Principal 456'),
('Carlos Sánchez', 'carlos.sanchez@email.com', '1122334455', 'Calle Nueva 789'),
('Lucía Fernández', 'lucia.fernandez@email.com', '6677889900', 'Pasaje Antiguo 101'),
('Andrea Martínez', 'andrea.martinez@email.com', '3344556677', 'Boulevard Central 202');

-- Datos de proveedores

INSERT INTO Proveedores (nombre, contacto, telefono, direccion) VALUES
('Proveedor A', 'Luis Ramírez', '111222333', 'Zona Industrial 1'),
('Proveedor B', 'Ana Torres', '444555666', 'Zona Comercial 2'),
('Proveedor C', 'Miguel Ortega', '777888999', 'Parque Empresarial 3'),
('Proveedor D', 'Sofía Jiménez', '555666777', 'Sector Logístico 4'),
('Proveedor E', 'Pedro Díaz', '888999000', 'Centro de Distribución 5');

-- Datos de ventas

INSERT INTO Ventas (id_cliente, total) VALUES (1, 845.00),
(2, 295.00),
(3, 120.00),
(4, 150.00),
(5, 200.00);

-- Detalle de ventas

INSERT INTO DetalleVentas (id_venta, id_producto, cantidad, precio_unitario, subtotal) VALUES
(1, 1, 1, 800.00, 800.00),
(1, 2, 1, 45.00, 45.00),
(2, 3, 2, 45.00, 90.00),
(2, 4, 1, 150.00, 150.00),
(3, 5, 1, 120.00, 120.00),
(4, 6, 2, 80.00, 160.00),
(4, 7, 1, 60.00, 60.00),
(5, 8, 5, 10.00, 50.00),
(5, 9, 1, 70.00, 70.00),
(5, 10, 2, 50.00, 100.00);

```
