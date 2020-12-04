addEventHandler('onClientResourceStart', resourceRoot, 
function() 

local txd = engineLoadTXD('files/sunset02_law2.txd',true)
        engineImportTXD(txd, 6364)

	
	local dff = engineLoadDFF('files/sunset07_law2.dff') 
	engineReplaceModel(dff, 6364)

		
	engineSetModelLODDistance(6364, 250)
end 
)