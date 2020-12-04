local hudTable = 
{ 
--"radar", 
"ammo", 
"weapon", 
"area_name", 
"wanted", 
"money", 
"health", 
"clock", 
"vehicle_name" 
} 
  
function hideHUD(enable) 
     for _, hud in ipairs(hudTable) do 
          showPlayerHudComponent(hud, enable) 
     end 
end 
  
addEventHandler("onClientResourceStart", resourceRoot, function() 
     hideHUD(false) 
end) 
  
addEventHandler("onClientPlayerSpawn", getLocalPlayer(), function() 
    setTimer ( hideHUD, 2000, 1, false ) 
end) 
  
addEventHandler("onClientResourceStop", resourceRoot, function() 
     hideHUD(true) 
end) 