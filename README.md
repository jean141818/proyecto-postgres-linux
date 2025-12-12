# 🟢 Proyecto PostgreSQL en Linux desde Windows 11

![GitHub](https://img.shields.io/badge/status-completado-brightgreen)
![GitHub last commit](https://img.shields.io/github/last-commit/jean141818/proyecto-postgres-linux)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-16-336791)
![Docker](https://img.shields.io/badge/Docker-✓-2496ED)
![Windows 11](https://img.shields.io/badge/Windows-11-0078D4)

**🔗 URL del Repositorio:** [https://github.com/jean141818/proyecto-postgres-linux](https://github.com/jean141818/proyecto-postgres-linux)

## 📋 Descripción del Proyecto

Este proyecto implementa un servidor **PostgreSQL en un entorno Linux** utilizando Docker, ejecutado desde **Windows 11**. Cumple con los requisitos del nivel 1 de bases de datos: instalación, creación de base de datos, 3 tablas relacionadas, inserción de datos y consultas SQL.

## 🎯 Objetivos Cumplidos

- [x] **Instalar PostgreSQL** en contenedor Linux (Docker)
- [x] **Crear base de datos** con 3 tablas relacionadas
- [x] **Insertar datos** de ejemplo en todas las tablas
- [x] **Realizar consultas SQL** complejas con JOIN
- [x] **Documentar** todo el proceso en Git/GitHub
- [x] **Capturar evidencias** de funcionamiento

## 🏗️ Arquitectura del Sistema

```text
Windows 11 (Host)
│
├── Docker Desktop con WSL2
│ │
│ └── Contenedor Linux (Debian)
│ │
│ └── PostgreSQL 16
│ │
│ ├── Base de datos: proyectodb
│ │ ├── Tabla: departamentos
│ │ ├── Tabla: empleados
│ │ └── Tabla: proyectos
│ └── Usuario: admin
│
└── Git / GitHub (Control de versiones)
```

## 📊 Esquema de Base de Datos

### **Tablas Relacionadas:**

```sql
-- 1. DEPARTAMENTOS (Tabla principal)
CREATE TABLE departamentos (
    id_dep SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    presupuesto DECIMAL(12,2)
);

-- 2. EMPLEADOS (Relacionada con departamentos)
CREATE TABLE empleados (
    id_emp SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    salario DECIMAL(10,2),
    id_dep INTEGER REFERENCES departamentos(id_dep),
    fecha_contrato DATE DEFAULT CURRENT_DATE
);

-- 3. PROYECTOS (Relacionada con empleados)
CREATE TABLE proyectos (
    id_pro SERIAL PRIMARY KEY,
    nombre_proyecto VARCHAR(200),
    id_emp_responsable INTEGER REFERENCES empleados(id_emp),
    fecha_inicio DATE,
    fecha_fin DATE
);
```
# Relaciones:
Un departamento tiene muchos empleados (1:N)

Un empleado puede ser responsable de muchos proyectos (1:N)

Un empleado pertenece a un departamento (N:1)

# 🚀 Instalación y Ejecución
## Requisitos Previos
Windows 10/11 con WSL2 habilitado

Docker Desktop instalado

Git para control de versiones

### Paso 1: Clonar el repositorio
```bash
git clone https://github.com/jean141818/proyecto-postgres-linux.git
cd proyecto-postgres-linux
```
### Paso 2: Levantar PostgreSQL con Docker
```bash
## Opción A: Usando docker-compose (recomendado)
docker-compose up -d

## Opción B: Comando directo
docker run --name postgres-windows `
  -e POSTGRES_PASSWORD=admin123 `
  -e POSTGRES_USER=admin `
  -e POSTGRES_DB=proyectodb `
  -p 5432:5432 `
  -v "${PWD}\scripts:/scripts" `
  -d postgres:latest
```
Paso 3: Acceder a la base de datos
```bash
#Conectarse al contenedor y a PostgreSQL
docker exec -it postgres-proyecto psql -U admin -d proyectodb
```
Paso 4: Ejecutar scripts SQL

```sql
-- Dentro de psql, ejecutar:
\i scripts/01_database.sql    -- Crear tablas
\i scripts/02_insert_data.sql -- Insertar datos
\i scripts/03_queries.sql     -- Ejecutar consultas
```

# 📁 Estructura del Proyecto

<img width="395" height="387" alt="image" src="https://github.com/user-attachments/assets/5e4ff6cb-3ac0-4f0b-a5d1-b865e0236e72" />

# 🔍 Consultas SQL Demostrativas

Consulta 1: Empleados con su departamento
```sql
SELECT e.nombre, e.salario, d.nombre as departamento
FROM empleados e
JOIN departamentos d ON e.id_dep = d.id_dep;
```
Consulta 2: Proyectos con responsables
```sql
SELECT p.nombre_proyecto, e.nombre as responsable, d.nombre as departamento
FROM proyectos p
JOIN empleados e ON p.id_emp_responsable = e.id_emp
JOIN departamentos d ON e.id_dep = d.id_dep;
```
Consulta 3: Estadísticas por departamento
```sql
SELECT 
    d.nombre,
    COUNT(e.id_emp) as total_empleados,
    AVG(e.salario) as salario_promedio,
    SUM(e.salario) as presupuesto_salarios
FROM departamentos d
LEFT JOIN empleados e ON d.id_dep = e.id_dep
GROUP BY d.id_dep, d.nombre;
```
# 🛠️ Comandos Útiles
## Docker
```bash
# Ver contenedores activos
docker ps
```
### Ver logs de PostgreSQL
```bash
docker logs postgres-proyecto
```
### Detener contenedor
```bash
docker stop postgres-proyecto
```
### Eliminar contenedor
```bash
docker rm postgres-proyecto
```
## PostgreSQL

```sql
-- Conectarse a la BD
\c proyectodb

-- Listar tablas
\dt

-- Ver estructura de tabla
\d nombre_tabla

-- Ejecutar script externo
\i ruta/script.sql
```

## Git
```bash
# Sincronizar cambios
git add .
git commit -m "Descripción del cambio"
git push origin main

# Actualizar repo local
git pull origin main

```
# 📊 Resultados Obtenidos
## Métricas del Proyecto:
✅ 3 tablas relacionadas creadas

✅ 15+ registros de datos insertados

✅ 5+ consultas SQL ejecutadas exitosamente

✅ 6+ capturas de evidencia documentadas

✅ 100% cobertura de objetivos del proyecto

# Tecnologías Dominadas:
Docker para contenerización

PostgreSQL para bases de datos relacionales

Linux en entorno contenedor

Git/GitHub para control de versiones

SQL para manipulación de datos




