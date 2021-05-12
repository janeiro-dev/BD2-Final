CREATE OR REPLACE PROCEDURE Drop_User (user_name varchar) 
AS
  query varchar(100);
  USER_NO_EXIST exception;
BEGIN

  IF Check_User_Exist(user_name) = false THEN
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
