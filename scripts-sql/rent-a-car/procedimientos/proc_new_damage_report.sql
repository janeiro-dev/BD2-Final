CREATE OR REPLACE PROCEDURE New_Damage_Report (
  id_cliente in clientes.id_cliente%type,
  id_vehiculo in vehiculos.id_vehiculo%type,
  descripcion in reportes_de_averias.descripcion%type,
  prioridad in reportes_de_averias.prioridad%type
)
AS
  new_id_reporte reportes_de_averias.id_reporte%type;
  estado reportes_de_averias.estado%type;
  fecha reportes_de_averias.fecha%type;
BEGIN

  -- Obterner id reporte --
  SELECT MAX(id_reporte)+1 INTO new_id_reporte FROM reportes_de_averias;

  -- Obtener fecha actual --
  fecha := Get_Current_Date;

  -- Establecer como reporte como "pendiente" --
  estado := 'pendiente';

  -- Insertar reporte en tabla Reportes de Averias --
  INSERT INTO reportes_de_averias 
  VALUES(new_id_reporte, id_cliente, id_vehiculo, descripcion, estado, fecha, prioridad);

  DBMS_OUTPUT.PUT_LINE(chr(10) || 'Reporte de averia realizado!');

END;
/
