col_bateria = engineLoadCOL ( "img/DrumKit1.col" )
engineReplaceCOL ( col_bateria, 2965 )
txd_bateria = engineLoadTXD ( "img/dr_gsstudio.txd" )
engineImportTXD ( txd_bateria, 2965 )
dff_bateria = engineLoadDFF ( "img/DrumKit1.dff" )
engineReplaceModel ( dff_bateria, 2965 )
engineSetModelLODDistance(2965, 50)

col_bajo = engineLoadCOL ( "img/bassguitar01.col" )
engineReplaceCOL ( col_bajo, 2485 )
txd_bajo = engineLoadTXD ( "img/bassguitar01.txd" )
engineImportTXD ( txd_bajo, 2485 )
dff_bajo = engineLoadDFF ( "img/bassguitar01.dff" )
engineReplaceModel ( dff_bajo, 2485 )
engineSetModelLODDistance(2485, 50)

col_guitarra = engineLoadCOL ( "img/flyingv01.col" )
engineReplaceCOL ( col_guitarra, 14693 )
txd_guitarra = engineLoadTXD ( "img/flyingv01.txd" )
engineImportTXD ( txd_guitarra, 14693 )
dff_guitarra = engineLoadDFF ( "img/flyingv01.dff" )
engineReplaceModel ( dff_guitarra, 14693 )
engineSetModelLODDistance(14693, 50)

col_ampli = engineLoadCOL ( "img/GuitarAmp2.col" )
engineReplaceCOL ( col_ampli, 14686 )
txd_ampli = engineLoadTXD ( "img/dr_gsstudio.txd" )
engineImportTXD ( txd_ampli, 14686 )
dff_ampli = engineLoadDFF ( "img/GuitarAmp2.dff" )
engineReplaceModel ( dff_ampli, 14686 )
engineSetModelLODDistance(14686, 50)

col_ascensor = engineLoadCOL ( "img/VCElevator1.col" )
engineReplaceCOL ( col_ascensor, 1591 )
txd_ascensor = engineLoadTXD ( "img/VCInteriors.txd" )
engineImportTXD ( txd_ascensor, 1591 )
dff_ascensor = engineLoadDFF ( "img/VCElevator1.dff" )
engineReplaceModel ( dff_ascensor, 1591 )
engineSetModelLODDistance(1591, 50)

col_ascensor_puerta = engineLoadCOL ( "img/ElevatorDoor1.col" )
engineReplaceCOL ( col_ascensor_puerta, 1592 )
txd_ascensor_puerta = engineLoadTXD ( "img/VCInteriors.txd" )
engineImportTXD ( txd_ascensor_puerta, 1592 )
dff_ascensor_puerta = engineLoadDFF ( "img/ElevatorDoor1.dff" )
engineReplaceModel ( dff_ascensor_puerta, 1592 )
engineSetModelLODDistance(1592, 50)