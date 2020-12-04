function Client ()
txd = engineLoadTXD("img/electricgate.txd") 
engineImportTXD(txd, 980 )
end
addEventHandler( "onClientResourceStart", resourceRoot, Client )