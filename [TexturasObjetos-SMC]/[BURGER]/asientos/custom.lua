addEventHandler('onClientResourceStart', resourceRoot, 
function() 

local txd = engineLoadTXD('files/asientos.txd',true)
        engineImportTXD(txd, 2638)

	
	local dff = engineLoadDFF('files/asientos.dff', 0) 
	engineReplaceModel(dff, 2638)

		
	engineSetModelLODDistance(2638, 500)
end 
)