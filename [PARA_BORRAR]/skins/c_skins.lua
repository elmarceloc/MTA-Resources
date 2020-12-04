addEventHandler("onClientResourceStart",resourceRoot, 
    function () 




            txd = engineLoadTXD ( 'volantin'.. ".txd" ) 
            engineImportTXD ( txd, 1000 ) 
            dff = engineLoadDFF ( "volantin".. ".dff" ) 
            engineReplaceModel ( dff, 1000 ) 

            col = engineLoadCOL( "volantin.col" )
            engineReplaceCOL( col, 1000 )

            
            txd = engineLoadTXD ( 'carrete'.. ".txd" ) 
            engineImportTXD ( txd, 953 ) 
            dff = engineLoadDFF ( "carrete".. ".dff" ) 
            engineReplaceModel ( dff, 953 ) 

end)