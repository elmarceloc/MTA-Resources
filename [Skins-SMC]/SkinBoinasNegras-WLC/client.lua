
txd = engineLoadTXD ( "img/bn.txd" )
engineImportTXD ( txd, 146 )
dff = engineLoadDFF ( "img/bn.dff" )
engineReplaceModel ( dff, 146 )

