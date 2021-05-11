-- ******* OJO ********
-- esto script es para correrse en una base de datos diferente a 
-- la base de datos donde esta el rent-a-car
-- ********************

-- puestos de trabajo
CREATE TABLE puestos_trabajo
    ( id_puesto_trabajo     NUMBER
    , nombre                VARCHAR2(60) NOT NULL
    , salario               NUMBER NOT NULL
    , descripcion           VARCHAR2(120)
    );

CREATE UNIQUE INDEX id_puesto_pk
ON puestos_trabajo (id_puesto_trabajo);

ALTER TABLE puestos_trabajo
ADD ( CONSTRAINT id_puesto_pk
            PRIMARY KEY (id_puesto_trabajo)
    );

-- direccion de los empleados
CREATE TABLE direcciones_empleados
    ( id_direccion_empleado   NUMBER   
    , calle                   VARCHAR2(120) 
    , sector                  VARCHAR2(120) 
    , ciudad                  VARCHAR2(120)
    , numero_vivienda         VARCHAR2(60)  
    , codigo_postal           VARCHAR2(5)
    );

CREATE UNIQUE INDEX id_direccion_emp_pk
ON direcciones_empleados (id_direccion_empleado);

ALTER TABLE direcciones_empleados
ADD ( CONSTRAINT id_direccion_emp_pk
            PRIMARY KEY (id_direccion_empleado)
    );

-- empleados
CREATE TABLE empleados
    ( id_empleado           NUMBER
    , id_puesto_trabajo     NUMBER NOT NULL
    , id_sucursal           NUMBER NOT NULL
    , id_direccion_empleado NUMBER NOT NULL
    , edad                  NUMBER NOT NULL
    , cedula                VARCHAR2(11) NOT NULL
    , email                 VARCHAR2(60) NOT NULL
    , primer_nombre         VARCHAR2(60) NOT NULL
    , apellido              VARCHAR2(60) NOT NULL
    );

CREATE UNIQUE INDEX cedula_ui
ON empleados (cedula);

CREATE UNIQUE INDEX email_ui
ON empleados (email);

ALTER TABLE empleados
ADD ( CONSTRAINT id_empleado_pk
            PRIMARY KEY (id_empleado)
    , CONSTRAINT id_emp_puesto_fk
            FOREIGN KEY (id_puesto_trabajo)
                REFERENCES puestos_trabajo(id_puesto_trabajo)
    , CONSTRAINT id_emp_direccion_fk
            FOREIGN KEY (id_direccion_empleado)
                REFERENCES direcciones_empleados(id_direccion_empleado)
    );
