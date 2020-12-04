addEventHandler('onClientResourceStart', resourceRoot, 
function() 

local txd = engineLoadTXD('files/7_11_door.txd',true)
        engineImportTXD(txd, 1560)

		
	engineSetModelLODDistance(1560, 500)
end 
)