--MODELS REPLACE / REEMPLAZO DE MODELOS

local skins = { 

    { "bigfoot", 210 },
    { "jason", 112 }, 
    { "leatherface", 118 }, 
    { "pigsy", 241 }, 
    { "yeti", 230 }, 
    { "marselo", 67 }, 
    { "shrek", 61 }, 
    { "pancho", 36 }, 
    { "chupacabras", 49 }, 
    { "pinochet", 58 }, 
    { "salfate", 48}, 
}

function replaceModel()
    for k,v in ipairs(skins) do
    txd = engineLoadTXD("files/"..v[1]..".txd", v[2] )
    engineImportTXD(txd, v[2])
    dff = engineLoadDFF("files/"..v[1]..".dff", v[2] )
    engineReplaceModel(dff, v[2])
    end
end
addEventHandler ( "onClientResourceStart", getResourceRootElement(getThisResource()), replaceModel)

--MYSTERIES SKILLS

function takeElementHealth( element, numb )
    if not numb then
	    return false
	end	
    local health = getElementHealth(element)
	if health then
        setElementHealth( element, health-numb )	
	end
end

function mysteriesStrength( attacker, weapon )
    if attacker then
        if getElementType(attacker) == "ped" then
            if isPedAMystery(attacker,"jason") then
                takeElementHealth( source, 10 )
          --  elseif isPedAMystery(attacker,"bigfoot") then
          --      takeElementHealth( source, 15 )
            elseif isPedAMystery(attacker,"yeti") then
                takeElementHealth( source, 10 )
           -- elseif isPedAMystery(attacker,"pigsy") then
           --     takeElementHealth( source, 10 )
            elseif isPedAMystery(attacker,"leatherface") then
                takeElementHealth( source, 10 )
            elseif isPedAMystery(attacker,"marselo") then
                takeElementHealth( source, 100 )
            elseif isPedAMystery(attacker,"shrek") then
                takeElementHealth( source, 100 )    
            elseif isPedAMystery(attacker,"pancho") then
                takeElementHealth( source, 50 )    
            elseif isPedAMystery(attacker,"chupacabras") then
                takeElementHealth( source, 50 )   		
            elseif isPedAMystery(attacker,"pinochet") then
                takeElementHealth( source, 50 )    		
            elseif isPedAMystery(attacker,"salfate") then
                takeElementHealth( source, 300 )    		
			end
        end		
	end
end
addEventHandler("onClientPlayerDamage", root, mysteriesStrength )