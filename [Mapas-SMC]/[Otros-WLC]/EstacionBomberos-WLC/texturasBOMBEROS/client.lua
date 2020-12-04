function Client ()
col_puerta = engineLoadCOL ( "texturasBOMBEROS/img/fhouse_door.col" )
engineReplaceCOL ( col_puerta, 1931 )
col_estacion = engineLoadCOL ( "texturasBOMBEROS/img/firehouse_sfs.col" )
engineReplaceCOL ( col_estacion, 11008 )
txd_puerta = engineLoadTXD ( "texturasBOMBEROS/img/firehouse_sfse.txd" ) 
engineImportTXD ( txd_puerta, 1931 )
txd_bandera = engineLoadTXD ( "texturasBOMBEROS/img/firehouse_sfse.txd" ) 
engineImportTXD ( txd_bandera, 11245 )
txd_estacion = engineLoadTXD ( "texturasBOMBEROS/img/firehouse_sfse.txd" ) 
engineImportTXD ( txd_estacion, 11008 )
dff_puerta = engineLoadDFF ( "texturasBOMBEROS/img/fhouse_door.dff" )
engineReplaceModel ( dff_puerta, 1931 )
dff_estacion = engineLoadDFF ( "texturasBOMBEROS/img/firehouse_sfs.dff" )
engineReplaceModel ( dff_estacion, 11008 )
end
addEventHandler( "onClientResourceStart", resourceRoot, Client )