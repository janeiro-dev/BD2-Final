-- actualizar kilometraje actual de vehiculo
CREATE OR REPLACE TRIGGER actualizar_kilometraje
    BEFORE INSERT OR UPDATE ON rentas_de_vehiculos
    FOR EACH ROW
    WHEN (NEW.kilometraje_final > 0 )
DECLARE
    
BEGIN
    UPDATE vehiculos v SET v.kilometraje_actual = :NEW.kilometraje_final;
END;
