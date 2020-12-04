addEventHandler('onClientResourceStart', resourceRoot, 
function() 

local txd = engineLoadTXD('files/easy.txd',true)
        engineImportTXD(txd, 1881)

	
	local dff = engineLoadDFF('files/easy.dff', 0) 
	engineReplaceModel(dff, 1881)


	local col = engineLoadCOL('files/easy.col') 
	engineReplaceCOL(col, 1881)

		
	engineSetModelLODDistance(1881, 500)
end 
)