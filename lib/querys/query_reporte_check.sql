-- Active: 1699476407477@@13.59.147.125@3306@busrefactori

CREATE OR REPLACE PROCEDURE `SP_BUSREFACTORI_GUARDAR_CHECK`(in piloto , in placabus , in gas_antes , IN gas_despues , IN estado , IN salon , IN observacion 
) BEGIN INSERT 
	INSERT INTO
	    BUSREFACTORI.`check` (
	        piloto,
	        placabus,
	        gas_antes,
	        gas_despues,
	        estado,
	        salon,
	        observacion,
	        fecha_registro
	    )
	values (
	        piloto,
	        placabus,
	        gas_antes,
	        gas_despues,
	        estado,
	        salon,
	        observacion,
	        now()
	    );
	set @last_id = last_insert_id();
	select @last_id as id;
	END 
