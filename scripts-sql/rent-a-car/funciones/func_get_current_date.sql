CREATE OR REPLACE FUNCTION Get_Current_Date
RETURN DATE AS
  fecha DATE;
BEGIN

  select current_date into fecha from dual;

  RETURN fecha;

END;
/
