addEventHandler('onClientResourceStart', resourceRoot, 
function() 

outputChatBox ( "Test")
local txd = engineLoadTXD('files/liderex.txd',true)
        engineImportTXD(txd, 5040)

	
	engineSetModelLODDistance(5040, 200)
end 
)