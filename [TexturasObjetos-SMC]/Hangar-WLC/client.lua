function Client ()
txd = engineLoadTXD("img/cw_junkbuildcs_t.txd") 
engineImportTXD(txd, 18250 )
end
addEventHandler( "onClientResourceStart", resourceRoot, Client )