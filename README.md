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
