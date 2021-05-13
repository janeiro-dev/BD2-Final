CREATE OR REPLACE PROCEDURE Set_Solved_Report (id in reportes_de_averias.id_reporte%type)
AS
  REPORT_NO_EXIST exception;
  solved reportes_de_averias.estado%type := 'solucionado';
BEGIN

  IF Check_Report_Exist(id) = false THEN
    RAISE REPORT_NO_EXIST;
  END IF;

  -- Actualizar estado --

  UPDATE reportes_de_averias
  SET estado = solved
  WHERE id_reporte=id;

  DBMS_OUTPUT.PUT_LINE(chr(10) || 'Reporte marcado como solucionado!');

  EXCEPTION
    WHEN REPORT_NO_EXIST THEN
      DBMS_OUTPUT.PUT_LINE(chr(10) || 'ERROR: Reporte de averia no existe!');

END Set_Solved_Report;
/
