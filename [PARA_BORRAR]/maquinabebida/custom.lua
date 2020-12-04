addEventHandler('onClientResourceStart', resourceRoot, 
function() 

local txd = engineLoadTXD('files/maquina.txd',true)
        engineImportTXD(txd, 955)

		
	engineSetModelLODDistance(955, 200)
end 
)