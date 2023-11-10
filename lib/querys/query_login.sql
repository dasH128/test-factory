DROP PROCEDURE SP_BUSREFACTORI_LOGIN;

CREATE DEFINER =`SERVER`@`%` PROCEDURE `SP_BUSREFACTORI_LOGIN`
(IN V_USUARIO_LOGIN VARCHAR(50), IN V_PASSWORD VARCHAR
(50)) BEGIN SET 
	set @password = (
	        select usuario_password
	        from usuario
	        where
	            usuario_login = v_usuario_login
	    );
	if(
	    @password is not null
	    and @password = v_password
	) then
	select true as login;
	else select false as login;
	end if;
	END 
