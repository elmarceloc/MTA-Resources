function Client ()

col2 = engineLoadCOL ( "img/surf.col" )
engineReplaceCOL ( col2, 1641 )
txd2 = engineLoadTXD ( "img/surf.txd" )
engineImportTXD ( txd2, 1641 )
dff2 = engineLoadDFF ( "img/surf.dff" )
engineReplaceModel ( dff2, 1641 )
engineSetModelLODDistance(1641, 250)

col4 = engineLoadCOL ( "img/kiosko.col" )
engineReplaceCOL ( col4, 1642 )
txd4 = engineLoadTXD ( "img/kiosko.txd" )
engineImportTXD ( txd4, 1642 )
dff4 = engineLoadDFF ( "img/kiosko.dff" )
engineReplaceModel ( dff4, 1642 )
engineSetModelLODDistance(1642, 250)

end
addEventHandler( "onClientResourceStart", resourceRoot, Client )