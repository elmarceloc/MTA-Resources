--
-- c_car_paint.lua
--

addEventHandler( "onClientResourceStart", resourceRoot,
	function()

		-- Version check
		if getVersion ().sortable < "1.1.0" then
			outputChatBox( "Resource no es compatible con este client." )
			return
		end

		-- Create shader
		local myShader, tec = dxCreateShader ( "car_paint.fx" )

		if not myShader then
			outputChatBox( "No se pudo crear shader. Utilice debugscript 3" )
		else
			outputChatBox( "Utilizando una técnica " .. tec )

			-- Set textures
			local textureVol = dxCreateTexture ( "images/smallnoise3d.dds" );
			local textureCube = dxCreateTexture ( "images/cube_env256.dds" );
			dxSetShaderValue ( myShader, "sRandomTexture", textureVol );
			dxSetShaderValue ( myShader, "sReflectionTexture", textureCube );

			-- Apply to world texture
			engineApplyShaderToWorldTexture ( myShader, "vehiclegrunge256" )
			engineApplyShaderToWorldTexture ( myShader, "?emap*" )

			--here is a list of train textures i didn't apply
			--freightbody256 freighttexpage2 freighttexpage freibox92texpage256 freiflat92texpage128 freiflat92floor128
			--freight92window64

			--a table of texture names

			local texturegrun = {
			"predator92body128", "monsterb92body256a", "monstera92body256a", "andromeda92wing","fcr90092body128",
			"hotknifebody128b", "hotknifebody128a", "rcbaron92texpage64", "rcgoblin92texpage128", "rcraider92texpage128",
			"rctiger92body128","rhino92texpage256", "petrotr92interior128","artict1logos","rumpo92adverts256","dash92interior128",
			"coach92interior128","combinetexpage128","hotdog92body256",
			"raindance92body128", "cargobob92body256", "andromeda92body", "at400_92_256", "nevada92body256",
			"polmavbody128a" , "sparrow92body128" , "hunterbody8bit256a" , "seasparrow92floats64" ,
			"dodo92body8bit256" , "cropdustbody256", "beagle256", "hydrabody256", "rustler92body256",
			"shamalbody256", "skimmer92body128", "stunt256", "maverick92body128", "leviathnbody8bit256"
			                    }

			for _,addList in ipairs(texturegrun) do
			engineApplyShaderToWorldTexture (myShader, addList )
		    end


		end
	end
)
