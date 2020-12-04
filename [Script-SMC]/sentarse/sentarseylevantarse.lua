
function sentarseanimacion ( source )
setPedAnimation ( source, "ped", "SEAT_idle", -1, true, false, false )
end
addCommandHandler ( "sentar", sentarseanimacion )

function levantarseanimacion ( source )
setPedAnimation ( source )
end
addCommandHandler ( "levantar", levantarseanimacion ) 


