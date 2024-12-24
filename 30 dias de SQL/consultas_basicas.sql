-- 5 productos mas vendidos

SELECT 
    p.nombre AS producto,
    SUM(dv.cantidad) AS cantidad_vendida
FROM 
    DetalleVentas dv
JOIN 
    Productos p ON dv.id_producto = p.id_producto
GROUP BY 
    p.nombre
ORDER BY 
    cantidad_vendida DESC
LIMIT 5;

-- Listar todos los productos

SELECT * FROM Productos;

--  Obtener información de todos los clientes

SELECT * FROM Clientes;

-- Mostrar todas las ventas realizadas

SELECT * FROM Ventas;

-- Listar detalles de ventas, incluyendo nombres de productos

SELECT 
    dv.id_detalle, 
    dv.id_venta, 
    p.nombre AS producto, 
    dv.cantidad, 
    dv.precio_unitario, 
    dv.subtotal
FROM 
    DetalleVentas dv
JOIN 
    Productos p ON dv.id_producto = p.id_producto;

-- Buscar productos con stock menor a 20

SELECT * FROM Productos WHERE stock < 20;

-- Encontrar ventas realizadas por un cliente específico (e.g., Juan Pérez)

SELECT 
    v.id_venta, 
    c.nombre AS cliente, 
    v.fecha, 
    v.total
FROM 
    Ventas v
JOIN 
    Clientes c ON v.id_cliente = c.id_cliente
WHERE 
    c.nombre = 'Juan Pérez';


