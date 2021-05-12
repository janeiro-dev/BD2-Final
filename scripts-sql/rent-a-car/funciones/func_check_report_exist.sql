CREATE OR REPLACE FUNCTION Check_Report_Exist (id number)
RETURN boolean AS
  num_reports integer;
BEGIN

  -- Verificar si reporte de averia ya existe --

  SELECT COUNT(*) INTO num_reports FROM reportes_de_averias WHERE id_reporte=id;

  IF (num_reports > 0) THEN
    RETURN true;
  ELSE
    RETURN false;
  END IF;

END;
/
