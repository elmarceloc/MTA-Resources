function killAllPlayers() 
    local players = getElementsByType("player") 
     for I = 1, #players do 
      local p = players[I] 
      killPlayer( p, p ) 
     end 
    end 


addEventHandler('onResourceStart',root, killAllPlayers ) 