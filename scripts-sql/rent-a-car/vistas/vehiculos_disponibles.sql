CREATE OR REPLACE VIEW vehiculos_disponibles 
    ( marca
    , modelo
    , fecha_de_fabricacion
    , kilometraje
    , monto_de_deposito
    , costo_por_dia
    , costo_por_semana
    , costo_por_kilometros
    ) 
AS
SELECT v.marca, v.modelo, v.fecha_fabricacion, v.kilometraje_actual, pr.monto_deposito, pr.diaria, pr.semanal, pr.por_kilometraje
FROM vehiculos v 
JOIN precios_renta pr ON v.id_precio_renta = pr.id_precio_renta AND v.estado = 'disponible';