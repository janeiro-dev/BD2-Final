ALTER SESSION SET "_ORACLE_SCRIPT" = true;  
CREATE USER RENTA_CAR IDENTIFIED BY password;
GRANT ALL PRIVILEGES TO RENTA_CAR;
GRANT UNLIMITED TABLESPACE TO RENTA_CAR;

-- Tables --

start tablas/create_all_tables.sql
start add_fk_suplidor.sql

start tablas/inserts/beneficios_empleados.sql
start tablas/inserts/direccion_empleado.sql
start tablas/inserts/sucursales.sql
start tablas/inserts/puestos_trabajo.sql
start tablas/inserts/empleados.sql
start tablas/inserts/proveedores_servicios.sql
start tablas/inserts/empleados_proveedores_servicios.sql
start tablas/inserts/locacion.sql
start tablas/inserts/otros_servicios.sql
start tablas/inserts/tipos_servicios.sql
start tablas/inserts/servicios_de_proveedores.sql


-- Roles --

start create_roles.sql
start grant_permissions_roles.sql

-- Sequences --

start sequences.sql