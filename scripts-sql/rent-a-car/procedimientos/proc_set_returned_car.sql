CREATE OR REPLACE PROCEDURE Set_Returned_Car (
  id in rentas_de_vehiculos.id_renta%type,
  km_final in rentas_de_vehiculos.kilometraje_final%type
)
AS
  NO_RENTED exception;
  completed rentas_de_vehiculos.estado%type := 'completado';
  fecha_actual DATE;
BEGIN

  IF Check_Rented_Car(id) = false THEN
    RAISE NO_RENTED;
  END IF;

  -- Establecer fecha final --

  fecha_actual := Get_Current_Date;

  -- Actualizar estado --

  UPDATE rentas_de_vehiculos
  SET estado = completed,
      fecha_final = fecha_actual,
      kilometraje_final = km_final
  WHERE id_renta=id;

  DBMS_OUTPUT.PUT_LINE(chr(10) || 'Vehiculo ha sido devuelto y pagado!');

  EXCEPTION
    WHEN NO_RENTED THEN
      DBMS_OUTPUT.PUT_LINE(chr(10) || 'ERROR: Vehiculo no ha sido rentado!');

END Set_Returned_Car;
/
