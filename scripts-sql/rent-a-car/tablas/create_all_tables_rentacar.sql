-- locaciones
CREATE TABLE locaciones
    ( id_locacion   NUMBER
    , ciudad        VARCHAR2(60)
    , provincia     VARCHAR2(60)
    , codigo_postal VARCHAR2(10)
    , pais          VARCHAR2(20)
    );

CREATE UNIQUE INDEX id_locacion_pk 
ON locaciones (id_locacion);

ALTER TABLE locaciones
ADD ( CONSTRAINT id_locacion_pk
            PRIMARY KEY (id_locacion)
    );

-- direcciones
CREATE TABLE direcciones 
    ( id_direccion  NUMBER
    , id_locacion   NUMBER
    , calle         VARCHAR2(120)
    , numero        VARCHAR2(10) 
    );

CREATE UNIQUE INDEX id_direccion_pk
ON direcciones (id_direccion);

ALTER TABLE direcciones
ADD ( CONSTRAINT id_direccion_pk
            PRIMARY KEY (id_direccion)
    , CONSTRAINT id_locacion_fk
            FOREIGN KEY (id_locacion)
                REFERENCES locaciones(id_locacion)
    );

-- clientes
CREATE TABLE clientes
    ( id_cliente        NUMBER
    , primer_nombre     VARCHAR2(60)
    , apellido          VARCHAR2(60)
    , tipo_identificacion   VARCHAR2(20)
    , numero_identificacion VARCHAR2(20)
    , numero_licencia_cond  VARCHAR2(20)
    , edad              NUMBER
    , nacionalidad      VARCHAR2(20)
    , telefono          VARCHAR2(20)
    , id_direccion      NUMBER
    );

CREATE UNIQUE INDEX id_cliente_pk
ON clientes (id_cliente);

ALTER TABLE clientes
ADD ( CONSTRAINT id_cliente_pk
            PRIMARY KEY (id_cliente)
    , CONSTRAINT id_direccion_cliente_fk
            FOREIGN KEY (id_direccion)
                REFERENCES direcciones(id_direccion)
    );

-- empresas aseguradoras
CREATE TABLE empresas_aseguradoras
    ( id_empresa_aseguradora  NUMBER   
    , telefono                VARCHAR2(10) NOT NULL
    , nombre                  VARCHAR2(60) NOT NULL
    , ncf                     VARCHAR2(20) NOT NULL
    , direccion               VARCHAR2(360)
    );

CREATE UNIQUE INDEX aseguradora_ncf_ui
ON empresas_aseguradoras (ncf);

CREATE UNIQUE INDEX id_aseguradora_pk
ON empresas_aseguradoras (id_empresa_aseguradora);

ALTER TABLE empresas_aseguradoras
ADD ( CONSTRAINT id_aseguradora_pk
            PRIMARY KEY (id_empresa_aseguradora)
    );

-- polizas de siguros
CREATE TABLE polizas_seguros
    ( id_poliza     NUMBER
    , descripcion   VARCHAR2(360)
    , covertura     VARCHAR2(540) NOT NULL
    , id_empresa_aseguradora    NUMBER
    , precio        NUMBER
    );

CREATE UNIQUE INDEX id_poliza_pk
ON polizas_seguros (id_poliza);

ALTER TABLE polizas_seguros
ADD ( CONSTRAINT id_poliza_pk
            PRIMARY KEY (id_poliza)
    , CONSTRAINT id_aseguradora_fk
            FOREIGN KEY (id_empresa_aseguradora)
                REFERENCES empresas_aseguradoras(id_empresa_aseguradora)
    );

-- precios de renta
CREATE TABLE precios_renta
    ( id_precio_renta   NUMBER
    , diaria            NUMBER
    , semanal           NUMBER
    , por_kilometraje   NUMBER
    , monto_deposito    NUMBER
    );

CREATE UNIQUE INDEX id_precio_renta_pk
ON precios_renta (id_precio_renta);

ALTER TABLE precios_renta
ADD ( CONSTRAINT id_precio_renta_pk
            PRIMARY KEY (id_precio_renta)
    );


-- vehiculos
-- tipo_vehiculo: suv, sedan, deportivo, etc
-- estado: mantenimiento, disponible, rentado, 
CREATE TABLE vehiculos
    ( id_vehiculo       NUMBER
    , modelo            VARCHAR2(60) NOT NULL
    , marca             VARCHAR2(60) NOT NULL
    , placa             VARCHAR2(10) NOT NULL
    , tipo_vehiculo     VARCHAR2(30) NOT NULL
    , fecha_fabricacion DATE NOT NULL
    , numero_serie      VARCHAR2(120) NOT NULL
    , color             VARCHAR2(60) NOT NULL
    , kilometraje_actual NUMBER NOT NULL
    , estado            VARCHAR2(15)
    , id_poliza         NUMBER NOT NULL
    , id_precio_renta   NUMBER NOT NULL
    );

CREATE UNIQUE INDEX serie_ui
ON vehiculos (numero_serie);

CREATE UNIQUE INDEX placa_ui
ON vehiculos (placa);

CREATE UNIQUE INDEX id_vehiculo_pk
ON vehiculos (id_vehiculo);

ALTER TABLE vehiculos
ADD ( CONSTRAINT id_vehiculo_pk
            PRIMARY KEY (id_vehiculo)
    , CONSTRAINT id_poliza_fk
            FOREIGN KEY (id_poliza)
                REFERENCES polizas_seguros(id_poliza)
    , CONSTRAINT id_precio_renta_fk
            FOREIGN KEY (id_precio_renta)
                REFERENCES precios_renta(id_precio_renta)
    );


-- rentas de vehiculos
-- estado: pendiente (se rento el vehiculo pero no se ha devuelto), 
--         completado (luego de que el vehiculo es retornado y se paga el servicio).
CREATE TABLE rentas_de_vehiculos
    ( id_renta      NUMBER
    , id_vehiculo   NUMBER NOT NULL
    , id_cliente    NUMBER NOT NULL
    , fecha_inicial DATE NOT NULL
    , fecha_final   DATE
    , kilometraje_inicial   NUMBER NOT NULL
    , kilometraje_final     NUMBER
    , estado        VARCHAR2(10)
    );

CREATE UNIQUE INDEX id_renta_pk
ON rentas_de_vehiculos (id_renta);

ALTER TABLE rentas_de_vehiculos
ADD ( CONSTRAINT id_renta_pk
            PRIMARY KEY (id_renta)
    , CONSTRAINT id_vehiculo_renta_fk
            FOREIGN KEY (id_vehiculo)
                REFERENCES vehiculos(id_vehiculo)
    , CONSTRAINT id_cliente_renta_fk
            FOREIGN KEY (id_cliente)
                REFERENCES clientes(id_cliente)
    );

-- reporte de averias
-- prioridad: 1 => alta, 2 => media, 3 => baja
-- estado: pendiente, solucionado
CREATE TABLE reportes_de_averias
    ( id_reporte    NUMBER
    , id_cliente    NUMBER
    , id_vehiculo   NUMBER NOT NULL
    , descripcion   VARCHAR2(300) NOT NULL
    , estado        VARCHAR2(15)
    , fecha         DATE 
    , prioridad     NUMBER NOT NULL
    );

CREATE UNIQUE INDEX id_reporte_pk
ON reportes_de_averias (id_reporte);

ALTER TABLE reportes_de_averias
ADD ( CONSTRAINT id_reporte_pk
            PRIMARY KEY (id_reporte)
    , CONSTRAINT id_reporte_cliente_fk
            FOREIGN KEY (id_cliente)
                REFERENCES clientes(id_cliente)
    , CONSTRAINT id_reporte_vehiculo_fk
            FOREIGN KEY (id_vehiculo)
                REFERENCES vehiculos(id_vehiculo)
    );

-- suplidores
CREATE TABLE suplidores
    ( id_suplidor   NUMBER
    , nombre        VARCHAR2(60) NOT NULL
    , telefono      VARCHAR2(10) NOT NULL
    , id_direccion   NUMBER NOT NULL
    );

CREATE UNIQUE INDEX id_suplidor_pk
ON suplidores (id_suplidor);

ALTER TABLE suplidores
ADD ( CONSTRAINT id_suplidor_pk
            PRIMARY KEY (id_suplidor)
    , CONSTRAINT id_direccion_sp_fk 
            FOREIGN KEY (id_direccion)
                REFERENCES direcciones(id_direccion)
    );

-- sucursales
CREATE TABLE sucursales
    ( id_sucursal   NUMBER
    , telefono      VARCHAR2(10) NOT NULL
    , email         VARCHAR2(60)
    , id_direccion  NUMBER
    );

CREATE UNIQUE INDEX id_sucursal_pk
ON sucursales (id_sucursal);

CREATE UNIQUE INDEX suc_email_ui
ON sucursales (email);

ALTER TABLE sucursales
ADD ( CONSTRAINT id_sucursal_pk
            PRIMARY KEY (id_sucursal)
    , CONSTRAINT id_direccion_sucursal_fk
            FOREIGN KEY (id_direccion)
                REFERENCES direcciones(id_direccion)
    );

-- adquicisiones de vehiculos
CREATE TABLE adquisiciones_de_vehiculos
    ( id_adquisicion    NUMBER
    , id_vehiculo       NUMBER NOT NULL
    , id_suplidor       NUMBER NOT NULL
    , id_sucursal       NUMBER NOT NULL
    , costo             NUMBER NOT NULL
    , fecha             DATE NOT NULL
    );

CREATE UNIQUE INDEX id_adquisicion_pk
ON adquisiciones_de_vehiculos (id_adquisicion);

CREATE UNIQUE INDEX id_vehiculo_ad_ui
ON adquisiciones_de_vehiculos (id_vehiculo);

ALTER TABLE adquisiciones_de_vehiculos
ADD ( CONSTRAINT id_adquisicion_pk
            PRIMARY KEY (id_adquisicion)
    , CONSTRAINT id_vehiculo_ad_fk
            FOREIGN KEY (id_vehiculo)
                REFERENCES vehiculos(id_vehiculo)
    , CONSTRAINT id_sucursal_ad_fk
            FOREIGN KEY (id_sucursal)
                REFERENCES sucursales(id_sucursal)
    , CONSTRAINT id_suplidor_ad_fk
            FOREIGN KEY (id_suplidor)
                REFERENCES suplidores(id_suplidor)
    );

-- proveedores de servicios
-- registrar los servicios prestados por terceros, 
-- servisios como mantenimiento electrico del local, plomeria, jardineria, mecanica, etc...
CREATE TABLE proveedores_servicios
    ( id_proveedor_servicio  NUMBER   
    , nombre                 VARCHAR2(60) NOT NULL
    , ncf                    VARCHAR2(10) NOT NULL
    , telefono               VARCHAR2(10) NOT NULL
    , direccion              VARCHAR2(240) NOT NULL
    );

CREATE UNIQUE INDEX id_proveedor_pk
ON proveedores_servicios (id_proveedor_servicio);

CREATE UNIQUE INDEX ncf_ui
ON proveedores_servicios (ncf);

ALTER TABLE proveedores_servicios
ADD ( CONSTRAINT id_proveedor_pk
            PRIMARY KEY (id_proveedor_servicio)
    );

-- tipos de servicios que pueden ser prestados por terceros
CREATE TABLE tipos_servicios  
    ( id_tipo_servicio   NUMBER   
    , nombre             VARCHAR2(40) 
    , codigo             VARCHAR2(3)
    , descripcion        VARCHAR2(600)
    );

CREATE UNIQUE INDEX id_tipo_servicio_pk
ON tipos_servicios (id_tipo_servicio);

CREATE UNIQUE INDEX codigo_servicio_ui
ON tipos_servicios (codigo);

ALTER TABLE tipos_servicios
ADD ( CONSTRAINT id_tipo_servicio_pk
            PRIMARY KEY (id_tipo_servicio)
    );

-- servicios disponibles por terceros
CREATE TABLE servicios_disponibles
    ( id_servicio      NUMBER
    , id_tipo_servicio NUMBER
    , id_proveedor     NUMBER
    );

ALTER TABLE servicios_disponibles
ADD ( CONSTRAINT id_servicio_pk
            PRIMARY KEY (id_servicio)
    , CONSTRAINT id_tipo_serv_fk
            FOREIGN KEY (id_tipo_servicio)
                REFERENCES tipos_servicios(id_tipo_servicio)
    , CONSTRAINT id_proveedor_fk
            FOREIGN KEY (id_proveedor)
                REFERENCES proveedores_servicios(id_proveedor_servicio)
    );

-- empleados de provedores servicios
CREATE TABLE empleados_proveedores_servicios
    ( id_empleado_proveedor     NUMBER
    , primer_nombre             VARCHAR2(60) NOT NULL
    , apellido                  VARCHAR2(60) NOT NULL
    , identificacion            VARCHAR2(20) NOT NULL
    , id_proveedor_servicio     NUMBER
    );

CREATE UNIQUE INDEX id_empleado_pro_pk
ON empleados_proveedores_servicios (id_empleado_proveedor);

ALTER TABLE empleados_proveedores_servicios
ADD ( CONSTRAINT id_empleado_pro_pk
            PRIMARY KEY (id_empleado_proveedor)
    , CONSTRAINT id_proveedor_servicio_fk
            FOREIGN KEY (id_proveedor_servicio)
                REFERENCES proveedores_servicios(id_proveedor_servicio)
    );

-- otros servicios: servicios que tienen que ver los vehiculos per se
CREATE TABLE otros_servicios
    ( id_servicio   NUMBER
    , id_empleado_proveedor NUMBER NOT NULL
    , id_sucursal           NUMBER NOT NULL
    , descripcion   VARCHAR2(60) NOT NULL
    , costo         NUMBER NOT NULL
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

-- facturas de mantenimiento
CREATE TABLE facturas_mantenimiento
    ( id_factura    NUMBER
    , detalle       VARCHAR2(300)
    , monto         NUMBER
    , descripcion   VARCHAR2(600)
    );

CREATE UNIQUE INDEX id_factura_pk
ON facturas_mantenimiento (id_factura);

ALTER TABLE facturas_mantenimiento
ADD ( CONSTRAINT id_factura_pk
            PRIMARY KEY (id_factura)
    );

-- tipo_mantenimiento: 1 => preventivo, 2 => predictivo, 3 => correctivo 
CREATE TABLE tipos_de_mantenimiento
    ( id_tipo_mantenimiento NUMBER
    , nombre        VARCHAR2(15)
    , descripcion   VARCHAR2(600)
    );

ALTER TABLE tipos_de_mantenimiento
ADD ( CONSTRAINT id_tipo_mant_pk
            PRIMARY KEY (id_tipo_mantenimiento)
    );

-- vehiculos en mantenimiento
CREATE TABLE vehiculos_en_mantenimiento
    ( id_mantenimiento      NUMBER
    , id_vehiculo           NUMBER NOT NULL
    , id_empleado_proveedor NUMBER NOT NULL
    , id_factura            NUMBER NOT NULL
    , id_tipo_mantenimiento NUMBER NOT NULL
    , fecha_entrada         DATE NOT NULL
    , fecha_salida          DATE
    );

CREATE UNIQUE INDEX id_mantenimiento_pk
ON vehiculos_en_mantenimiento (id_mantenimiento);

ALTER TABLE vehiculos_en_mantenimiento
ADD ( CONSTRAINT id_mantenimiento_pk
            PRIMARY KEY (id_mantenimiento)
    , CONSTRAINT id_vehiculo_mant_fk
            FOREIGN KEY (id_vehiculo)
                REFERENCES vehiculos(id_vehiculo)
    , CONSTRAINT id_empleado_mant_fk
            FOREIGN KEY (id_empleado_proveedor)
                REFERENCES empleados_proveedores_servicios(id_empleado_proveedor)
    , CONSTRAINT id_factura_fk
            FOREIGN KEY (id_factura)
                REFERENCES facturas_mantenimiento(id_factura)
    , CONSTRAINT id_tipo_mantenimiento_fk
            FOREIGN KEY (id_tipo_mantenimiento)
                REFERENCES tipos_de_mantenimiento(id_tipo_mantenimiento)
    );

