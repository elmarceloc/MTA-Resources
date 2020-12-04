
txd = engineLoadTXD ( "img/huasa.txd" )
engineImportTXD ( txd, 246 )
dff = engineLoadDFF ( "img/huasa.dff" )
engineReplaceModel ( dff, 246 )

