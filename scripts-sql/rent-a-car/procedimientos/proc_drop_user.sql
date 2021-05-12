CREATE OR REPLACE PROCEDURE Drop_User (user_name varchar) 
AS
  query varchar(100);
  USER_NO_EXIST exception;
  num_users integer;
BEGIN

  -- Verificar si usuario existe --

  SELECT COUNT(*) INTO num_users FROM all_users WHERE username=UPPER(user_name);

  IF (num_users = 0) THEN
    RAISE USER_NO_EXIST;
  END IF;

  -- Eliminar usuario --

  query := 'ALTER SESSION SET "_ORACLE_SCRIPT" = true';
  EXECUTE IMMEDIATE query;

  query := 'DROP USER ' || user_name;
  EXECUTE IMMEDIATE query;

  DBMS_OUTPUT.PUT_LINE(chr(10) || 'Usuario eliminado!');

  EXCEPTION
  WHEN USER_NO_EXIST THEN
    DBMS_OUTPUT.PUT_LINE(chr(10) || 'ERROR: Nombre de usuario "' || UPPER(user_name) || '" no existe!');

END Drop_User;
/
