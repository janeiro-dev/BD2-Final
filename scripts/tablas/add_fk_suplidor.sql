ALTER TABLE RENT_A_CAR.adquisicion_de_vehiculos
ADD ( CONSTRAINT id_suplidor_ad_fk
            FOREIGN KEY (id_suplidor)
                REFERENCES RENT_A_CAR.suplidores(id_suplidor)
    );
