addEventHandler('onClientResourceStart', resourceRoot, 
function() 

local txd = engineLoadTXD('files/templae2land.txd',true)
        engineImportTXD(txd, 17517)

		
	engineSetModelLODDistance(17517, 200)
end 
)