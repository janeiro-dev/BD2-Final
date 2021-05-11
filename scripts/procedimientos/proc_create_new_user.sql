SET SERVEROUTPUT ON
SET ECHO OFF
SET VERIFY OFF

ACCEPT name CHAR PROMPT 'Ingrese nombre de nuevo usuario: '
ACCEPT pass CHAR PROMPT 'Ingrese contraseña para nuevo usuario: ' HIDE
PROMPT ''
PROMPT 'Seleccione rol a desempeñar:'
PROMPT '   1) DIRECTOR'
PROMPT '   2) GERENTE'
PROMPT '   3) RECEPCIONISTA'
PROMPT '   4) CONDUCTOR'
PROMPT '   5) LAVADOR'
PROMPT '   6) ENCARGADO DE LIMPIEZA'
ACCEPT role number PROMPT 'Rol: '

CREATE OR REPLACE PROCEDURE Create_New_User (user_name varchar, user_pass varchar, user_role varchar) 
AS
  SQL1 varchar(100);
  SQL2 varchar(100);
  SQL3 varchar(100);
  SQL4 varchar(100);
  SQL5 varchar(100);
  USER_EXIST exception;
  num_users integer;
BEGIN

  SELECT COUNT(*) INTO num_users FROM all_users WHERE username=UPPER(user_name);

  IF (num_users > 0) THEN
    RAISE USER_EXIST;
  END IF;

  SQL1 := 'ALTER SESSION SET "_ORACLE_SCRIPT" = true';
  SQL2 := 'CREATE USER ' || user_name || ' IDENTIFIED BY ' || user_pass;
  SQL3 := 'GRANT ' || user_role || ' TO ' || user_name;
  SQL4 := 'GRANT CREATE SESSION TO ' || user_name;
  SQL5 := 'GRANT CONNECT TO ' || user_name;

  EXECUTE IMMEDIATE SQL1;
  EXECUTE IMMEDIATE SQL2;
  EXECUTE IMMEDIATE SQL3;
  EXECUTE IMMEDIATE SQL4;
  EXECUTE IMMEDIATE SQL5;

  DBMS_OUTPUT.PUT_LINE('Usuario creado!');

  EXCEPTION
  WHEN USER_EXIST THEN
    DBMS_OUTPUT.PUT_LINE('ERROR: Nombre de usuario "' || user_name || '" ya existe!');

END Create_New_User;
/

DECLARE

  user_name varchar(20) := '&name';
  user_pass varchar(20) := '&pass';
  user_role_num number := &role;
  user_role varchar(20);
  INVALID_ROLE exception;

BEGIN

  IF user_role_num < 1 OR user_role_num > 6 THEN
    RAISE INVALID_ROLE;
  END IF;

  IF user_role_num = 1 THEN user_role := 'DIRECTOR'; END IF;
  IF user_role_num = 2 THEN user_role := 'GERENTE'; END IF;
  IF user_role_num = 3 THEN user_role := 'RECEPCIONISTA'; END IF;
  IF user_role_num = 4 THEN user_role := 'CONDUCTOR'; END IF;
  IF user_role_num = 5 THEN user_role := 'LAVADOR'; END IF;
  IF user_role_num = 6 THEN user_role := 'ENCARGADO_LIMPIEZA'; END IF;

  Create_New_User(user_name, user_pass, user_role);
  
  EXCEPTION
  WHEN INVALID_ROLE THEN
    DBMS_OUTPUT.PUT_LINE('ERROR: Rol ingresado no es valido!');

END;
/
