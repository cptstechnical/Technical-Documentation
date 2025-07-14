--=======================================================================================
--=======================================================================================
[📄🐬 ÍNDICE MySQL]:

  -- 0 - PRINCIPIOS DE BASES DE DATOS Y DIAGRAMAS DE VENN
  -- 1 - SQL BÁSICO
  -- 2 - SQL EN LINUX
  -- 3 - FUNCIONES AVANZADAS EN SQL
  -- 4 - TIPOS DE DATOS Y CÓMO SE UTILIZAN EN LA DB
  -- 5 - DML (Data Manipulation Language)
  -- 6 - DML · SELECT
  -- 7 - DCL (Data Control Language)
  -- 8 - TCL (Transaction Control Language)



--=======================================================================================
--=======================================================================================
[📄🐬 PRINCIPIOS DE BASES DE DATOS Y DIAGRAMAS DE VENN]:

Las bases de datos son sistemas diseñados para almacenar, gestionar y recuperar información de manera eficiente. En este contexto, InnoDB es un motor de almacenamiento para MySQL que ofrece soporte para transacciones, integridad referencial y bloqueo de nivel de fila. InnoDB utiliza un modelo de datos basado en tablas y es el motor por defecto en las versiones recientes de MySQL.

Diagrama de Venn de Bases de Datos:
- Datos: Información sin procesar que se almacena en la base de datos.
- Información: Datos procesados que tienen significado.
- Conocimiento: Información interpretada que puede ser utilizada para la toma de decisiones.

-- Diagrama de Venn: no | yes | no
SELECT * FROM Usuarios INNER JOIN Post ON usuarios_id = Post.Usuario_id

-- Diagrama de Venn: yes | no | no
SELECT * FROM Usuarios INNER JOIN Post ON usuarios_id = Post.Usuario_id WHERE post.usuario_id IS NULL

-- Diagrama de Venn: yes | yes | no
-- Cuando se utiliza esta forma se puede utilizar directamente JOIN en vez de LEFT JOIN, ya que es la forma por defecto
SELECT * FROM Usuarios LEFT JOIN Post ON usuarios_id = Post.Usuario_id

-- Diagrama de Venn: yes | yes | yes
SELECT * FROM Usuarios LEFT JOIN Post ON usuarios_id = Post.Usuario_id UNION SELECT * FROM Usuarios RIGHT JOIN Post ON usuarios_id = Post.Usuario_id



--=======================================================================================
--=======================================================================================
[📄🐬 SQL BÁSICO]:

SQL (Structured Query Language) es un lenguaje estándar para la gestión y manipulación de bases de datos. Se divide en varias categorías:

DML (Data Manipulation Language):
- SELECT: Recupera datos de una o más tablas.
- INSERT: Inserta nuevas filas en una tabla.
- UPDATE: Modifica datos existentes en una tabla.
- DELETE: Elimina filas de una tabla.
- MERGE: Combina registros basados en condiciones específicas.
- CALL: Llama a un procedimiento almacenado.

DDL (Data Definition Language):
- CREATE: Crea un nuevo objeto en la base de datos (tabla, índice, vista).
- ALTER: Modifica un objeto existente.
- DROP: Elimina un objeto de la base de datos.
- TRUNCATE: Elimina todas las filas de una tabla.
- RENAME: Cambia el nombre de un objeto.

DCL (Data Control Language):
- GRANT: Otorga permisos a un usuario.
- REVOKE: Revoca permisos otorgados.

TCL (Transaction Control Language):
- BEGIN o START TRANSACTION: Marca el inicio de una transacción.
- COMMIT: Confirma una transacción, aplicando los cambios.
- ROLLBACK: Revierte los cambios realizados en la transacción.
- SAVEPOINT: Crea un punto dentro de una transacción.
- RELEASE SAVEPOINT: Elimina un punto de guardado.
- SET TRANSACTION: Establece el aislamiento de la transacción.



--=======================================================================================
--=======================================================================================
[📄🐬 SQL LINUX]:

En sistemas Linux, el uso de SQL suele realizarse a través de gestores como MySQL, PostgreSQL o SQLite. 
[Mariadb:Mysql]:

-- Para iniciar sesión en MySQL o MariaDB desde la terminal
mysql -u usuario -p
    
-- Crear una base de datos
CREATE DATABASE nombre_base;

-- Usar una base de datos
USE nombre_base;

--=======================================================================================
--=======================================================================================
[📄🐬 FUNCIONES AVANZADAS EN SQL]:

Triggers:
- Definición: Procedimientos que se ejecutan automáticamente antes o después de operaciones DML.
- Ejemplo: `CREATE TRIGGER nombre_trigger BEFORE INSERT ON tabla FOR EACH ROW BEGIN ... END;`

Funciones:
- Definición: Bloques de código que pueden ser llamados en consultas.
- Ejemplo: `CREATE FUNCTION nombre_funcion(parametros) RETURNS tipo_de_dato BEGIN ... END;`

Procedimientos (Stored Procedures):
- Definición: Bloques de código SQL que se almacenan y pueden ser reutilizados.
- Ejemplo: `CREATE PROCEDURE nombre_procedimiento(parametros) BEGIN ... END;`

Transacciones (Transactions):
- Definición: Un conjunto de operaciones que se ejecutan como una sola unidad.
- Comandos TCL: BEGIN, COMMIT, ROLLBACK.

Índices (Indexes):
- Definición: Estructuras que mejoran el rendimiento de las consultas.
- Ejemplo: `CREATE INDEX idx_nombre ON tabla(columna);`

Particionado de Tablas (Table Partitioning):
- Definición: Técnica para dividir grandes tablas en subtablas más pequeñas.
- Ventajas: Mejora el rendimiento y facilita la gestión.

CTE (Common Table Expressions):
- Definición: Consultas temporales que se pueden referenciar dentro de una consulta principal.
- Ejemplo: `WITH nombre_cte AS (SELECT ...) SELECT * FROM nombre_cte;`

Consultas Recursivas:
- Definición: Consultas que se llaman a sí mismas.
- Ejemplo: `WITH RECURSIVE nombre_cte AS (SELECT ... UNION ALL SELECT ...) SELECT * FROM nombre_cte;`

Disparadores de eventos (Event Schedulers):
- Definición: Procedimientos que se ejecutan en intervalos específicos.
- Ejemplo: `CREATE EVENT nombre_evento ON SCHEDULE AT ... DO ...;`

Replicación de Base de Datos:
- Definición: Técnica para mantener copias de bases de datos en múltiples servidores.
- Tipos: Replicación maestra-esclavo, maestro-maestro.

Restricciones y Llaves Foráneas (Foreign Key Constraints):
- Definición: Reglas que aseguran la integridad referencial entre tablas.
- Ejemplo: `ALTER TABLE tabla ADD CONSTRAINT fk_nombre FOREIGN KEY (columna) REFERENCES otra_tabla(columna);`

Tablas Temporales (Temporary Tables):
- Definición: Tablas que existen solo durante la sesión actual.
- Ejemplo: `CREATE TEMPORARY TABLE nombre_tabla (...);`



--=======================================================================================
--=======================================================================================
[📄🐬 TIPOS DE DATOS Y CÓMO SE UTILIZAN EN LA DB]:
    
1. Numéricos:
- **int**: Almacena números enteros.
- **tinyint**: Para valores pequeños (0-255).
- **float y double**: Para números con decimales.

2. Cadenas de Texto:
- **varchar**: Para cadenas de longitud variable.
- **text**: Para textos más largos.

3. Fechas y Horas:
- **datetime**: Para almacenar fechas y horas.
- **date**: Solo para almacenar la fecha.
- **time**: Solo para almacenar la hora.

4. Booleanos:
- **tinyint(1)**: Representa valores booleanos (0 es falso, 1 es verdadero).

5. Otros Tipos:
- **enum**: Almacena un valor de un conjunto definido de valores.
- **set**: Almacena múltiples valores de un conjunto definido.



--=======================================================================================
--=======================================================================================
[📄🐬 DML (Data Manipulation Language)]:
    
-- Agrega un registro a la tabla people con los valores 'Hernandez' en last_name y 'Laura' en first_name.
INSERT:
INSERT INTO people(last_name, first_name) VALUES('Hernandez', 'Laura')

-- Cambia el apellido a Chavez en la tabla people, pero solo para el registro donde person_id es 1.
UPDATE:
UPDATE people SET last_name= 'Chavez' WHERE person_id = 1
    
-- Borra el registro de la tabla people donde person_id es 1.
DELETE:
dELETE FROM people WHERE person_id = 1
    
-- Muestra los valores de las columnas first_name y last_name de la tabla people. Más adelante veremos más detalles del comando SELECT.
SELECT
SELECT first_name, Last_name FROM people
    
+------------------+
|   Foreign keys   |
+------------------+
Las claves foráneas conectan una tabla con la primary key de otra. Estas siempre deben ser NOT NULL y generalmente tienen una relación de "uno a muchos". 
Por ejemplo, si usamos user_id de otra tabla, será la parte "de muchos" en people.
Cuando se eliminan o actualizan registros relacionados, puedes configurar estas opciones:

    + cascade: 
    Si un registro cambia o se elimina en una tabla, el cambio o eliminación también se aplica automáticamente en la tabla relacionada.

    + restrict: 
    No permite eliminar un registro si tiene datos relacionados en otra tabla. Primero debes borrar los datos relacionados.

    + set null: 
    Si eliminas un registro en la tabla principal, los registros relacionados en la otra tabla quedarán con un valor NULL.


** Nota sobre tablas transitivas ** :
- En una relación transitiva, la foreign key está en la tabla con cardinalidad "uno", y la tabla conectada es "de muchos".
- En los gestos de db puedo usar herramientas como Database/Reverse Engineer para crear diagramas que muestran las relaciones y cardinalidades entre tablas.



--=======================================================================================
--=======================================================================================
[📄🐬 DML · SELECT]:
    
-- Métodos de un Query:
-- El orden para usar los métodos en un query es el siguiente:

SELECT: Indica qué datos quieres mostrar.

        AS: Asigna un alias (un subnombre) a una columna o tabla.
        *: Selecciona todos los atributos de una tabla.
        AVG(): Calcula el promedio de un campo.
        COUNT(): Cuenta los registros de un campo.
        SUM(): Suma los valores de un campo.
        MAX(): Devuelve el valor máximo de un campo.
        MIN(): Devuelve el valor mínimo de un campo.
        YEAR(): Extrae el año de una fecha. También puedes usar MONTHNAME() para obtener el nombre del mes.
        GROUP_CONCAT(): Combina resultados en una lista separada por comas.

FROM: Indica de dónde provienen los datos (la tabla o tablas).

WHERE: Aplica filtros para mostrar solo los datos que cumplan ciertas condiciones.

        LIKE %valor%: Busca registros que contengan valor.
            %valor: Registros que terminan en valor.
            valor%: Registros que comienzan con valor.

BETWEEN: Busca registros entre dos valores. 
Por ejemplo:
----------------------------------------------------------------------------
    WHERE fecha_publicacion BETWEEN '2020-01-01' AND '2020-12-13';
    IS NULL: Filtra registros donde el valor es nulo.
    IS NOT NULL: Filtra registros donde el valor no es nulo.
    AND: Combina varias condiciones (ej. IS NULL AND campo > 10).
----------------------------------------------------------------------------

ORDER BY: Ordena los resultados.

        ASC: Orden ascendente (por defecto).
        DESC: Orden descendente.
        LIMIT: Restringe la cantidad de resultados que devuelve el query.

GROUP BY: Agrupa los datos por un valor común. 
Por ejemplo:
----------------------------------------------------------------------------
    SELECT apellido, AVG(nota) AS promedio 
    FROM alumnos 
    GROUP BY apellido;
    Esto calcula el promedio de las notas agrupadas por el mismo apellido.
----------------------------------------------------------------------------

HAVING: Filtra los resultados de un GROUP BY. Similar a WHERE, pero funciona sobre los grupos. 
Por ejemplo:
----------------------------------------------------------------------------
    SELECT apellido, AVG(nota) AS promedio 
    FROM alumnos 
    GROUP BY apellido 
    HAVING promedio > 7;
----------------------------------------------------------------------------

NESTED QUERIES (Consultas Anidadas): Son queries dentro de otros. Se escriben entre paréntesis y se usan en métodos como FROM o WHERE. 
Por ejemplo:
----------------------------------------------------------------------------
    SELECT nombre 
    FROM (SELECT * FROM alumnos WHERE nota > 7) subconsulta 
    WHERE subconsulta.fecha_public = '2023-01-01';
----------------------------------------------------------------------------



--=======================================================================================
--=======================================================================================
[📄🐬 DCL (Data Control Language)]:
    
-- Crear usuario:
CREATE USER 'usuario'@'host' IDENTIFIED BY 'contraseña';
CREATE USER 'usuario1'@'11.0.0.0' IDENTIFIED BY 'contraseña';

-- Otorgar permisos:
GRANT permiso1, permiso2 ON tabla TO usuario;
GRANT SELECT, INSERT ON tabla1 TO usuario1;

-- Revocar permisos:
REVOKE permiso1, permiso2 ON tabla FROM 'usuario'@'host';
REVOKE SELECT, INSERT ON tabla1 FROM 'usuario1'@'11.0.0.0';

-- WITH GRANT OPTION:
Permite al usuario otorgar esos mismos permisos a otros. Usa PUBLIC para otorgar permisos a todos los usuarios de la base de datos.
GRANT SELECT ON tabla1 TO usuario1 WITH GRANT OPTION;
GRANT SELECT ON tabla1 TO 'usuario2'@'192.168.1.1';
GRANT SELECT ON tabla1 TO PUBLIC;

-- Revocar permisos a todos:
REVOKE UPDATE ON tabla2 FROM 'usuario2'@'192.168.1.1';
REVOKE SELECT ON tabla1 FROM PUBLIC;


-- roles
-------------------------------------------------------------
-- Crear un rol:
CREATE ROLE rol;

-- Asignar permisos al rol:
GRANT permiso ON tabla TO rol;

-- Asignar el rol a usuarios:
GRANT rol TO usuario1, usuario2;

---------------------------------------
CREATE ROLE analista;
GRANT SELECT ON tabla1 TO analista;
GRANT analista TO usuario1, usuario2;
---------------------------------------



--=======================================================================================
--=======================================================================================
[📄🐬 TCL (Transaction Control Language)]:

Usa START TRANSACTION o BEGIN para comenzar una transacción.

-- COMMIT
-- Confirma y hace permanentes los cambios de la transacción actual.
----------------------------------------------------------------
START TRANSACTION;
UPDATE productos SET stock = stock - 1 WHERE id = 123;
INSERT INTO historial_ventas (producto_id, cantidad, fecha) VALUES (123, 1, NOW());
COMMIT;
----------------------------------------------------------------


-- ROLLBACK
Deshace todos los cambios de la transacción actual, restaurando el estado anterior.
----------------------------------------------------------------
START TRANSACTION;
UPDATE productos SET stock = stock - 1 WHERE id = 123;
INSERT INTO historial_ventas (producto_id, cantidad, fecha) VALUES (123, 1, NOW());
ROLLBACK;
----------------------------------------------------------------


-- SAVEPOINT
-- Crea un punto de guardado dentro de la transacción para deshacer cambios específicos.
----------------------------------------------------------------
START TRANSACTION;
UPDATE productos SET stock = stock - 1 WHERE id = 123;
SAVEPOINT punto_de_guardado;
INSERT INTO historial_ventas (producto_id, cantidad, fecha) VALUES (123, 1, NOW());
ROLLBACK TO SAVEPOINT punto_de_guardado;
----------------------------------------------------------------


-- ROLLBACK TO SAVEPOINT
-- Revierte los cambios realizados después de un punto de guardado.
----------------------------------------------------------------
START TRANSACTION;
UPDATE productos SET stock = stock - 1 WHERE id = 123;
SAVEPOINT punto_de_guardado;
INSERT INTO historial_ventas (producto_id, cantidad, fecha) VALUES (123, 1, NOW());
RELEASE SAVEPOINT punto_de_guardado;
----------------------------------------------------------------


-- RELEASE SAVEPOINT
-- Elimina un punto de guardado. Una vez eliminado, no se puede volver a él.
----------------------------------------------------------------
START TRANSACTION;
UPDATE productos SET stock = stock - 1 WHERE id = 123;
SAVEPOINT punto_de_guardado;
INSERT INTO historial_ventas (producto_id, cantidad, fecha) VALUES (123, 1, NOW());
RELEASE SAVEPOINT punto_de_guardado;
----------------------------------------------------------------
