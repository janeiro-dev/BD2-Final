CREATE OR REPLACE PROCEDURE RENTA_CAR.Drop_User (user_name varchar) 
AS
  SQL1 varchar(100);
  SQL2 varchar(100);
  USER_NO_EXIST exception;
  num_users integer;
BEGIN

  SELECT COUNT(*) INTO num_users FROM all_users WHERE username=UPPER(user_name);

  IF (num_users = 0) THEN
    RAISE USER_NO_EXIST;
  END IF;

  SQL1 := 'ALTER SESSION SET "_ORACLE_SCRIPT" = true';
  SQL2 := 'DROP USER ' || user_name;

  EXECUTE IMMEDIATE SQL1;
  EXECUTE IMMEDIATE SQL2;

  DBMS_OUTPUT.PUT_LINE(chr(10) || 'Usuario eliminado!');

  EXCEPTION
  WHEN USER_NO_EXIST THEN
    DBMS_OUTPUT.PUT_LINE(chr(10) || 'ERROR: Nombre de usuario "' || UPPER(user_name) || '" no existe!');

END Drop_User;
/
