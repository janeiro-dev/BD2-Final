CREATE SEQUENCE vehiculos_seq  
    START WITH      10  
    INCREMENT BY    1 
    NOMAXVALUE
    CACHE           20  
    NOCYCLE;
 
CREATE SEQUENCE clientes_seq  
    START WITH      100
    INCREMENT BY    1    
    NOCACHE  
    NOCYCLE;

CREATE SEQUENCE aseguradoras_seq  
    START WITH      500
    INCREMENT BY    10  
    MAXVALUE        700  
    NOCACHE  
    NOCYCLE;

CREATE SEQUENCE rentas_seq
    START WITH      100
    INCREMENT BY    1
    NOMAXVALUE
    NOCACHE 
    NOCYCLE;

CREATE SEQUENCE reportes_averias_seq
    START WITH      10
    INCREMENT BY    1
    NOMAXVALUE
    NOCACHE
    NOCYCLE; 
