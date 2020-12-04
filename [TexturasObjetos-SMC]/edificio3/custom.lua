addEventHandler('onClientResourceStart', resourceRoot, 
function() 

local txd = engineLoadTXD('files/comedprj1_la.txd',true)
        engineImportTXD(txd, 3584)
		
	engineSetModelLODDistance(3584, 500)
end 
)