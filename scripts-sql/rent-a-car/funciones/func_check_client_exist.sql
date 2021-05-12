CREATE OR REPLACE FUNCTION Check_Client_Exist (num_ident varchar)
RETURN boolean AS
  num_clients integer;
BEGIN

  -- Verificar si cliente ya existe --

  SELECT COUNT(*) INTO num_clients FROM clientes WHERE numero_identificacion=num_ident;

  IF (num_clients > 0) THEN
    RETURN true;
  ELSE
    RETURN false;
  END IF;

END;
/
