shader = dxCreateShader("shader.fx")
bluePlank = dxCreateTexture( "texture.png")
redPlank = dxCreateTexture( "texture2.png")

sounds = {}


maxdistance = 5
size = 2.5

function minigamenotification(title,mensaje)
    exports.notifications:createNotification(1,title,mensaje,5000,{255,0,0})
    
end
addEvent( "minigamenotification", true )
addEventHandler( "minigamenotification", getRootElement(), minigamenotification)


function notificationcolor(title,mensaje, color)
    exports.notifications:createNotification(1,title,mensaje,5000,color)

end
addEvent( "notificationcolor", true )
addEventHandler( "notificationcolor", getRootElement(), notificationcolor)

function soundtrack(file)
    soundtrackElement = playSound(file,true)
    setSoundVolume(soundtrackElement,0.2)
end
addEvent( "soundtrack", true )
addEventHandler( "soundtrack", getRootElement(), soundtrack)



function muteSoundtrack()
    stopSound(soundtrackElement)
end
addEvent( "muteSoundtrack", true )
addEventHandler( "muteSoundtrack", getRootElement(), muteSoundtrack)

function getPositionInfrontOfElement(element, meters)
    if (not element or not isElement(element)) then return false end
    local meters = (type(meters) == "number" and meters) or 3
    local posX, posY, posZ = getElementPosition(element)
    local _, _, rotation = getElementRotation(element)
    posX = posX - math.sin(math.rad(rotation)) * meters
    posY = posY + math.cos(math.rad(rotation)) * meters
    rot = rotation + math.cos(math.rad(rotation))
    return posX, posY, posZ , rot
end



function wallPosition()
    if getElementDimension(localPlayer) ~= 2 then return end

    if not isCursorShowing() then return end


    local px,py,pz = getElementPosition(localPlayer)
    local rx,ry,rz = getElementRotation(localPlayer)
    
    local screenx, screeny, x, y, z = getCursorPosition()


    local cx,cy,cz,lx,ly,lz,r,f = getCameraMatrix()
    

    
    local hit,tx,ty,tz,obj = processLineOfSight(cx,cy,cz,x,y,z,true,true,false,true,true,true,true,true)
    
    if hit then

        local X,Y,Z = getElementPosition(obj)
        local distance = getDistanceBetweenPoints3D(px,py,pz,tx,ty,tz)

        if distance < maxdistance then
            x = tx
            y = ty
            if isElement(obj) and getElementModel(obj) == 1219 then
                z = math.floor( (tz-(Z+size/2))/size )*size+(Z+size/2)
            else
                z = getGroundPosition(px,py,pz)
                --z = tz
            end
        end

    end
    -- outputChatBox(z)
    --outputChatBox(x)

    --local x,y,z = getPositionInfrontOfElement(localPlayer, 2.5)
    --local cx,cy,cz,x,y,z,r,f = getCameraMatrix(locaPlayer)

    local rot = 0

    local xs = math.floor((x-size/2)/size)*size + size
    local ys = math.floor((y-size/2)/size)*size + size

    local xs1 = xs - size/2
    local ys1 = ys

    local xs2 = xs  + size/2
    local ys2 = ys
    
    local xs3 = xs 
    local ys3 = ys - size/2
    
    local xs4 = xs
    local ys4 = ys + size/2
    
    
    local d1 = getDistanceBetweenPoints2D(xs1, ys1 , x, y)
    local d2 = getDistanceBetweenPoints2D(xs2, ys2 , x, y)
    local d3 = getDistanceBetweenPoints2D(xs3, ys3 , x, y)
    local d4 = getDistanceBetweenPoints2D(xs4, ys4 , x, y)

    local mindistance = math.min( d1,d2,d3,d4 )
    
    local offsetX = 0
    local offsetY = 0
    
    if d1 == mindistance then
        offsetX = offsetX - size/2 
        rot = 0
        xs = xs - size/2
    elseif d2 == mindistance then
        offsetX = offsetX + size/2 
        rot = 0
        xs = xs + size/2
    elseif d3 == mindistance then
        offsetX = offsetY - size/2 
        rot = 1
        ys = ys - size/2
    elseif d4 == mindistance then
        offsetX = offsetY + size/2 
        rot = 1
        ys = ys + size/2
    end

    local wz = z + size/2

    local canPut = false

    if isLineOfSightClear(px,py,pz,x,y,z, true,true,false,true,true,true,true,nil) then 
        canPut = true
    end


    return xs,ys,wz,rot,canPut
end


function preview()
    if not isCursorShowing() then return end

    local px,py,pz = getElementPosition(localPlayer)
    local rx,ry,rz = getElementRotation(localPlayer)
    local screenx, screeny, x, y, z = getCursorPosition()

    pwx,pwy,pwz,paproxRot,pcanPut = wallPosition()

--[[

    if pcanPut then
        --setElementModel(wall,1219)
        engineApplyShaderToWorldTexture(shader, "planks01")
        dxSetShaderValue (shader, "gTexture", bluePlank)
    else
        --setElementModel(wall,1001)
        engineApplyShaderToWorldTexture(shader, "planks01")
        dxSetShaderValue (shader, "gTexture", redPlank)
    end
--]]

    if isElement(wall) then
        setElementPosition(wall,pwx,pwy,pwz)
        setElementRotation(wall,90,paproxRot*90,90)
    end

end


function showWall(player, key, keyState)

    if isElement(wall) and not getElementDimension(localPlayer) ~= 2 or getElementData(localPlayer,'walls') <= 0  then return end
    
    showCursor(true,false)
    
    addEventHandler('onClientRender',root,preview)
    
    setTimer(function()
        wall = createObject(1219,0, 0, 0, 90,0,90)
        setElementDimension(wall, 2)
        setElementCollisionsEnabled(wall, false)
        
        setElementAlpha(wall, 170)
        

        engineApplyShaderToWorldTexture(shader, "planks01")
        dxSetShaderValue (shader, "gTexture", explosionTexture)
    end,100,1)

end




function onClientPlayerWeaponFireFunc(weapon, ammo, ammoInClip, hitX, hitY, hitZ, hitElement)
    if getElementDimension(localPlayer) ~= 2 then return end

    for i,wall in ipairs (getElementsByType("object")) do
        if getElementData(wall,'hp') ~= false then

            if wall == hitElement then
                local health = getElementData(wall, 'hp')
                local x,y,z = getElementPosition(wall)
                local rx,ry,rz = getElementRotation(wall)
                local damage = 10

                if weapon == 24 then
                    damage = 40
                elseif weapon == 23 then
                    damage = 18
                elseif weapon == 22 then
                    damage = 18
                elseif weapon == 25 then
                    damage = 100
                elseif weapon == 26 then
                    damage = 100
                elseif weapon == 27 then
                    damage = 80
                elseif weapon == 28 then
                    damage = 10
                elseif weapon == 29 then
                    damage = 20
                elseif weapon == 32 then
                    damage = 10
                elseif weapon == 30 then
                    damage = 50
                elseif weapon == 31 then
                    damage = 27
                end


                if health - 10 <= 0 then
                    local newWall = createObject(1219, x, y, z, rx, ry, rz )
        
                    setElementAlpha(newWall, getElementAlpha(wall))
                    setElementFrozen(newWall, true)
                    setElementDimension(newWall, 2)
                    triggerServerEvent('destroyWall',root,wall)
                    --   stopSound(sounds[wall])
                else
                    setElementData(wall,'hp',health - damage )
                end
            end


        end
    end
end

function playerPressedKey(button, press)
   -- if getElementDimension(localPlayer) ~= 2 then return end

    
    if button == "mouse1" and press and isElement(wall) then

        local walls = getElementData(localPlayer,'walls')

        if walls > 0 then

            cancelEvent()
            removeEventHandler('onClientRender',root,preview)

        --  createWall()
            local xs, ys, wz, rot, canPut = wallPosition()
            showCursor(false)
        --   if canPut then
                triggerServerEvent('createWall',root, xs, ys, wz, rot)
          -- end

            destroyElement(wall)

            setElementData(localPlayer,'walls',walls - 1)

        end

    end
end


function toggleBreak()
	if isObjectBreakable(source) then
		setObjectBreakable(source, false)
	else
		setObjectBreakable(source, true)
	end
end
addEvent('toggleBreak',true)
addEventHandler("toggleBreak", root, toggleBreak)

wood = getElementData(localPlayer,'walls')

function updateHuds()

    wood = getElementData(localPlayer,'walls')

end

addEvent('toggleBR',true)
addEventHandler('toggleBR',root,function(bool)
    if bool then
        bindKey ("1", "up", showWall )     -- bind the q

        addEventHandler("onClientKey", root, playerPressedKey)
        addEventHandler("onClientPlayerWeaponFire", root, onClientPlayerWeaponFireFunc)

        hudsTimer = setTimer(updateHuds,200,0)

    else

        unbindKey ("1", "up", showWall )     -- unbind the q

        removeEventHandler("onClientKey", root, playerPressedKey)
        removeEventHandler("onClientPlayerWeaponFire", root, onClientPlayerWeaponFireFunc)
        removeEventHandler('onClientRender',root,preview)

        showCursor(false)

        if isTimer(hudsTimer) then killTimer(hudsTimer) end
    end
end
)