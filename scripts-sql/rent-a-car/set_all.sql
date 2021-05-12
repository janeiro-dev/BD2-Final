ALTER SESSION SET "_ORACLE_SCRIPT" = true;  
CREATE USER administrador IDENTIFIED BY password;
GRANT ALL PRIVILEGES TO administrador;
GRANT UNLIMITED TABLESPACE TO administrador;
ALTER SESSION SET CURRENT_SCHEMA = administrador;

-- Tables
start tablas/create_all_tables_rentacar.sql

-- Sequences
start secuencias/crear_secuencias.sql

-- Procedures
start procedimientos/proc_create_new_user.sql
start procedimientos/proc_drop_user.sql

-- Views

-- Synonyms

-- Triggers

-- Inserts
start insercion_de_datos/locaciones.sql
start insercion_de_datos/direcciones.sql
start insercion_de_datos/clientes.sql
start insercion_de_datos/empresas_aseguradoras.sql
start insercion_de_datos/polizas_seguros.sql
start insercion_de_datos/precios_renta.sql
start insercion_de_datos/vehiculos.sql
start insercion_de_datos/rentas_de_vehiculos.sql
start insercion_de_datos/reportes_de_averias.sql
start insercion_de_datos/suplidores.sql
start insercion_de_datos/sucursales.sql
start insercion_de_datos/adquisiciones_de_vehiculos.sql
start insercion_de_datos/proveedores_servicios.sql
start insercion_de_datos/tipos_servicios.sql
start insercion_de_datos/servicios_disponibles.sql
start insercion_de_datos/empleados_proveedores_servicios.sql
start insercion_de_datos/otros_servicios.sql
start insercion_de_datos/facturas_mantenimiento.sql
start insercion_de_datos/tipos_de_mantenimiento.sql
start insercion_de_datos/vehiculos_en_mantenimiento.sql
/* start insercion_de_datos/empleados_sucursal.sql -- todavia no estoy seguro de esta tabla*/

-- Roles
start roles_y_usuarios/create_roles.sql
start roles_y_usuarios/grant_permissions_roles.sql
