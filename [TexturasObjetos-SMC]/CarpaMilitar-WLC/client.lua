
txd_CarpaMilitar = engineLoadTXD( "img/CarpaMilitar.txd" )
engineImportTXD(txd_CarpaMilitar, 14679)
dff_CarpaMilitar = engineLoadDFF( "img/CarpaMilitar.dff" )
engineReplaceModel(dff_CarpaMilitar, 14679)
col_CarpaMilitar = engineLoadCOL( "img/CarpaMilitar.col" )
engineReplaceCOL(col_CarpaMilitar, 14679)
engineSetModelLODDistance(14679, 100)

