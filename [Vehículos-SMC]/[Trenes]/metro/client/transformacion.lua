
--Metro Rojo A
txd_freight = engineLoadTXD ( "img/freight.txd" )
engineImportTXD ( txd_freight, 537 )
dff_freight = engineLoadDFF ( "img/freight.dff", 0 )
engineReplaceModel ( dff_freight, 537 )
engineSetModelLODDistance(537, 5000)
--Metro Rojo B
txd_freiflat = engineLoadTXD ( "img/freiflat.txd" )
engineImportTXD ( txd_freiflat, 569 )
dff_freiflat = engineLoadDFF ( "img/freiflat.dff", 0 )
engineReplaceModel ( dff_freiflat, 569 )
engineSetModelLODDistance(569, 5000)
--Metro Celeste A
txd_streak = engineLoadTXD ( "img/streak.txd" )
engineImportTXD ( txd_streak, 538 )
dff_streak = engineLoadDFF ( "img/streak.dff", 0 )
engineReplaceModel ( dff_streak, 538 )
engineSetModelLODDistance(538, 5000)
--Metro Celeste B
txd_streakc = engineLoadTXD ( "img/streakc.txd" )
engineImportTXD ( txd_streakc, 570 )
dff_streakc = engineLoadDFF ( "img/streakc.dff", 0 )
engineReplaceModel ( dff_streakc, 570 )
engineSetModelLODDistance(570, 5000)

--Vagón Quemado
txd_freibox = engineLoadTXD ( "img/freibox.txd" )
engineImportTXD ( txd_freibox, 590 )
dff_freibox = engineLoadDFF ( "img/freibox.dff", 0 )
engineReplaceModel ( dff_freibox, 590 )
engineSetModelLODDistance(590, 5000)

