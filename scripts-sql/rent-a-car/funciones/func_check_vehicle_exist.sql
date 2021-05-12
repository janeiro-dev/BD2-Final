CREATE OR REPLACE FUNCTION Check_Vehicle_Exist (num_serie in vehiculos.numero_serie%type)
RETURN boolean AS
  num_vehicles integer;
BEGIN

  -- Verificar si vehiculo existe --

  SELECT COUNT(*) INTO num_vehicles FROM vehiculos WHERE vehiculos.numero_serie=num_serie;

  IF (num_vehicles > 0) THEN
    RETURN true;
  ELSE
    RETURN false;
  END IF;

END;
/
