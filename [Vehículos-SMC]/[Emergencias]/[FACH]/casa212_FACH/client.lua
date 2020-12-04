
txd_fach2 = engineLoadTXD ( "img/beagle.txd" )
engineImportTXD ( txd_fach2, 511 )
dff_fach2 = engineLoadDFF ( "img/beagle.dff" )
engineReplaceModel ( dff_fach2, 511 )
