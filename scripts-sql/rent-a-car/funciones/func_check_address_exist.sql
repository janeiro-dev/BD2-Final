CREATE OR REPLACE FUNCTION Check_Address_Exist (id number)
RETURN boolean AS
  num_addresses integer;
BEGIN

  -- Verificar si direccion ya existe --

  SELECT COUNT(*) INTO num_addresses FROM direcciones WHERE id_direccion=id;

  IF (num_addresses > 0) THEN
    RETURN true;
  ELSE
    RETURN false;
  END IF;

END;
/
