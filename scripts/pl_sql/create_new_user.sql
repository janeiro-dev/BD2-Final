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

  RENTA_CAR.Create_New_User(user_name, user_pass, user_role);
  
  EXCEPTION
  WHEN INVALID_ROLE THEN
    DBMS_OUTPUT.PUT_LINE('ERROR: Rol ingresado no es valido!');

END;
/
