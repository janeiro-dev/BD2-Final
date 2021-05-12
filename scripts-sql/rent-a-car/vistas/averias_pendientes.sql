CREATE OR REPLACE VIEW averias_pendientes
    ( marca
    , modelo
    , placa
    , reporte
    , prioridad
    , fecha_del_reporte
    ) 
AS
SELECT marca, modelo, placa, reporte, prioridad, fecha_del_reporte
FROM reportes_sobre_vehiculos r WHERE r.estado = 'pendiente';
