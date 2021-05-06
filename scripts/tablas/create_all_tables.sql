Prompt ***** Creando tabla BENEFICIOS DE EMPLEADOS ...

CREATE TABLE beneficios_empleados  
    ( id_beneficio   NUMBER                 
    , descripcion    VARCHAR2(300)   
    );

CREATE UNIQUE INDEX id_beneficio_pk
ON beneficios_empleados (id_beneficio);

ALTER TABLE beneficios_empleados
ADD ( CONSTRAINT id_beneficio_pk 
            PRIMARY KEY (id_beneficio)
    );


Prompt ***** Creando tabla PUESTOS DE TRABAJO ...

CREATE TABLE puestos_trabajo
    ( id_puesto_trabajo     NUMBER
    , nombre                VARCHAR2(60) NOT NULL
    , salario               NUMBER NOT NULL
    , descripcion           VARCHAR2(120)
    , id_beneficio          NUMBER
    );

CREATE UNIQUE INDEX id_puesto_pk
ON puestos_trabajo (id_puesto_trabajo);

ALTER TABLE puestos_trabajo
ADD ( CONSTRAINT id_puesto_pk
            PRIMARY KEY (id_puesto_trabajo)
    , CONSTRAINT id_beneficio_fk 
            FOREIGN KEY (id_beneficio)
                REFERENCES beneficios_empleados (id_beneficio)
    );


Prompt ***** Creando tabla DIRECCIONI DE EMPLEADOS ...

CREATE TABLE direccion_empleado
    ( id_direccion_empleado   NUMBER   
    , calle                   VARCHAR2(120) NOT NULL 
    , sector                  VARCHAR2(120) NOT NULL
    , ciudad                  VARCHAR2(120) NOT NULL
    , numero_vivienda         VARCHAR2(60)  NOT NULL
    );

CREATE UNIQUE INDEX id_direccion_emp_pk
ON direccion_empleado (id_direccion_empleado);

ALTER TABLE direccion_empleado
ADD ( CONSTRAINT id_direccion_emp_pk
            PRIMARY KEY (id_direccion_empleado)
    );


Prompt ***** Creando tabla LOCACION (para suplidores y sucursales)

CREATE TABLE locacion  
    ( id_locacion    NUMBER   
    , ciudad         VARCHAR2(60) NOT NULL
    , provincia      VARCHAR2(60) NOT NULL
    );

CREATE UNIQUE INDEX id_locacion_pk
ON locacion (id_locacion);

ALTER TABLE locacion
ADD ( CONSTRAINT id_locacion_pk
            PRIMARY KEY (id_locacion)
    );


Prompt ***** Creando tabla de SUPLIDORES 


CREATE TABLE suplidores
    ( id_suplidor   NUMBER
    , nombre        VARCHAR2(60) NOT NULL
    , telefono      VARCHAR2(10) NOT NULL
    , id_locacion   NUMBER NOT NULL
    );

ALTER TABLE suplidores
ADD ( CONSTRAINT id_suplidor_pk
            PRIMARY KEY (id_suplidor)
    , CONSTRAINT id_locacion_sp_fk 
            FOREIGN KEY (id_locacion)
                REFERENCES locacion(id_locacion)
    );


Prompt ***** Creando tabla SUCURSALES ...

CREATE TABLE sucursales
    ( id_sucursal   NUMBER
    , direccion     VARCHAR2(120) NOT NULL
    , telefono      VARCHAR2(10) NOT NULL
    , email         VARCHAR2(60)
    , id_locacion   NUMBER
    );

CREATE UNIQUE INDEX suc_email_uk
ON sucursales (email);

ALTER TABLE sucursales
ADD ( CONSTRAINT sucursal_pk
            PRIMARY KEY (id_sucursal)
    );


Prompt ***** Crendo tabla EMPLEADOS ...

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

CREATE UNIQUE INDEX sucursal_ui
ON empleados (id_sucursal);

ALTER TABLE empleados
ADD ( CONSTRAINT id_empleado_pk
            PRIMARY KEY (id_empleado)
    , CONSTRAINT id_emp_puesto_fk
            FOREIGN KEY (id_puesto_trabajo)
                REFERENCES puestos_trabajo(id_puesto_trabajo)
    , CONSTRAINT id_emp_sucursal_fk
            FOREIGN KEY (id_sucursal)
                REFERENCES sucursales(id_sucursal)
    , CONSTRAINT id_emp_direccion_fk
            FOREIGN KEY (id_direccion_empleado)
                REFERENCES direccion_empleado(id_direccion_empleado)
    );


Prompt ***** Creando tabla PROVEEDORES DE SERVICIOS ...

-- tabla para registrar los servicios prestados por terceros, servisios
-- como: mantenimiento electrico del local, plomeria, jardineria, mecanica, etc...
CREATE TABLE proveedores_servicios
    ( id_proveedor_servicio  NUMBER   
    , nombre                 VARCHAR2(60) NOT NULL
    , nfc                    VARCHAR2(10) NOT NULL
    , telefono               VARCHAR2(10) NOT NULL
    , direccion              VARCHAR2(240) NOT NULL
    );

CREATE UNIQUE INDEX nfc_uk
ON proveedores_servicios (nfc);

ALTER TABLE proveedores_servicios
ADD ( CONSTRAINT pro_service_pk
            PRIMARY KEY (id_proveedor_servicio)
    );


Prompt ***** Creanto tabla TIPOS DE SERVICIOS ...
CREATE TABLE tipos_servicios  
    ( id_tipo_servicio   NUMBER   
    , nombre               VARCHAR2(40) 
    , codigo               VARCHAR2(3)
    , descripcion          VARCHAR2(600)
    );

CREATE UNIQUE INDEX codigo_servicio_uk
ON tipos_servicios (codigo);

ALTER TABLE tipos_servicios
ADD ( CONSTRAINT tipo_servicio_pk
            PRIMARY KEY (id_tipo_servicio)
    );


Prompt **** Creando tabla SERVICIOS PROVISTOS POR TERCEROS ...

-- esta tabla es una especie de catalogo de los servicios que pueden ser
-- provistos pro terceros

CREATE TABLE servicios_de_proveedores
    ( id_servicio      NUMBER
    , id_tipo_servicio NUMBER
    , id_proveedor     NUMBER
    );

ALTER TABLE servicios_de_proveedores
ADD ( CONSTRAINT id_servicio_pk
            PRIMARY KEY (id_servicio)
    , CONSTRAINT id_tipo_serv_fk
            FOREIGN KEY (id_tipo_servicio)
                REFERENCES tipos_servicios(id_tipo_servicio)
    , CONSTRAINT id_proveedor_fk
            FOREIGN KEY (id_proveedor)
                REFERENCES proveedores_servicios(id_proveedor_servicio)
    );


Prompt ***** Creando tabla EMPLEADOS DE PROVEEDORES DE SERVICIOS ...

CREATE TABLE empleados_proveedores_servicios
    ( id_empleado_proveedor     NUMBER
    , primer_nombre             VARCHAR2(60) NOT NULL
    , apellido                  VARCHAR2(60) NOT NULL
    , id_empleado               VARCHAR2(20) NOT NULL
    , id_proveedor_servicio     NUMBER
    );

CREATE UNIQUE INDEX id_empleado_proveedor_uk
ON empleados_proveedores_servicios (id_empleado);

ALTER TABLE empleados_proveedores_servicios
ADD ( CONSTRAINT id_empleado_pro_pk
            PRIMARY KEY (id_empleado_proveedor)
    , CONSTRAINT id_proveedor_servicio_fk
            FOREIGN KEY (id_proveedor_servicio)
                REFERENCES proveedores_servicios(id_proveedor_servicio)
    );


Prompt ***** Creanto tabla OTROS_SERVICIOS

-- Esta tabla se crea para diferenciar los servicios de mecanica realizados a los 
-- vehiculos de los demas trabajos realizados por terceros en la sucursal

CREATE TABLE otros_servicios
    ( id_servicio   NUMBER
    , descripcion   VARCHAR2(60) NOT NULL
    , costo         NUMBER NOT NULL
    , id_empleado_proveedor NUMBER NOT NULL
    , id_sucursal           NUMBER NOT NULL
    , id_tipo_servicio      NUMBER NOT NULL
    );

ALTER TABLE otros_servicios
ADD ( CONSTRAINT id_otro_serv_pk
            PRIMARY KEY (id_servicio)
    , CONSTRAINT id_empleado_prov_fk
            FOREIGN KEY (id_empleado_proveedor)
                REFERENCES empleados_proveedores_servicios(id_empleado_proveedor)
    , CONSTRAINT id_otros_sucursal_fk
            FOREIGN KEY (id_sucursal)
                REFERENCES sucursales(id_sucursal)
    );


Prompt ***** creando tabla CLIENTES ...

CREATE TABLE clientes
    ( id_cliente              NUMBER   
    , primer_nombre           VARCHAR2(60) NOT NULL
    , apellido                VARCHAR2(80) NOT NULL
    , tipo_identificacion     VARCHAR2(20) NOT NULL
    , numero_identificacion   VARCHAR2(20) NOT NULL
    , numero_licencia_cond    VARCHAR2(20) NOT NULL
    , edad                    NUMBER NOT NULL
    , nacionalidad            VARCHAR2(30)
    , telefono                VARCHAR2(15)
    , celular                 VARCHAR2(15)
    );

CREATE UNIQUE INDEX licencia_ui
ON clientes (numero_licencia_cond);

CREATE UNIQUE INDEX identificacion_ui
ON clientes (numero_identificacion);

ALTER TABLE clientes
ADD ( CONSTRAINT id_cliente_pk
            PRIMARY KEY (id_cliente)
    );


Prompt ***** Creando tabla EMPRESAS ASEGURADORAS

CREATE TABLE empresas_aseguradoras
    ( id_empresa_aseguradora  NUMBER   
    , telefono                VARCHAR2(10) NOT NULL
    , nombre                  VARCHAR2(60) NOT NULL
    , nfc                     VARCHAR2(20) NOT NULL
    , descripcion             VARCHAR2(360)
    );

CREATE UNIQUE INDEX aseguradora_nfc_uk
ON empresas_aseguradoras (nfc);

ALTER TABLE empresas_aseguradoras
ADD ( CONSTRAINT id_aseguradora_pk
            PRIMARY KEY (id_empresa_aseguradora)
    );


Prompt ***** Creando tabla POLIZAS DE SEGURO

CREATE TABLE polizas_seguro
    ( id_poliza     NUMBER
    , descripcion   VARCHAR2(360)
    , covertura     VARCHAR2(540) NOT NULL
    , id_empresa_aseguradora    NUMBER
    );

ALTER TABLE polizas_seguro
ADD ( CONSTRAINT id_poliza_pk
            PRIMARY KEY (id_poliza)
    , CONSTRAINT id_aseguradora_fk
            FOREIGN KEY (id_empresa_aseguradora)
                REFERENCES empresas_aseguradoras(id_empresa_aseguradora)
    );


Prompt ***** Creando tabla VEHICULOS ...

CREATE TABLE vehiculos
    ( id_vehiculo       NUMBER
    , modelo            VARCHAR2(60) NOT NULL
    , marca             VARCHAR2(60) NOT NULL
    , placa             VARCHAR2(10) NOT NULL
    , tipo_vehiculo     VARCHAR2(60) NOT NULL
    , fecha_fabricacion DATE NOT NULL
    , numero_serie      VARCHAR2(120) NOT NULL
    , color             VARCHAR2(60) NOT NULL
    , kilometraje_actual NUMBER NOT NULL
    , id_poliza          NUMBER NOT NULL
    );

CREATE UNIQUE INDEX serie_ui
ON vehiculos (numero_serie);

CREATE UNIQUE INDEX placa_ui
ON vehiculos (placa);

ALTER TABLE vehiculos
ADD ( CONSTRAINT id_vehiculo_pk
            PRIMARY KEY (id_vehiculo)
    , CONSTRAINT id_poliza_fk
            FOREIGN KEY (id_poliza)
                REFERENCES polizas_seguro(id_poliza)
    );


Prompt ***** Creando tabla PRECIO_RENTA

CREATE TABLE precio_renta
    ( id_precio_renta   NUMBER
    , id_vehiculo       NUMBER NOT NULL
    , diario            NUMBER NOT NULL
    , semanal           NUMBER NOT NULL
    , por_kilometraje   NUMBER NOT NULL
    , monto_deposito    NUMBER NOT NULL
    );

ALTER TABLE precio_renta
ADD ( CONSTRAINT id_precio_renta_pk
            PRIMARY KEY (id_precio_renta)
    , CONSTRAINT id_vehiculo_precio_fk
            FOREIGN KEY (id_vehiculo)
                REFERENCES vehiculos(id_vehiculo)
    );

            
Prompt ***** Creando tabla para la ADQUISICION DE VEHICULOS ...

CREATE TABLE adquisicion_de_vehiculos
    ( id_adquisicion    NUMBER
    , costo             NUMBER NOT NULL
    , fecha             DATE NOT NULL
    , id_vehiculo       NUMBER NOT NULL
    , id_suplidor       NUMBER NOT NULL
    , id_sucursal       NUMBER NOT NULL
    );

CREATE UNIQUE INDEX id_vehiculo_ad_ui
ON adquisicion_de_vehiculos (id_vehiculo);

ALTER TABLE adquisicion_de_vehiculos
ADD ( CONSTRAINT id_adquisicion_pk
            PRIMARY KEY (id_adquisicion)
    , CONSTRAINT id_vehiculo_ad_fk
            FOREIGN KEY (id_vehiculo)
                REFERENCES vehiculos(id_vehiculo)
    , CONSTRAINT id_sucursal_ad_fk
            FOREIGN KEY (id_sucursal)
                REFERENCES sucursales(id_sucursal)
    );


Prompt ***** Creando tabla VEHICULOS_EN_MANTENIMIENTO ...

-- tipo_mantenimiento: 1 => preventivo, 2 => predictivo, 3 => correctivo 
CREATE TABLE vehiculos_en_mantenimiento
    ( id_mantenimiento      NUMBER
    , id_vehiculo           NUMBER NOT NULL
    , id_empleado_proveedor NUMBER NOT NULL
    , tipo_mantenimiento    NUMBER NOT NULL
    , descripcion           VARCHAR2(450) NOT NULL
    , costo                 NUMBER NOT  NULL
    );

ALTER TABLE vehiculos_en_mantenimiento
ADD ( CONSTRAINT id_mantenimiento_pk
            PRIMARY KEY (id_mantenimiento)
    , CONSTRAINT id_vehiculo_man_fk
            FOREIGN KEY (id_vehiculo)
                REFERENCES vehiculos(id_vehiculo)
    , CONSTRAINT id_empleado_man_fk
            FOREIGN KEY (id_empleado_proveedor)
                REFERENCES empleados_proveedores_servicios(id_empleado_proveedor)
    );


Prompt ***** Creando la tabla REPORTE_DE_AVERIAS

-- prioridad: 1 => alta, 2 => media, 3 => baja
CREATE TABLE reporte_de_averias
    ( id_reporte    NUMBER
    , id_cliente    NUMBER
    , id_vehiculo   NUMBER NOT NULL
    , descripcion   VARCHAR2(300) NOT NULL
    , prioridad     NUMBER NOT NULL
    );

ALTER TABLE reporte_de_averias
ADD ( CONSTRAINT id_reporte_pk
            PRIMARY KEY (id_reporte)
    , CONSTRAINT id_reporte_cliente_fk
            FOREIGN KEY (id_cliente)
                REFERENCES clientes(id_cliente)
    , CONSTRAINT id_reporte_vehiculo_fk
            FOREIGN KEY (id_vehiculo)
                REFERENCES vehiculos(id_vehiculo)
    );


Prompt ***** Creando tabla VEHICULOS_RENTADOS

-- tipo_renta: 1 => diaria, 2 => semanal, 3 => kilometraje
CREATE TABLE vehiculos_rentados
    ( id_renta      NUMBER
    , id_vehiculo   NUMBER NOT NULL
    , id_cliente    NUMBER NOT NULL
    , tipo_renta    NUMBER NOT NULL
    , fecha_inicial DATE NOT NULL
    , fecha_final   DATE NOT NULL
    , kilometraje_inicial   NUMBER NOT NULL
    , kilometraje_final     NUMBER NOT NULL
    );

ALTER TABLE vehiculos_rentados
ADD ( CONSTRAINT id_renta_pk
            PRIMARY KEY (id_renta)
    , CONSTRAINT id_vehiculo_renta_fk
            FOREIGN KEY (id_vehiculo)
                REFERENCES vehiculos(id_vehiculo)
    , CONSTRAINT id_cliente_renta_fk
            FOREIGN KEY (id_cliente)
                REFERENCES clientes(id_cliente)
    );

DROP INDEX sucursal_ui;

