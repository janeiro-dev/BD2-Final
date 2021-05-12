prompt '*** Estableciendo permisos a rol Director'

BEGIN
    FOR t IN (select * from all_tables where owner='RENTA_CAR')
    LOOP
    EXECUTE IMMEDIATE 'GRANT ALL PRIVILEGES ON '|| t.owner ||'.' || t.table_name ||' TO DIRECTOR';
    END LOOP;
END;
/

prompt '*** Estableciendo permisos a rol Gerente'
GRANT SELECT, INSERT, DELETE, UPDATE ON RENTA_CAR.empleados TO GERENTE;
GRANT SELECT, INSERT, DELETE, UPDATE ON RENTA_CAR.direccion_empleado TO GERENTE;
GRANT SELECT, INSERT, DELETE, UPDATE ON RENTA_CAR.suplidores TO GERENTE;
GRANT SELECT, INSERT, DELETE, UPDATE ON RENTA_CAR.clientes TO GERENTE;
GRANT SELECT, INSERT, DELETE, UPDATE ON RENTA_CAR.vehiculos TO GERENTE;
GRANT SELECT, INSERT, DELETE, UPDATE ON RENTA_CAR.adquisicion_de_vehiculos TO GERENTE;
GRANT SELECT, INSERT, DELETE, UPDATE ON RENTA_CAR.vehiculos_en_mantenimiento TO GERENTE;
GRANT SELECT, INSERT, DELETE, UPDATE ON RENTA_CAR.reporte_de_averias TO GERENTE;
GRANT SELECT, INSERT, DELETE, UPDATE ON RENTA_CAR.vehiculos_rentados TO GERENTE;
GRANT SELECT, INSERT, DELETE, UPDATE ON RENTA_CAR.servicios_de_proveedores TO GERENTE;
GRANT SELECT, INSERT, DELETE, UPDATE ON RENTA_CAR.proveedores_servicios TO GERENTE;
GRANT SELECT, INSERT, DELETE, UPDATE ON RENTA_CAR.empleados_proveedores_servicios TO GERENTE;
GRANT SELECT, INSERT, DELETE, UPDATE ON RENTA_CAR.otros_servicios TO GERENTE;

GRANT SELECT ON RENTA_CAR.beneficios_empleados TO GERENTE;
GRANT SELECT ON RENTA_CAR.puestos_trabajo TO GERENTE;
GRANT SELECT ON RENTA_CAR.locacion TO GERENTE;
GRANT SELECT ON RENTA_CAR.sucursales TO GERENTE;
GRANT SELECT ON RENTA_CAR.tipos_servicios TO GERENTE;
GRANT SELECT ON RENTA_CAR.polizas_seguro TO GERENTE;
GRANT SELECT ON RENTA_CAR.precio_renta TO GERENTE;

prompt '*** Estableciendo permisos a rol Recepcionista'
GRANT SELECT, INSERT, UPDATE, DELETE ON RENTA_CAR.clientes TO RECEPCIONISTA;
GRANT SELECT, INSERT, UPDATE, DELETE ON RENTA_CAR.vehiculos_rentados TO RECEPCIONISTA;

GRANT SELECT ON RENTA_CAR.vehiculos TO RECEPCIONISTA;
GRANT SELECT ON RENTA_CAR.vehiculos_en_mantenimiento TO RECEPCIONISTA;
GRANT SELECT ON RENTA_CAR.sucursales TO RECEPCIONISTA;
GRANT SELECT ON RENTA_CAR.polizas_seguro TO RECEPCIONISTA;
GRANT SELECT ON RENTA_CAR.precio_renta TO RECEPCIONISTA;
GRANT SELECT ON RENTA_CAR.locacion TO RECEPCIONISTA;

prompt '*** Estableciendo permisos a rol Conductor'
GRANT SELECT ON RENTA_CAR.vehiculos TO CONDUCTOR;
GRANT SELECT ON RENTA_CAR.locacion TO CONDUCTOR;
GRANT SELECT ON RENTA_CAR.sucursales TO CONDUCTOR;
GRANT SELECT ON RENTA_CAR.vehiculos_en_mantenimiento TO CONDUCTOR;

prompt '*** Estableciendo permisos a rol Lavador'
GRANT SELECT ON RENTA_CAR.vehiculos_en_mantenimiento TO LAVADOR;