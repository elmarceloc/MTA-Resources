addEventHandler('onClientResourceStart', resourceRoot, 
function() 

local txd = engineLoadTXD('files/asientos2.txd',true)
        engineImportTXD(txd, 1594)

	
	local dff = engineLoadDFF('files/asientos2.dff', 0) 
	engineReplaceModel(dff, 1594)

		
	engineSetModelLODDistance(1594, 500)
end 
)