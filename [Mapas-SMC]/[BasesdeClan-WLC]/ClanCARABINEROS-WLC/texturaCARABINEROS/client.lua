function Client ()

txd_pacos = engineLoadTXD("texturaCARABINEROS/img/vgndwntwn1.txd") 
engineImportTXD(txd_pacos, 7009 )
txd_pacos2 = engineLoadTXD("texturaCARABINEROS/img/vgndwntwn1.txd") 
engineImportTXD(txd_pacos2, 7184 )

txd_bandera1 = engineLoadTXD("texturaCARABINEROS/img/vegasflag.txd") 
engineImportTXD(txd_bandera1, 7090 )
txd_bandera2 = engineLoadTXD("texturaCARABINEROS/img/vegasflag.txd") 
engineImportTXD(txd_bandera2, 7091 )

txd_bandera4 = engineLoadTXD("texturaCARABINEROS/img/police_props_un.txd") 
engineImportTXD(txd_bandera4, 2614 )
end

addEventHandler( "onClientResourceStart", resourceRoot, Client )