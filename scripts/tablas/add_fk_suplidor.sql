ALTER TABLE RENTA_CAR.adquisicion_de_vehiculos
ADD ( CONSTRAINT id_suplidor_ad_fk
            FOREIGN KEY (id_suplidor)
                REFERENCES RENTA_CAR.suplidores(id_suplidor)
    );
