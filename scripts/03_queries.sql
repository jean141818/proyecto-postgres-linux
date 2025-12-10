-- scripts/03_queries.sql
-- Consultas de demostración

-- 1. Todos los pedidos con información completa
SELECT 
    c.nombre as cliente,
    c.email,
    p.nombre as producto,
    pd.cantidad,
    (p.precio * pd.cantidad) as total,
    pd.fecha_pedido,
    pd.estado
FROM pedidos pd
JOIN clientes c ON pd.cliente_id = c.cliente_id
JOIN productos p ON pd.producto_id = p.producto_id
ORDER BY pd.fecha_pedido DESC;

-- 2. Total gastado por cada cliente
SELECT 
    c.nombre,
    COUNT(pd.pedido_id) as total_pedidos,
    SUM(p.precio * pd.cantidad) as total_gastado
FROM clientes c
LEFT JOIN pedidos pd ON c.cliente_id = pd.cliente_id
LEFT JOIN productos p ON pd.producto_id = p.producto_id
GROUP BY c.cliente_id, c.nombre
ORDER BY total_gastado DESC NULLS LAST;

-- 3. Productos más vendidos
SELECT 
    p.nombre,
    SUM(pd.cantidad) as unidades_vendidas,
    SUM(p.precio * pd.cantidad) as ingreso_total
FROM productos p
JOIN pedidos pd ON p.producto_id = pd.producto_id
GROUP BY p.producto_id, p.nombre
ORDER BY unidades_vendidas DESC;

-- 4. Vista para reportes
CREATE OR REPLACE VIEW reporte_ventas AS
SELECT 
    DATE(pd.fecha_pedido) as fecha,
    p.categoria,
    COUNT(*) as pedidos_dia,
    SUM(pd.cantidad) as productos_vendidos,
    SUM(p.precio * pd.cantidad) as ingresos_dia
FROM pedidos pd
JOIN productos p ON pd.producto_id = p.producto_id
WHERE pd.estado = 'completado'
GROUP BY DATE(pd.fecha_pedido), p.categoria;

-- 5. Consultar la vista
SELECT * FROM reporte_ventas ORDER BY fecha DESC;
