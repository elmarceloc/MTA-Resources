addEventHandler('onClientResourceStart', resourceRoot, 
function() 

local txd = engineLoadTXD('files/lasground_las2.txd',true)
        engineImportTXD(txd, 5113)

	
	engineSetModelLODDistance(5113, 500)
end 
)