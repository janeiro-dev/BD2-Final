-- si esta usando sqldeveloper, cerrar todos los tabas que muestren los resultados de los queries
-- para poder cerrar hay que hacer 'commit' o 'rollback' por se guardaran o descartaran todos
-- los cambios en la base de datos hasta este momento
COMMIT;
ALTER SESSION CLOSE DATABASE LINK dblinkhr;
DROP DATABASE LINK dblinkhr;