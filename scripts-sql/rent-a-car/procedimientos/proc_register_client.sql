CREATE OR REPLACE PROCEDURE Register_Client (
  nombre in clientes.primer_nombre%type, 
  apellido in clientes.apellido%type, 
  tipo_ident in clientes.tipo_identificacion%type, 
  num_ident in clientes.numero_identificacion%type, 
  num_lic in clientes.numero_licencia_cond%type, 
  edad in clientes.edad%type, 
  nacionalidad in clientes.nacionalidad%type, 
  telefono in clientes.telefono%type, 
  id_direccion in clientes.id_direccion%type)
AS
  CLIENT_EXIST exception;
  ADDRESS_NO_EXIST exception;
  new_id_cliente clientes.id_cliente%type;
BEGIN

  IF Check_Client_Exist(num_ident) = true THEN
    RAISE CLIENT_EXIST;
  END IF;

  IF Check_Address_Exist(id_direccion) = false THEN
    RAISE ADDRESS_NO_EXIST;
  END IF;

  -- Obtener id del cliente --

  SELECT MAX(id_cliente)+1 INTO new_id_cliente FROM clientes;

  -- Insertar nuevo cliente en tabla --

  INSERT INTO clientes VALUES (new_id_cliente, nombre, apellido, tipo_ident, num_ident, num_lic, edad, nacionalidad, telefono, id_direccion);

  DBMS_OUTPUT.PUT_LINE(chr(10) || 'Cliente registrado!');

  EXCEPTION
    WHEN CLIENT_EXIST THEN
      DBMS_OUTPUT.PUT_LINE(chr(10) || 'ERROR: Cliente ya existe!');

    WHEN ADDRESS_NO_EXIST THEN
      DBMS_OUTPUT.PUT_LINE(chr(10) || 'ERROR: Direccion no existe!');

END Register_Client;
/
