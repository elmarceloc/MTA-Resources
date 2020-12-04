local playerRecorderState = { } 
  
function togglePlayerRecorder( plr ) 
    playerRecorderState[ plr ] = not playerRecorderState[ plr ]; -- first time player calls this function the state will be "true" so they'll have to press it again to hide chat and HUD 
    --showPlayerHudComponent( plr, "all",  playerRecorderState[ plr ] ); 
    showChat( plr, playerRecorderState[ plr ] ); 

    if playerRecorderState [plr] then 
        exports.huds:showhuds(plr)
        setPlayerHudComponentVisible( plr, "radar", true ); 
    else
        exports.huds:hidehuds(plr)
        setPlayerHudComponentVisible( plr, "radar",  false ); 

    end

end 
  
function bindRecorder( plr ) 
  --  if getAccountName ( getPlayerAccount ( plr ) ) == '[RevengE]Elvio_Lao' then
        bindKey( plr, "f6", "down", togglePlayerRecorder, plr ); -- change it to any key you want 
 -- end
end 
  
addEventHandler( "onPlayerLogin", root,  
    function ( ) 
        bindRecorder( source ); 
    end 
) 
addEventHandler( "onResourceStart", resourceRoot, 
    function( ) 
        for _, plr in getElementsByType( "player" ) do 
            bindRecorder( plr ); 
        end 
    end 
)