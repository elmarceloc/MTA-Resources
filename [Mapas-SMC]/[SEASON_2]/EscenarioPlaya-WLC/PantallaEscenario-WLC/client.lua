function Client ()

col = engineLoadCOL ( "PantallaEscenario-WLC/img/screen_curved.col" )
engineReplaceCOL ( col, 2102 )
txd = engineLoadTXD ( "PantallaEscenario-WLC/img/screen.txd" )
engineImportTXD ( txd, 2102 )
dff = engineLoadDFF ( "PantallaEscenario-WLC/img/screen_curved.dff" )
engineReplaceModel ( dff, 2102 )
engineSetModelLODDistance(2102, 200)

end
addEventHandler( "onClientResourceStart", resourceRoot, Client )