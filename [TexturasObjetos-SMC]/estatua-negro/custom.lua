addEventHandler('onClientResourceStart', resourceRoot, 
function() 

local txd = engineLoadTXD('files/negro.txd',true)
        engineImportTXD(txd, 2218)

	
	local dff = engineLoadDFF('files/negro.dff', 0) 
	engineReplaceModel(dff, 2218)


	local col = engineLoadCOL('files/negro.col') 
	engineReplaceCOL(col, 2218)

		
	engineSetModelLODDistance(2218, 100)
end 
)