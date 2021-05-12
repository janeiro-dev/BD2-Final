-- cuando se crea un reporte de averia sobre un vehiculo, si su prioridad es alta, 
-- cambiar estado del vehiculo a mantenimiento
CREATE OR REPLACE TRIGGER enviar_a_mantenimiento
    BEFORE UPDATE OR INSERT ON reportes_de_averias
    FOR EACH ROW
    WHEN (NEW.prioridad > 1)
DECLARE
    prioridad NUMBER;
    id_vehiculo NUMBER;
BEGIN
    UPDATE vehiculos v SET v.estado = 'mantenimiento' WHERE v.id_vehiculo = :NEW.id_vehiculo;
END;


-- cuando se añada un vehiculo a la tabla mantenimiento, su estado de cambiar a mantenimiento
CREATE OR REPLACE TRIGGER evitar_borar_reportes_de_averias
    BEFORE DELETE ON reportes_de_averias
    FOR EACH ROW
DECLARE
    error_al_borrar EXCEPTION;
   	PRAGMA EXCEPTION_INIT(error_al_borrar, -10012);
BEGIN
    raise_application_error(-20001, 'No se permite borrar registros de esta tabla');
END;


-- evitar que borren registros de la tabla rentas de vehiculos
CREATE OR REPLACE TRIGGER evitar_borar_registros_rentas
    BEFORE DELETE ON rentas_de_vehiculos
    FOR EACH ROW
DECLARE
    error_al_borrar EXCEPTION;
   	PRAGMA EXCEPTION_INIT(error_al_borrar, -10012);
BEGIN
    raise_application_error(-20001, 'No se permite borrar registros de esta tabla');
END;


-- actualizar kilometraje actual de vehiculo
CREATE OR REPLACE TRIGGER actualizar_kilometraje
    BEFORE INSERT OR UPDATE ON rentas_de_vehiculos
    FOR EACH ROW
    WHEN (NEW.kilometraje_final > 0 )
DECLARE
    
BEGIN
    UPDATE vehiculos v SET v.kilometraje_actual = :NEW.kilometraje_final;
END;


-- evitar que el kilometraje final sea menor 
CREATE OR REPLACE TRIGGER verificar_kilometraje
    BEFORE INSERT OR UPDATE ON rentas_de_vehiculos
    FOR EACH ROW
    WHEN (NEW.kilometraje_final > 0 )
DECLARE
    error_km EXCEPTION;
   	PRAGMA EXCEPTION_INIT(error_km, -10011);
BEGIN
    IF :NEW.kilometraje_final < :NEW.kilometraje_inicial 
    THEN
        raise_application_error(-20001, 'El kilometraje final no puede ser menor que el kilometraje inicial');
    END IF;
END;


