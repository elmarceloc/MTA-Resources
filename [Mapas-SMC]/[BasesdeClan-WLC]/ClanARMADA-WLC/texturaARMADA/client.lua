function Client ()
txd = engineLoadTXD("texturaARMADA/img/sfn_helipad.txd") 
engineImportTXD(txd, 9245 )
end
addEventHandler( "onClientResourceStart", resourceRoot, Client )