CREATE DATABASE LINK dblinkhr 
    CONNECT TO hr_manager IDENTIFIED BY tiger
    USING '(DESCRIPTION=
                (ADDRESS=(PROTOCOL=TCP)(HOST=localhost)(PORT=1521))
                (CONNECT_DATA=(SERVICE_NAME=orclpdb))
            )';