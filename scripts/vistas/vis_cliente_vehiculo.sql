CREATE OR REPLACE VIEW Vista_Cliente_Vehiculo AS
SELECT (primer_nombre || ' ' || apellido) AS  Cliente, 
numero_licencia_cond AS Licencia,
celular AS Celular,
(marca || ' - ' || modelo) AS Vehiculo,
placa AS Placa,
fecha_inicial AS "Fecha De Renta" FROM RENT_A_CAR.clientes 
INNER JOIN RENT_A_CAR.vehiculos_rentados ON RENT_A_CAR.clientes.id_cliente = RENT_A_CAR.vehiculos_rentados.id_cliente 
INNER JOIN RENT_A_CAR.vehiculos ON RENT_A_CAR.vehiculos_rentados.id_vehiculo = RENT_A_CAR.vehiculos.id_vehiculo;
