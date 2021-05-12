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