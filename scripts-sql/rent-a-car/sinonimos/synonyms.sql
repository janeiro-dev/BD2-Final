    -- Para procedures --
CREATE OR REPLACE SYNONYM NewUser
FOR Create_New_User;

CREATE OR REPLACE SYNONYM NewReport
FOR New_Damage_Report;

CREATE OR REPLACE SYNONYM SolveReport
FOR Set_Solved_Report;

CREATE OR REPLACE SYNONYM RentVehicle
FOR Set_New_Rented_Car;

    -- Para Vistas --
CREATE OR REPLACE SYNONYM InfoClientes
FOR Informacion_sobre_Clientes;

CREATE OR REPLACE SYNONYM ReportesVehiculos
FOR Reportes_Sobre_Vehiculos;

    -- Para tablas --
CREATE OR REPLACE SYNONYM Aseguradoras
FOR Empresas_Aseguradoras;

CREATE OR REPLACE SYNONYM RentasVehiculos
FOR Rentas_de_Vehiculos;

CREATE OR REPLACE SYNONYM Averias
FOR Reportes_de_Averias;

CREATE OR REPLACE SYNONYM AdqVehiculos
FOR Adquisiciones_de_Vehiculos;

CREATE OR REPLACE SYNONYM EmpProvServ
FOR Empleados_Proveedores_Servicios;

CREATE OR REPLACE SYNONYM VehiculosMant
FOR Vehiculos_en_Mantenimiento;

-- sinonimo a dblink
CREATE OR REPLACE SYNONYM empleados_sucursal
FOR empleados@dblinkhr;
