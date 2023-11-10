-- Active: 1699476407477@@13.59.147.125@3306@busrefactori
DROP PROCEDURE SP_BUSREFACTORI_GUARDAR_REPORTE;
CREATE DEFINER=`server`@`%` PROCEDURE `SP_BUSREFACTORI_GUARDAR_REPORTE`(IN piloto varchar(100), IN placabus varchar(100),
                                                                   IN detalle varchar(100), IN ubicacion varchar(100),
                                                                   IN hora varchar(100), IN sistema varchar(100),
                                                                   IN velocidad varchar(100))
BEGIN

#     insert into busrefactori.`reporte` (piloto,placabus,detalle,ubicacion,hora,sistema,velocidad,fecha_registro)
#     values (piloto,placabus,detalle,ubicacion,hora,sistema,velocidad,now());
#     set @last_id = last_insert_id();
# 
#     select @last_id as id;
END