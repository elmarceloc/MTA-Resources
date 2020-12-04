addEventHandler('onClientResourceStart', resourceRoot, 
function() 

local txd = engineLoadTXD('files/letrerotelepizza.txd',true)
        engineImportTXD(txd, 2769)

	
	local dff = engineLoadDFF('files/letrerotelepizza.dff', 0) 
	engineReplaceModel(dff, 2769)


	local col = engineLoadCOL('files/letrerotelepizza.col') 
	engineReplaceCOL(col, 2769)

		
	engineSetModelLODDistance(2769, 200)
end 
)