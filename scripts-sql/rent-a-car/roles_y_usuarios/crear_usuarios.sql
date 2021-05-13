-- recepcionista: Jimena Medina
CREATE USER jmedina IDENTIFIED BY jm1234;
GRANT recepcionista TO jmedina;

-- Conductor: Manuel Jimenez Rodriguez
CREATE USER manueljr IDENTIFIED BY mjr1234;
GRANT conductor TO manueljr;

-- Conductor: Pablo Fernandez
CREATE USER pfernan IDENTIFIED BY pf1234;
GRANT conductor TO pfernan;

-- Gerente: Alfredo Montero
CREATE USER amontero IDENTIFIED BY am1234;
GRANT gerente TO amontero;

-- Usuario utilizados por los mecanicos
CREATE USER user_mecanico IDENTIFIED BY um1234;
GRANT mecanico TO user_mecanico;
