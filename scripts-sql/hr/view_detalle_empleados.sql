CREATE OR REPLACE VIEW detalle_empleados
    ( nombre
    , apellido
    , edad
    , email
    , cedula
    , puesto_de_trabajo
    , salario
    )
AS
SELECT 
    e.primer_nombre
    , e.apellido
    , e.edad
    , e.email
    , e.cedula
    , p.nombre
    , p.salario 
FROM empleados e
JOIN puestos_trabajo p ON e.id_puesto_trabajo = p.id_puesto_trabajo;