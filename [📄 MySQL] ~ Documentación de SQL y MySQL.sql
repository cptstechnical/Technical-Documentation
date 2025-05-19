=======================================================================================
=======================================================================================
[📄🐬 COMANDOS BÁSICOS MySQL]:
-- Conectar a base de datos
mysql -u usuario -p

-- Crear base de datos
CREATE DATABASE mi_base;

-- Usar base de datos
USE mi_base;

-- Crear tabla
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    creado_en DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Insertar datos
INSERT INTO usuarios (nombre, email) VALUES ('Elliot', 'elliot@example.com');

-- Seleccionar datos
SELECT * FROM usuarios;

-- Actualizar datos
UPDATE usuarios SET email = 'nuevo@example.com' WHERE id = 1;

-- Borrar datos
DELETE FROM usuarios WHERE id = 1;

-- Eliminar tabla
DROP TABLE usuarios;

-- Eliminar base de datos
DROP DATABASE mi_base;


=======================================================================================
=======================================================================================
[📄🐬 CONSULTAS AVANZADAS]:
-- Seleccionar con condición
SELECT * FROM usuarios WHERE email LIKE '%@example.com';

-- Ordenar resultados
SELECT * FROM usuarios ORDER BY creado_en DESC;

-- Limitar resultados
SELECT * FROM usuarios LIMIT 10 OFFSET 20;

-- Funciones agregadas
SELECT COUNT(*) AS total FROM usuarios;

-- Agrupar y filtrar grupos
SELECT email, COUNT(*) FROM usuarios GROUP BY email HAVING COUNT(*) > 1;

-- JOIN para combinar tablas
SELECT u.nombre, p.titulo FROM usuarios u
JOIN publicaciones p ON u.id = p.usuario_id;

-- Subconsultas
SELECT * FROM usuarios WHERE id IN (SELECT usuario_id FROM publicaciones WHERE estado = 'publicado');


=======================================================================================
=======================================================================================
[📄🐬 ADMINISTRACIÓN Y SEGURIDAD]:
-- Crear usuario con contraseña
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'clave_segura';

-- Conceder permisos
GRANT SELECT, INSERT, UPDATE ON mi_base.* TO 'admin'@'localhost';

-- Revocar permisos
REVOKE DELETE ON mi_base.* FROM 'admin'@'localhost';

-- Cambiar contraseña
ALTER USER 'admin'@'localhost' IDENTIFIED BY 'nueva_clave';

-- Ver usuarios y permisos
SELECT user, host FROM mysql.user;
SHOW GRANTS FOR 'admin'@'localhost';

-- Cerrar sesión actual
EXIT;


=======================================================================================
=======================================================================================
[📄🐬 BACKUP Y RESTAURACIÓN]:
# Backup completo de una base
mysqldump -u usuario -p mi_base > backup.sql

# Restaurar base desde backup
mysql -u usuario -p mi_base < backup.sql


=======================================================================================
=======================================================================================
[📄🐬 OPTIMIZACIÓN Y MANTENIMIENTO]:
-- Mostrar tablas y su estado
SHOW TABLE STATUS FROM mi_base;

-- Optimizar tabla
OPTIMIZE TABLE usuarios;

-- Analizar tabla para estadísticas
ANALYZE TABLE usuarios;

-- Mostrar consultas lentas (configurar en my.cnf)
# slow_query_log = 1
# slow_query_log_file = /var/log/mysql/slow.log

