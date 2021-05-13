CREATE OR REPLACE PROCEDURE Set_Address (
  id_direccion in direcciones.id_direccion%type, 
  id_locacion in direcciones.id_locacion%type, 
  calle in direcciones.calle%type, 
  numero in direcciones.numero%type) 
AS
  ADDRESS_EXIST exception;
  LOCATION_NO_EXIST exception;
BEGIN

  IF Check_Address_Exist(id_direccion) = true THEN
    RAISE ADDRESS_EXIST;
  END IF;

  IF Check_Location_Exist(id_locacion) = false THEN
    RAISE LOCATION_NO_EXIST;
  END IF;

  -- Insertar direccion --

  INSERT INTO direcciones VALUES (id_direccion, id_locacion, calle, numero);

  DBMS_OUTPUT.PUT_LINE(chr(10) || 'Direccion agregada!');

  EXCEPTION
    WHEN ADDRESS_EXIST THEN
      DBMS_OUTPUT.PUT_LINE(chr(10) || 'ERROR: Direccion ya existe!');

    WHEN LOCATION_NO_EXIST THEN
      DBMS_OUTPUT.PUT_LINE(chr(10) || 'ERROR: Locacion no existe!');

END Set_Address;
/
