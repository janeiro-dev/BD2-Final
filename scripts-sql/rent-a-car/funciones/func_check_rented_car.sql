CREATE OR REPLACE FUNCTION Check_Rented_Car (id number)
RETURN boolean AS
  num_cars integer;
BEGIN

  -- Verificar si vehiculo ha sido rentado --

  SELECT COUNT(*) INTO num_cars FROM rentas_de_vehiculos WHERE id_renta=id;

  IF (num_cars > 0) THEN
    RETURN true;
  ELSE
    RETURN false;
  END IF;

END;
/
