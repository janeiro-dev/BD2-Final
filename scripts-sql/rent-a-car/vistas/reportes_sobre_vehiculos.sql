CREATE OR REPLACE VIEW reportes_sobre_vehiculos
    ( marca
    , modelo
    , placa
    , reporte
    , prioridad
    , fecha_del_reporte
    , estado
    ) 
AS
SELECT 
    v.marca
    , v.modelo
    , v.placa
    , ra.descripcion
    , ( CASE WHEN ra.prioridad = 2 THEN 'Media' 
             WHEN ra.prioridad = 3 THEN 'Alta'
             WHEN ra.prioridad = 1 THEN 'Baja' END)
    , ra.fecha
    , ra.estado
FROM vehiculos v 
JOIN reportes_de_averias ra ON v.id_vehiculo = ra.id_vehiculo;