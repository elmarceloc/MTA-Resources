addEventHandler("onResourceStart", resourceRoot,
    function()
	    --outputChatBox( "#DF7401[ #610B0BMTA Misterix Mod v."..getResourceInfo(getThisResource(), "version").." #DF7401]", root, 255, 255, 255, true )
		--outputDebugString( "MTA Misterix Mod v."..getResourceInfo(getThisResource(), "version").." loaded ! ", 3 )
	end
)

--MYSTERIES
--Bigfoot
local bigfoot_randomPos = {

    { -861.95166015625, -2224.3134765625, 26.649639129639 },
	{ -894.73913574219, -2391.9155273438, 53.387577056885 },
	{ -677.58563232422, -2504.6865234375, 40.588394165039 },	

}

local salfate_randomPos = {

    { 211.61990, 1810.6062, 25.11719 },
	{ 209.61340, 1834.07349, 17.64063 },

}


function spawn_bigfoot()
    local x, y, z = unpack( bigfoot_randomPos[math.random(#bigfoot_randomPos)])
    local ped = createMystery( "bigfoot", x, y, z, 600, 80, 7000 )
    setPedWalkingStyle(ped,120) 
end
setTimer( spawn_bigfoot, 100, 1 )

--Jason
function spawn_jason()
    local ped = createMystery( "jason", -1632.0134277344, -2238.1726074219, 31.4765625, 0, 90, 7000 )
    giveWeapon( ped, 4 )
    setPedWeaponSlot( ped, 1 )
    setPedWalkingStyle(ped,118)	
end
setTimer( spawn_jason, 100, 1 )

--Leatherface
function spawn_leatherface()
    local ped = createMystery( "leatherface", -548.12554931641, -195.9296875, 78.40625, 0, 90, 7000 )
    giveWeapon( ped, 9 )
    setPedWeaponSlot( ped, 1 )
    setPedWalkingStyle(ped,118) 	
end
setTimer( spawn_leatherface, 100, 1 )


--Pigsy
function spawn_pigsy()
    local ped = createMystery( "pigsy", -2235.7905273438, -1124.2531738281, 15.671875, 0, 50, 7000 )
    giveWeapon( ped, 9 )
    setPedWeaponSlot( ped, 1 )
    setPedWalkingStyle(ped,120)	
end
setTimer( spawn_pigsy, 100, 1 )
--Yeti
function spawn_yeti()
    local ped = createMystery( "yeti", -2404, -1029.83362, 90.67680, 10, 50, 7000 )
    setPedWalkingStyle(ped,120)	
end
setTimer( spawn_yeti, 100, 1 )

function spawn_marselo()
                              --  name          x                  y                z   Extralife   areasize      reward
    local ped = createMystery( "marselo", 2079, 1530, 11, 0,      50,           7000 )
    giveWeapon( ped, 4 )
    setPedWeaponSlot( ped, 1 )
    setPedWalkingStyle(ped,118) 
end
setTimer( spawn_marselo, 100, 1 )


function spawn_shrek()
    local ped = createMystery( "shrek", 1471, -173, 26, 0, 50, 25000 )
    giveWeapon( ped, 6 )
    setPedWeaponSlot( ped, 1 )
    setPedWalkingStyle(ped,118) 
end
setTimer( spawn_shrek, 100, 1 )


function spawn_pancho()
    local ped = createMystery( "pancho",-2313, -1666, 484, 0, 50, 10000 )
    giveWeapon( ped, 25 )
    setPedWeaponSlot( ped, 3 )
    setPedWalkingStyle(ped,118) 
end
setTimer( spawn_pancho, 100, 1 )


function spawn_chupacabras()
    local ped = createMystery( "chupacabras", 889, -493, 3, 0, 50, 10000 )
    giveWeapon( ped, 9 )
    setPedWeaponSlot( ped, 1 )
    setPedWalkingStyle(ped,118) 
end
setTimer( spawn_chupacabras, 100, 1 )


function spawn_pinochet()
    local ped = createMystery( "pinochet", 859, -1108, 26, 0, 50, 0 )
    giveWeapon( ped, 30 )
    setPedWeaponSlot( ped, 5 )
    setPedWalkingStyle(ped,118) 
end
setTimer( spawn_pinochet, 100, 1 )

function spawn_salfate()
    local x,y,z =unpack( salfate_randomPos[math.random(#salfate_randomPos)] )
    local ped = createMystery( "salfate", x ,y, z, 0, 50, 0 )

    giveWeapon( ped, 38  )
    setPedWeaponSlot( ped, 7 )
    setPedWalkingStyle(ped, 118) 
end
setTimer( spawn_salfate, 100, 1 )

--RESPAWN

addEventHandler("onPedWasted", root,
    function()

      --  if ( getElementData( source, "Misterix" ) == "bigfoot" ) then
	--	    setTimer( spawn_bigfoot, 600000, 1 )		
		if ( getElementData( source, "Misterix" ) == "jason" ) then
		    setTimer( spawn_jason, 600000, 1 )
		elseif ( getElementData( source, "Misterix" ) == "leatherface" ) then
		    setTimer( spawn_leatherface, 600000, 1 )	
	--	elseif ( getElementData( source, "Misterix" ) == "pigsy" ) then
    --	    setTimer( spawn_pigsy, 600000, 1 )	
		elseif ( getElementData( source, "Misterix" ) == "Yeti" ) then
		    setTimer( spawn_yeti, 600000, 1 )
        elseif ( getElementData( source, "Misterix" ) == "marselo" ) then
            setTimer( spawn_marselo, 600000, 1 )
        elseif ( getElementData( source, "Misterix" ) == "shrek" ) then
            setTimer( spawn_shrek, 600000, 1 )   
        elseif ( getElementData( source, "Misterix" ) == "pancho" ) then
            setTimer( spawn_pancho, 600000, 1 ) 
        elseif ( getElementData( source, "Misterix" ) == "chupacabras" ) then
            setTimer( spawn_chupacabras, 600000, 1 )  
        elseif ( getElementData( source, "Misterix" ) == "pinochet" ) then
            setTimer( spawn_pinochet, 600000, 1 )      
        elseif ( getElementData( source, "Misterix" ) == "salfate" ) then
            setTimer( spawn_salfate, 3000, 1 ) 
	    end
    end
)