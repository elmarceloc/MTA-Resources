-- Letras 3D

cajeros = {
    {x = 393.76941, y = -2051.43726, z = 7.83594}, -- Playa
    {x = 1015.01062, y = -1304.73901, z = 13.54688}, -- AFP
    {x = 2137.23877, y = -1908.13428, z = 13.37671}, -- Mecanico
    {x = 1834.30432, y = -1833.10510, z = 13.57813}, -- 24/7 Lider
    {x = 1553.01489, y = -1651.13684, z = 13.55784}, -- Paco ls
    {x = 1185.08081, y = -900.66602, z = 43.17532}, -- BK
    {x = 826.84845, y = -1347.14380, z = 13.53798}, -- metro 2
    {x = 2505.95679, y = -1756.45313, z = 13.45354}, -- grove
    {x = 1807.15222, y = -2333.99219, z = -2.65068} -- aeropuerto
}

texts = {}

function text3d() 
    local maxdistance = 10
    x,y,z= getElementRotation(getLocalPlayer())

    for i,cajero in ipairs(cajeros) do -- por cada cajero

        local x2, y2, z2 = getElementPosition(localPlayer)


        if (getDistanceBetweenPoints3D(cajero['x'], cajero['y'], cajero['z'], x2, y2, z2)) < maxdistance then 
            local coords = {getScreenFromWorldPosition(cajero['x'], cajero['y'], cajero['z'] +1.2)}
            if coords[1] and coords[2] then
                if texts[i] then
                    dxDrawText("#FFFFFFPresiona #FF7F00'K' #FFFFFFPara robar", coords[1], coords[2], coords[1], coords[2], tocolor(255,255,255,255), 2.00, "default-bold", "center", "center", true, false, false, true, false)
                end
            end
        end

    end

end

addEventHandler("onClientRender", root,text3d)

addEvent("ontext", true)
addEventHandler("ontext", root,function(id)
    texts[id] = true
    addEventHandler ("onClientRender", root, text3d)
end 
)

addEvent("offtext", true)
addEventHandler("offtext", root,function(id)
    texts[id] = false
    removeEventHandler ("onClientRender", root, text3d)
end 
)

addEvent("update", true)
addEventHandler("update", root,function(id, state)
    if state then
        texts[id] = true
        addEventHandler ("onClientRender", root, text3d)
    else
        texts[id] = false
        removeEventHandler ("onClientRender", root, text3d)
    end
end 
)

-- SONIDO
addEvent('onSound', true)
addEventHandler('onSound', root, function(x,y,z)
    local sound = playSound3D('song/alarm.wav', x, y, z, false)
    setSoundVolume(sound, 0.5) -- para que no suene tan fuerte, ahi lo vas ajustando1
    setSoundMinDistance(sound, 17)
    setSoundMaxDistance(sound, 100)
end
)



-- Humo
function humoexplo(x, y, z)
    -- se podrian poner artos humos igual
    -- prueba estos igual   WS_factorysmoke    vent   smoke30m   smoke50lit
    humo = createEffect('smoke30m', x, y, z ) -- ve probando los humos de aca https://wiki.multitheftauto.com/wiki/Element/Effect
end
addEvent('onSmoke', true)
addEventHandler("onSmoke", root, humoexplo)

-- quitarhumo
function quitarhumo()
    destroyElement( humo )
end
addEvent('offSmoke', true)
addEventHandler("offSmoke", root, quitarhumo)


addEvent('notificacioncajero',true)
addEventHandler('notificacioncajero',root,function(titulo, menssage)
    exports.notifications.createNotification(1,'',titulo,menssage,5000,{255,127,0})
end
)