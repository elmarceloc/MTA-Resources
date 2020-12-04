walls = {}

addEvent('createWall',true)
addEventHandler('createWall',root,
    function ( wx,wy,wz,aproxRot )
        --local wx,wy,wz,aproxRot,canPut = wallPosition()

        if wz > 100 then return end

        local wall = createObject(1219,wx, wy, wz, 90, aproxRot*90,90)

        table.insert(walls, wall)
        
        setElementData(wall, 'hp', 10)
        --setObjectBreakable(wall, false)
        setElementFrozen(wall, true)
        setElementDimension(wall, 2)
        
        setElementAlpha(wall, 150)

        triggerClientEvent(root,'toggleBreak',wall)
        --setElementCollisionsEnabled(wall, false)

    --    local sound = playSound3D('construct.mp3', wx, wy, wz)  que lo pleyeee en el cliente local mejors

    --    sounds[wall] = sound

    --  setSoundVolume(sound,0.2)
    --  setElementDimension(sound,2)

        setTimer(function(theWall)
            if isElement(theWall) then
                local hp = getElementData(theWall, 'hp')
                setElementData(theWall, 'hp', hp + 10)
            end
        end,500,9,wall)

        setTimer(function(theWall)
            if isElement(theWall) then

                setElementAlpha(theWall, 255)
                --setElementCollisionsEnabled(wall, true)
            end
        end,5000,1,wall)

    --  showCursor(false)


    --createPickup(worldX, worldY, worldZ, 3,1219)
    end
)

addEvent('destroyWall',true)
addEventHandler('destroyWall',root,
    function (wall )
        destroyElement(wall)
        -- todo: borrar del array,sino cambiar a object,etc
    end
)

-- todo: borrar todos los walls y los objetos que tienen hp mejor