col = engineLoadCOL ( "EastMinami.col" )
engineReplaceCOL ( col, 2962 )
txd = engineLoadTXD ( "EastMinami.txd" )
engineImportTXD ( txd, 2962 )
dff = engineLoadDFF ( "EastMinami.dff" )
engineReplaceModel ( dff, 2962 )
engineSetModelLODDistance(2962, 2000)