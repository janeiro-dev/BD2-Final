CREATE OR REPLACE PROCEDURE New_Damage_Report (
  id_cliente in clientes.id_cliente%type,
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
  num_ident clientes.numero_identificacion%type;
  num_serie vehiculos.numero_serie%type;
BEGIN

  -- Verificar que cliente exista --
  SELECT numero_identificacion INTO num_ident FROM clientes WHERE clientes.id_cliente=id_cliente;

  IF Check_Client_Exist(num_ident) = false THEN
    RAISE CLIENT_NO_EXIST;
  END IF;

  -- Verificar que vehiculo exista --
  SELECT numero_serie INTO num_serie FROM vehiculos WHERE vehiculos.id_vehiculo=id_vehiculo;

  IF Check_Vehicle_Exist(num_serie) = false THEN
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
  VALUES(new_id_reporte, id_cliente, id_vehiculo, descripcion, estado, fecha, prioridad);

  DBMS_OUTPUT.PUT_LINE(chr(10) || 'Reporte de averia realizado!');

  EXCEPTION
    WHEN CLIENT_NO_EXIST THEN
      DBMS_OUTPUT.PUT_LINE(chr(10) || 'ERROR: Cliente no existe!');

    WHEN VEHICLE_NO_EXIST THEN
      DBMS_OUTPUT.PUT_LINE(chr(10) || 'ERROR: Vehiculo no existe!');

END;
/
