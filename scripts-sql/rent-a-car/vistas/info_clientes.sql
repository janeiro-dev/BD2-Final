CREATE OR REPLACE VIEW informacion_sobre_clientes
    ( nombre
    , tipo_de_identificacion
    , numero_de_identificacion
    , edad
    , nacionalidad
    , telefono
    , direccion
    ) 
AS
SELECT 
    ( c.primer_nombre || c.apellido )
    , c.tipo_identificacion
    , c.numero_identificacion
    , c.edad
    , c.nacionalidad
    , c.telefono
    , ( d.calle || ' ' || d.numero || ', ' || l.ciudad || ', ' || l.provincia || ', ' ||
        l.pais || ', ' || l.codigo_postal )
FROM clientes c
JOIN direcciones d ON c.id_direccion = d.id_direccion
JOIN locaciones l ON d.id_locacion = l.id_locacion;
