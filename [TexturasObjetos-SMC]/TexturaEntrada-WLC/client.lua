function Client ()
txd = engineLoadTXD("img/law2misc_lax.txd") 
engineImportTXD(txd, 3749 )
end
addEventHandler( "onClientResourceStart", resourceRoot, Client )