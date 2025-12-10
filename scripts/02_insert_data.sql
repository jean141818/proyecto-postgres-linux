-- scripts/02_insert_data.sql
-- Inserción de datos de ejemplo

-- Insertar clientes
INSERT INTO clientes (nombre, email, telefono) VALUES
('Juan Pérez', 'juan.perez@email.com', '+1234567890'),
('María García', 'maria.garcia@email.com', '+0987654321'),
('Carlos López', 'carlos.lopez@email.com', '+1122334455'),
('Ana Martínez', 'ana.martinez@email.com', NULL),
('Pedro Rodríguez', 'pedro.rodriguez@email.com', '+5566778899');

-- Insertar productos
INSERT INTO productos (nombre, descripcion, precio, stock, categoria) VALUES
('Laptop Dell XPS', 'Laptop de 15 pulgadas, 16GB RAM, 512GB SSD', 1299.99, 25, 'Electrónica'),
('Mouse Logitech MX', 'Mouse inalámbrico ergonómico', 79.99, 100, 'Accesorios'),
('Teclado Mecánico', 'Teclado mecánico RGB switches blue', 119.50, 30, 'Accesorios'),
('Monitor 27" 4K', 'Monitor UHD 4K, HDR, 144Hz', 499.99, 15, 'Electrónica'),
('Webcam HD', 'Cámara web 1080p con micrófono integrado', 59.99, 50, 'Accesorios');

-- Insertar pedidos
INSERT INTO pedidos (cliente_id, producto_id, cantidad, estado) VALUES
(1, 1, 1, 'completado'),
(1, 2, 2, 'completado'),
(2, 3, 1, 'pendiente'),
(3, 4, 1, 'en_proceso'),
(4, 5, 3, 'completado'),
(5, 1, 1, 'pendiente');
