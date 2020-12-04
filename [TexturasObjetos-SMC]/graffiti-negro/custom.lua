addEventHandler('onClientResourceStart', resourceRoot, 
function() 

outputChatBox ( "Test")
local txd = engineLoadTXD('files/eastlstr_lae2.txd',true)
        engineImportTXD(txd, 17504)

		
	engineSetModelLODDistance(17504, 500)
end 
)