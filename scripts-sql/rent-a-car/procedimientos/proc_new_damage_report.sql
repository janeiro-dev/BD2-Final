CREATE OR REPLACE PROCEDURE New_Damage_Report (
  num_ident in clientes.numero_identificacion%type,
  id_vehiculo in vehiculos.id_vehiculo%type,
  descripcion in reportes_de_averias.descripcion%type,
  prioridad in reportes_de_averias.prioridad%type
)
AS
  CLIENT_NO_EXIST exception;
  VEHICLE_NO_EXIST exception;
  new_id_reporte reportes_de_averias.id_reporte%type;
  estado reportes_de_averias.estado%type;
  fecha reportes_de_averias.fecha%type;
  cliente_id clientes.id_cliente%type;
BEGIN

  -- Verificar que cliente exista --
  IF Check_Client_Exist(num_ident) = false THEN
    RAISE CLIENT_NO_EXIST;
  ELSE
    SELECT id_cliente INTO cliente_id FROM clientes WHERE clientes.numero_identificacion=num_ident;
  END IF;

  -- Verificar que vehiculo exista --
  IF Check_Vehicle_Exist(id_vehiculo) = false THEN
    RAISE VEHICLE_NO_EXIST;
  END IF;

  -- Obterner id reporte --
  SELECT MAX(id_reporte)+1 INTO new_id_reporte FROM reportes_de_averias;

  -- Obtener fecha actual --
  fecha := Get_Current_Date;

  -- Establecer como reporte como "pendiente" --
  estado := 'pendiente';

  -- Insertar reporte en tabla Reportes de Averias --
  INSERT INTO reportes_de_averias 
  VALUES(new_id_reporte, cliente_id, id_vehiculo, descripcion, estado, fecha, prioridad);

  DBMS_OUTPUT.PUT_LINE(chr(10) || 'Reporte de averia realizado!');

  EXCEPTION
    WHEN CLIENT_NO_EXIST THEN
      DBMS_OUTPUT.PUT_LINE(chr(10) || 'ERROR: Cliente no existe!');

    WHEN VEHICLE_NO_EXIST THEN
      DBMS_OUTPUT.PUT_LINE(chr(10) || 'ERROR: Vehiculo no existe!');

END;
/
