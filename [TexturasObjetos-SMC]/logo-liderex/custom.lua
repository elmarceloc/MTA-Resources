addEventHandler('onClientResourceStart', resourceRoot, 
function() 

local txd = engineLoadTXD('files/lider.txd',true)
        engineImportTXD(txd, 2768)

	
	local dff = engineLoadDFF('files/lider.dff', 0) 
	engineReplaceModel(dff, 2768)


	local col = engineLoadCOL('files/lider.col') 
	engineReplaceCOL(col, 2768)

		
	engineSetModelLODDistance(2768, 200)
end 
)