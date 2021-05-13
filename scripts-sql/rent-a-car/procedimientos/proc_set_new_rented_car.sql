CREATE OR REPLACE PROCEDURE Set_New_Rented_Car (
  vehiculo_id in vehiculos.id_vehiculo%type, 
  num_ident in clientes.numero_identificacion%type
)
AS
  VEHICLE_NO_EXIST exception;
  CLIENT_NO_EXIST exception;
  new_id_renta rentas_de_vehiculos.id_renta%type;
  cliente_id clientes.id_cliente%type;
  fecha_inicial DATE;
  kilometraje_inicial vehiculos.kilometraje_actual%type;
  estado rentas_de_vehiculos.estado%type;
BEGIN

  IF Check_Vehicle_Exist(vehiculo_id) = false THEN
    RAISE VEHICLE_NO_EXIST;
  END IF;

  IF Check_Client_Exist(num_ident) = false THEN
    RAISE CLIENT_NO_EXIST;
  ELSE
    SELECT id_cliente INTO cliente_id FROM clientes WHERE clientes.numero_identificacion=num_ident;
  END IF;

  -- Obtener id del renta --

  SELECT MAX(id_renta)+1 INTO new_id_renta FROM rentas_de_vehiculos;

  -- Establecer fecha inicial --

  fecha_inicial := Get_Current_Date;

  -- Obtener kilometraje inicial --

  SELECT kilometraje_actual INTO kilometraje_inicial FROM vehiculos
  WHERE vehiculos.id_vehiculo=vehiculo_id;

  -- Establecer estado como pendiente --

  estado := 'pendiente';

  -- Insertar direccion --

  INSERT INTO rentas_de_vehiculos
  VALUES (new_id_renta, vehiculo_id, cliente_id, fecha_inicial, null, kilometraje_inicial, null, estado);

  DBMS_OUTPUT.PUT_LINE(chr(10) || 'Vehiculo rentado!');

  EXCEPTION
    WHEN VEHICLE_NO_EXIST THEN
      DBMS_OUTPUT.PUT_LINE(chr(10) || 'ERROR: Vehiculo no existe!');

    WHEN CLIENT_NO_EXIST THEN
      DBMS_OUTPUT.PUT_LINE(chr(10) || 'ERROR: Cliente no existe!');

END Set_New_Rented_Car;
/
