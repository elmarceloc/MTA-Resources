
txd = engineLoadTXD ( "img/pdi2.txd" )
engineImportTXD ( txd, 11 )
dff = engineLoadDFF ( "img/pdi2.dff" )
engineReplaceModel ( dff, 11 )

