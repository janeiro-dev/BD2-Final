CREATE TABLE Beneficios_empleados  
    ( id_beneficio   NUMBER   
                     CONSTRAINT id_beneficio_nn NOT NULL 
    ,                CONSTRAINT id_beneficio_pk  
                        PRIMARY KEY (id_beneficio) 
    , descripcion    VARCHAR2(300)   
    );
    
    CREATE TABLE Direccion_empleado
    ( id_direccion_empleado   NUMBER   
                              CONSTRAINT id_direccion_empleado_nn NOT NULL 
    ,                         CONSTRAINT id_direccion_empleado_pk  
                              PRIMARY KEY (id_direccion_empleado) 
    , calle                   VARCHAR2(120)
    , sector                  VARCHAR2(120)
    , ciudad                  VARCHAR2(120)
    , numero_vivienda         VARCHAR2(60)
    );
    
    CREATE TABLE Locacion  
    ( id_locacion    NUMBER   
                     CONSTRAINT id_locacion_nn NOT NULL 
    ,                CONSTRAINT id_locacion_pk  
                     PRIMARY KEY (id_locacion) 
    , ciudad         VARCHAR2(60)
    , provincia      VARCHAR2(60)
    );
    
     CREATE TABLE Clientes
    ( id_cliente              NUMBER   
                              CONSTRAINT id_cliente_nn NOT NULL 
    ,                         CONSTRAINT id_cliente_pk  
                              PRIMARY KEY (id_cliente) 
    , primer_nombre           VARCHAR2(60)
    , apellido                VARCHAR2(80)
    , tipo_identificacion     VARCHAR2(20)
    , numero_identificacion   VARCHAR2(20)
    , numero_licencia_cond    VARCHAR2(20)
    , edad                    NUMBER
    , nacionalidad            VARCHAR2(30)
    );
    
    CREATE TABLE Empresas_Aseguradoras
    ( id_empresa_aseguradora  NUMBER   
                              CONSTRAINT id_empresa_aseguradora_nn NOT NULL 
    ,                         CONSTRAINT id_empresa_aseguradora_pk  
                              PRIMARY KEY (id_empresa_aseguradora) 
    , telefono                VARCHAR2(10)
    , nombre                  VARCHAR2(60)
    , descripcion             VARCHAR2(360)
    );
    
CREATE TABLE Proveedores_servicios
    ( id_proveedor_servicios  NUMBER   
                              CONSTRAINT id_proveedor_servicios_nn NOT NULL 
    ,                         CONSTRAINT id_proveedor_servicios_pk  
                              PRIMARY KEY (id_proveedor_servicios) 
    , nombre                  VARCHAR2(60)
    , nfc                     VARCHAR2(10)
    , telefono                VARCHAR2(10)
    , direccion               VARCHAR2(240)
    );
    
    CREATE TABLE Tipos_servicios  
    ( id_tipos_servicios   NUMBER   
                           CONSTRAINT id_tipos_servicios_nn NOT NULL 
    ,                      CONSTRAINT id_tipos_servicios_pk  
                           PRIMARY KEY (id_tipos_servicios) 
    , nombre               VARCHAR2(40) 
    , codigo               VARCHAR2(3)
    );
    