CREATE OR REPLACE VIEW rentas
    ( marca
    , modelo
    , placa
    , nombre_cliente
    , apellido
    , fecha_inicial
    , fecha_final
    )
AS
SELECT 
    v.marca
    , v.modelo
    , v.placa
    , c.primer_nombre
    , c.apellido
    , rv.fecha_inicial
    , rv.fecha_final
FROM vehiculos v 
JOIN rentas_de_vehiculos rv ON v.id_vehiculo = rv.id_vehiculo
JOIN clientes c ON rv.id_cliente = c.id_cliente;