addEventHandler('onClientResourceStart', resourceRoot, 
function() 

local txd = engineLoadTXD('files/torreentel.txd',true)
        engineImportTXD(txd, 1934)

	
	local dff = engineLoadDFF('files/torreentel.dff', 0) 
	engineReplaceModel(dff, 1934)


	local col = engineLoadCOL('files/torreentel.col') 
	engineReplaceCOL(col, 1934)

		
	engineSetModelLODDistance(1934, 500)
end 
)