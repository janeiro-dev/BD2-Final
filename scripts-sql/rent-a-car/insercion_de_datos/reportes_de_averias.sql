INSERT INTO reportes_de_averias VALUES
    ( reportes_averias_seq.NEXTVAL
    , 101
    , 11
    , 'Se escucha un ruido molesto al manejar'
    , 'solucionado'
    , TO_DATE('4-03-2019', 'dd-MM-yyyy')
    , 2
    );

INSERT INTO reportes_de_averias VALUES
    ( reportes_averias_seq.NEXTVAL
    , 102
    , 13
    , 'No enciende'
    , 'pendiente'
    , TO_DATE('4-05-2019', 'dd-MM-yyyy')
    , 3
    );

INSERT INTO reportes_de_averias VALUES
    ( reportes_averias_seq.NEXTVAL
    , 102
    , 14
    , 'Se apaga de repente luego de estar encendido por alrededor de una hora'
    , 'pendiente'
    , TO_DATE('4-06-2019', 'dd-MM-yyyy')
    , 3
    );