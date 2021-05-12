prompt '*** Estableciendo permisos a rol Director'

BEGIN
    FOR t IN (select * from all_tables where owner='ADMINISTRADOR')
    LOOP
    EXECUTE IMMEDIATE 'GRANT ALL PRIVILEGES ON ' || t.owner || '.' || t.table_name || ' TO DIRECTOR';
    END LOOP;
END;
/

prompt '*** Estableciendo permisos a rol Gerente'
--GRANT SELECT, INSERT, DELETE, UPDATE ON empleados TO GERENTE;
--GRANT SELECT, INSERT, DELETE, UPDATE ON direccion_empleado TO GERENTE;
GRANT SELECT, INSERT, DELETE, UPDATE ON suplidores TO GERENTE;
GRANT SELECT, INSERT, DELETE, UPDATE ON clientes TO GERENTE;
GRANT SELECT, INSERT, DELETE, UPDATE ON direcciones TO GERENTE;
GRANT SELECT, INSERT, DELETE, UPDATE ON locaciones TO GERENTE;
GRANT SELECT, INSERT, DELETE, UPDATE ON vehiculos TO GERENTE;
GRANT SELECT, INSERT, DELETE, UPDATE ON adquisiciones_de_vehiculos TO GERENTE;
GRANT SELECT, INSERT, DELETE, UPDATE ON vehiculos_en_mantenimiento TO GERENTE;
GRANT SELECT, INSERT, DELETE, UPDATE ON reportes_de_averias TO GERENTE;
GRANT SELECT, INSERT, DELETE, UPDATE ON rentas_de_vehiculos TO GERENTE;
GRANT SELECT, INSERT, DELETE, UPDATE ON proveedores_servicios TO GERENTE;
GRANT SELECT, INSERT, DELETE, UPDATE ON proveedores_servicios TO GERENTE;
GRANT SELECT, INSERT, DELETE, UPDATE ON empleados_proveedores_servicios TO GERENTE;
GRANT SELECT, INSERT, DELETE, UPDATE ON otros_servicios TO GERENTE;

--GRANT SELECT ON beneficios_empleados TO GERENTE;
--GRANT SELECT ON puestos_trabajo TO GERENTE;
GRANT SELECT ON sucursales TO GERENTE;
GRANT SELECT ON tipos_servicios TO GERENTE;
GRANT SELECT ON polizas_seguros TO GERENTE;
GRANT SELECT ON empresas_aseguradoras TO GERENTE;
GRANT SELECT ON precios_renta TO GERENTE;

prompt '*** Estableciendo permisos a rol Recepcionista'
GRANT SELECT, INSERT, UPDATE, DELETE ON clientes TO RECEPCIONISTA;
GRANT SELECT, INSERT, UPDATE, DELETE ON rentas_de_vehiculos TO RECEPCIONISTA;
GRANT SELECT, INSERT, UPDATE, DELETE ON direcciones TO RECEPCIONISTA;

GRANT SELECT ON vehiculos TO RECEPCIONISTA;
GRANT SELECT ON vehiculos_en_mantenimiento TO RECEPCIONISTA;
GRANT SELECT ON sucursales TO RECEPCIONISTA;
GRANT SELECT ON polizas_seguros TO RECEPCIONISTA;
GRANT SELECT ON precios_renta TO RECEPCIONISTA;
GRANT SELECT ON locaciones TO RECEPCIONISTA;

prompt '*** Estableciendo permisos a rol Conductor'
GRANT SELECT ON vehiculos TO CONDUCTOR;
GRANT SELECT ON sucursales TO CONDUCTOR;
GRANT SELECT ON vehiculos_en_mantenimiento TO CONDUCTOR;

prompt '*** Estableciendo permisos a rol Mecanico'
GRANT SELECT ON vehiculos TO MECANICO;
GRANT SELECT ON sucursales TO MECANICO;

GRANT SELECT, INSERT, UPDATE, DELETE ON vehiculos_en_mantenimiento TO MECANICO;
