function Client ()

col = engineLoadCOL ( "img/foodtruck1.col" )
engineReplaceCOL ( col, 2705 )
col = engineLoadCOL ( "img/foodtruck2.col" )
engineReplaceCOL ( col, 2706 )

txd = engineLoadTXD ( "img/foodtruck.txd" )
engineImportTXD ( txd, 2705 )
txd = engineLoadTXD ( "img/foodtruck.txd" )
engineImportTXD ( txd, 2706 )

dff = engineLoadDFF ( "img/foodtruck1.dff" )
engineReplaceModel ( dff, 2705 )
dff = engineLoadDFF ( "img/foodtruck2.dff" )
engineReplaceModel ( dff, 2706 )

engineSetModelLODDistance(2705, 250)
engineSetModelLODDistance(2706, 250)


end
addEventHandler( "onClientResourceStart", resourceRoot, Client )