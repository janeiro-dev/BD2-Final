CREATE OR REPLACE FUNCTION Check_Vehicle_Exist (id in vehiculos.id_vehiculo%type)
RETURN boolean AS
  num_vehicles integer;
BEGIN

  -- Verificar si vehiculo existe --

  SELECT COUNT(*) INTO num_vehicles FROM vehiculos WHERE vehiculos.id_vehiculo=id;

  IF (num_vehicles > 0) THEN
    RETURN true;
  ELSE
    RETURN false;
  END IF;

END;
/
