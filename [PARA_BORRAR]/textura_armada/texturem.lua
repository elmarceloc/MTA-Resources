function AndrixxClient ()
txd = engineLoadTXD("cj_zip_sign.txd") 
engineImportTXD(txd, 2733 )
engineImportTXD(txd, 2732 )
end
addEventHandler( "onClientResourceStart", resourceRoot, AndrixxClient )