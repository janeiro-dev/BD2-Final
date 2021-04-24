-- Comentario de prueva
   CREATE TABLE locaciones  
    ( locacion_id    INT NOT NULL 
                     CONSTRAINT lo_id_pk  
       		        PRIMARY KEY  
    , direccion      VARCHAR2(40)  
    , ciudad         VARCHAR2(30)  
	             CONSTRAINT lo_ciudad_nn  NOT NULL  
    , provincia      VARCHAR2(25)  
    )
    
    
    CREATE SEQUENCE locaciones_seq  
 START WITH     5000  
 INCREMENT BY   1000  
 MAXVALUE       90000  
 NOCACHE  
 NOCYCLE
 


 CREATE TABLE sucursales 
    ( sucursal_id     NUMBER(4) 
                       CONSTRAINT suc_id_pk  
       		          PRIMARY KEY 
    , nombre_sucursal  VARCHAR2(30)  
	               CONSTRAINT nombre_suc_nn  NOT NULL  
    , gerente_id       NUMBER(6)  
    , locacion_id      NUMBER(4)  
    ,                  CONSTRAINT suc_loc_fk  
       		          FOREIGN KEY (locacion_id)  
        	          REFERENCES locaciones (locacion_id)  
    )


    
    CREATE SEQUENCE sucursales_seq  
 START WITH     125  
 INCREMENT BY   25  
 MAXVALUE       500  
 NOCACHE  
 NOCYCLE


 
 CREATE TABLE trabajos  
    ( trabajo_id         VARCHAR2(10)  
                     CONSTRAINT tbj_id_pk  
      		        PRIMARY KEY 
    , posicion       VARCHAR2(35)  
	             CONSTRAINT nombre_tbj_nn  NOT NULL  
    , salario_min     NUMBER(6)  
    , salario_max     NUMBER(6)  
    )
    

    
    CREATE TABLE empleados  
    ( empleado_id    NUMBER(6)  
                     CONSTRAINT emp_empl_id_pk  
                        PRIMARY KEY 
    , nombre        VARCHAR2(20)  
    , apellido      VARCHAR2(25)  
	             CONSTRAINT emp_apellido_nn  NOT NULL  
    , telefono   VARCHAR2(20)  
    , fecha_inicio      DATE  
	             CONSTRAINT emp_fecha_inicio_nn  NOT NULL  
    , trabajo_id         VARCHAR2(10)  
	             CONSTRAINT emp_tbj_nn  NOT NULL  
    , salario        NUMBER(8,2)  
                     CONSTRAINT emp_salario_min  
                        CHECK (salario > 0)  
    , gerente_id     NUMBER(6)  
    ,                CONSTRAINT emp_gerente_fk  
                        FOREIGN KEY (gerente_id)  
                        REFERENCES empleados 
    , sucursal_id      NUMBER(4)  
    ,                CONSTRAINT emp_suc_fk  
                        FOREIGN KEY (sucursal_id)  
                        REFERENCES sucursales 
    )
    

    

    CREATE SEQUENCE empleados_seq  
 START WITH     300  
 INCREMENT BY   1  
 NOCACHE  
 NOCYCLE;