CREATE OR REPLACE FUNCTION Check_User_Exist (user_name varchar)
RETURN boolean AS
  num_users integer;
BEGIN

  -- Verificar si usuario ya existe --

  SELECT COUNT(*) INTO num_users FROM all_users WHERE username=UPPER(user_name);

  IF (num_users > 0) THEN
    RETURN true;
  ELSE
    RETURN false;
  END IF;

END;
/
