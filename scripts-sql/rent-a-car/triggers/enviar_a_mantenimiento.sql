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
