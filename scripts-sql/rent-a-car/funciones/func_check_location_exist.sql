CREATE OR REPLACE FUNCTION Check_Location_Exist (id number)
RETURN boolean AS
  num_locations integer;
BEGIN

  -- Verificar si locacion ya existe --

  SELECT COUNT(*) INTO num_locations FROM locaciones WHERE id_locacion=id;

  IF (num_locations > 0) THEN
    RETURN true;
  ELSE
    RETURN false;
  END IF;

END;
/
