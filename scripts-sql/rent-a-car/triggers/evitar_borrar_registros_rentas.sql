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