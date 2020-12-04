addEventHandler('onClientResourceStart', resourceRoot, 
function() 

local txd = engineLoadTXD('files/liderex.txd',true)
        engineImportTXD(txd, 5040)

	
	engineSetModelLODDistance(5040, 200)
end 
)