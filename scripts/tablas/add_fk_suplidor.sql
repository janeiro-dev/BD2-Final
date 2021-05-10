ALTER TABLE adquisicion_de_vehiculos
ADD ( CONSTRAINT id_suplidor_ad_fk
            FOREIGN KEY (id_suplidor)
                REFERENCES suplidores(id_suplidor)
    );
