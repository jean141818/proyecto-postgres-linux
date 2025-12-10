-- scripts/01_database.sql
-- Creación de base de datos y tablas

-- Tabla 1: Clientes
CREATE TABLE IF NOT EXISTS clientes (
    cliente_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    telefono VARCHAR(20),
    fecha_registro DATE DEFAULT CURRENT_DATE,
    activo BOOLEAN DEFAULT TRUE
);

-- Tabla 2: Productos
CREATE TABLE IF NOT EXISTS productos (
    producto_id SERIAL PRIMARY KEY,
    nombre VARCHAR(200) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) CHECK (precio >= 0),
    stock INTEGER DEFAULT 0,
    categoria VARCHAR(50)
);

-- Tabla 3: Pedidos (relaciona clientes y productos)
CREATE TABLE IF NOT EXISTS pedidos (
    pedido_id SERIAL PRIMARY KEY,
    cliente_id INTEGER REFERENCES clientes(cliente_id),
    producto_id INTEGER REFERENCES productos(producto_id),
    cantidad INTEGER NOT NULL CHECK (cantidad > 0),
    fecha_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estado VARCHAR(20) DEFAULT 'pendiente'
);

-- Índices para mejorar rendimiento
CREATE INDEX idx_pedidos_cliente ON pedidos(cliente_id);
CREATE INDEX idx_pedidos_producto ON pedidos(producto_id);
CREATE INDEX idx_clientes_email ON clientes(email);

COMMENT ON TABLE clientes IS 'Tabla de clientes del sistema';
COMMENT ON TABLE productos IS 'Catálogo de productos disponibles';
COMMENT ON TABLE pedidos IS 'Registro de pedidos realizados';
