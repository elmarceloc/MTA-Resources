addEventHandler('onClientResourceStart', resourceRoot, 
function() 

local txd = engineLoadTXD('files/canal13.txd',true)
        engineImportTXD(txd, 10676)

	
	local dff = engineLoadDFF('files/canal13.dff', 0) 
	engineReplaceModel(dff, 10676)

		
	engineSetModelLODDistance(10676, 500)
end 
)