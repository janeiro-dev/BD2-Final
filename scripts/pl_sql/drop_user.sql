SET SERVEROUTPUT ON
SET ECHO OFF
SET VERIFY OFF

ACCEPT name CHAR PROMPT 'Ingrese nombre del usuario a eliminar: '

DECLARE

  user_name varchar(20) := '&name';

BEGIN

  RENT_A_CAR.Drop_User(user_name);
  
END;
/
