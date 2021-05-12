alter session set "_ORACLE_SCRIPT"=true;
CREATE ROLE rol;
GRANT CONNECT TO rol;
GRANT SELECT ON empleados TO rol;
CREATE USER usuario IDENTIFIED BY clave;
GRANT rol TO usuario;

CREATE PUBLIC DATABASE LINK db_hr
CONNECT TO usuario
IDENTIFIED BY clave
USING 'ORCL';

CREATE PUBLIC SYNONYM s_empleados FOR empleados@db_hr;
SELECT * FROM s_empleados;