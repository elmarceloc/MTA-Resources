function Client ()
txd = engineLoadTXD("texturaPDI/img/rodeo03_law2.txd") 
engineImportTXD(txd, 6342 )

end
addEventHandler( "onClientResourceStart", resourceRoot, Client )