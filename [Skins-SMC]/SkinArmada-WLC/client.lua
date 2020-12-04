
txd = engineLoadTXD ( "img/armada.txd" )
engineImportTXD ( txd, 260 )
dff = engineLoadDFF ( "img/armada.dff" )
engineReplaceModel ( dff, 260 )

