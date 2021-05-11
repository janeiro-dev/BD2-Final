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
  SQL3 := 'GRANT ' || UPPER(user_role) || ' TO ' || user_name;
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
    DBMS_OUTPUT.PUT_LINE('ERROR: Nombre de usuario "' || UPPER(user_name) || '" ya existe!');

END Create_New_User;
/
