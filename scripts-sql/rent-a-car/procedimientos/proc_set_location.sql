CREATE OR REPLACE PROCEDURE Set_Location (
  id_locacion in locaciones.id_locacion%type, 
  ciudad in locaciones.ciudad%type, 
  provincia in locaciones.provincia%type, 
  codigo_postal in locaciones.codigo_postal%type, 
  pais in locaciones.pais%type) 
AS
  LOCATION_EXIST exception;
BEGIN

  IF Check_Location_Exist(id_locacion) = true THEN
    RAISE LOCATION_EXIST;
  END IF;

  -- Insertar locacion --

--  INSERT INTO locaciones ("id_locacion", "ciudad", "provincia", "codigo_postal", "pais") 
  INSERT INTO locaciones VALUES (id_locacion, ciudad, provincia, codigo_postal, pais);

  DBMS_OUTPUT.PUT_LINE(chr(10) || 'Locacion agregada!');

  EXCEPTION
    WHEN LOCATION_EXIST THEN
      DBMS_OUTPUT.PUT_LINE(chr(10) || 'ERROR: Locacion ya existe!');

END Set_Location;
/
