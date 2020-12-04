addEventHandler('onClientResourceStart', resourceRoot, 
function() 

local col = engineLoadCOL('cartelPlazaDeArmas/files/cartel.col') 
	engineReplaceCOL(col, 3032)
	
local txd = engineLoadTXD('cartelPlazaDeArmas/files/cartel.txd',true)
    engineImportTXD(txd, 3032)
	
local dff = engineLoadDFF('cartelPlazaDeArmas/files/cartel.dff', 0) 
	engineReplaceModel(dff, 3032)


	

		
	engineSetModelLODDistance(3032, 100)
end 
)