
txd = engineLoadTXD ( "img/pdi3.txd" )
engineImportTXD ( txd, 286 )
dff = engineLoadDFF ( "img/pdi3.dff" )
engineReplaceModel ( dff, 286 )

