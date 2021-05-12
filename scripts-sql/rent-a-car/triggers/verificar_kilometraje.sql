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