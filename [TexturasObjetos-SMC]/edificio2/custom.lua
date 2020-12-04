addEventHandler('onClientResourceStart', resourceRoot, 
function() 

local txd = engineLoadTXD('files/ganton01_lae2.txd',true)
        engineImportTXD(txd, 17515)
		
	engineSetModelLODDistance(17515, 500)
end 
)