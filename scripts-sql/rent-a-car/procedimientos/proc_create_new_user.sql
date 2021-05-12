CREATE OR REPLACE PROCEDURE Create_New_User (user_name varchar, user_pass varchar, user_role varchar) 
AS
  query varchar(100);
  USER_EXIST exception;
BEGIN

  IF Check_User_Exist(user_name) = true THEN
    RAISE USER_EXIST;
  END IF;

  -- Crear usuario, otorgar rol y dar privilegios --

  query := 'ALTER SESSION SET "_ORACLE_SCRIPT" = true';
  EXECUTE IMMEDIATE query;

  query := 'CREATE USER ' || user_name || ' IDENTIFIED BY ' || user_pass;
  EXECUTE IMMEDIATE query;

  query := 'GRANT ' || UPPER(user_role) || ' TO ' || user_name;
  EXECUTE IMMEDIATE query;

  query := 'GRANT CREATE SESSION TO ' || user_name;
  EXECUTE IMMEDIATE query;

  query := 'GRANT CONNECT TO ' || user_name;
  EXECUTE IMMEDIATE query;

  DBMS_OUTPUT.PUT_LINE(chr(10) || 'Usuario creado!');

  EXCEPTION
  WHEN USER_EXIST THEN
    DBMS_OUTPUT.PUT_LINE(chr(10) || 'ERROR: Nombre de usuario "' || UPPER(user_name) || '" ya existe!');

END Create_New_User;
/
