------------------------
-----Panel Ortalama-----
------------------------
sC,sD = guiGetScreenSize()
C,D = 430,340
A = (sC/2) - (C/2)
B = (sD/2.5) - (D/2)
---------------
-----Panel-----
---------------
panel = guiCreateStaticImage(A, B, C, D, "img/bg.png", false)
guiSetVisible(panel,false)

blue = guiCreateStaticImage(0, 0, C, 25, "img/blue.png", false, panel)

function drawlogo()
    dxDrawImage(A+C/2-150/2, B-20, 150, 75, "img/logo.png",0,0,0,tocolor(255,255,255,255),true)
end

---------------------------
-----vechicles list-----
---------------------------
vehicles_list_label = guiCreateLabel(70, 50, 178, 16, "Vehiculos VIP", false, panel)
guiSetFont(vehicles_list_label, "default-bold-small")

skins_list_label = guiCreateLabel(300, 50, 178, 16, "Skins VIP", false, panel)
guiSetFont(skins_list_label, "default-bold-small")

--------------------------------
-----vechicles list Gridlist-----
--------------------------------
vehicle_gridlist = guiCreateStaticImage(20, 70, 178, 145, "img/bg.png", false, panel)
skins_gridlist = guiCreateStaticImage(230, 70, 178, 145, "img/bg.png", false, panel)

vehicles_list = guiCreateGridList(-5, -24.5, 230, 188, false, vehicle_gridlist)
skins_list = guiCreateGridList(-5, -24.5, 230, 188, false, skins_gridlist)

guiGridListSetSortingEnabled(vehicles_list, false)
guiGridListSetSortingEnabled(skins_list, false)

guiGridListAddColumn(vehicles_list, "Vehiculo", 0.9)
for i = 1, 6 do
    guiGridListAddRow(vehicles_list)
end

guiGridListAddColumn(skins_list, "Skin", 0.9)
for i = 1, 6 do
    guiGridListAddRow(skins_list)
end

----------------------
-----Jetpack----------
----------------------

jetpack_buton = guiCreateStaticImage(20, 260, 390, 25, "img/orange.png", false, panel)
jetpack_label = guiCreateLabel(160, 5, 110, 25, "Usar Globo", false, jetpack_buton)
guiSetFont(jetpack_label, "default-bold-small")
guiLabelSetColor(jetpack_label, 255, 255, 255)

-----------------------
-----Reload Weapons----
-----------------------


reload_buton = guiCreateStaticImage(20, 300, 180, 25, "img/orange.png", false, panel)
reload_label = guiCreateLabel(40, 5, 110, 25, "Recargar Armas", false, reload_buton)
guiSetFont(reload_label, "default-bold-small")
guiLabelSetColor(reload_label, 255, 255, 255)



rocket_buton = guiCreateStaticImage(230, 300, 180, 25, "img/orange.png", false, panel)
rocket_label = guiCreateLabel(25, 5, 150, 25, "Recargar Lansacohetes", false, rocket_buton)
guiSetFont(rocket_label, "default-bold-small")
guiLabelSetColor(rocket_label, 255, 255, 255)


----------------------
-----Give vehicle-----
----------------------

vehicle_buton = guiCreateStaticImage(20, 220, 178, 25, "img/blue.png", false, panel)
vehicle_label = guiCreateLabel(57, 5, 110, 25, "Usar vehiculo", false, vehicle_buton)
guiSetFont(vehicle_label, "default-bold-small")
guiLabelSetColor(vehicle_label, 255, 255, 255)

----------------------
-----Give Skin-----
----------------------

skin_buton = guiCreateStaticImage(230, 220, 178, 25, "img/blue.png", false, panel)
skin_label = guiCreateLabel(57, 5, 110, 25, "Usar skin", false, skin_buton)
guiSetFont(skin_label, "default-bold-small")
guiLabelSetColor(skin_label, 255, 255, 255)

----------------------
-----Panel close-----
----------------------
close_label = guiCreateLabel(C-20, 5, 60, 24, "X", false, blue)
guiSetFont(close_label, "default-bold-small")
guiLabelSetColor(close_label, 255, 255, 255)

function close()
    if source == close_label then
        guiSetVisible(panel, false)
        guiSetVisible(logo, false)
        showCursor(false)
        removeEventHandler('onClientRender',root, drawlogo)

    end
end
addEventHandler("onClientGUIClick", root, close)


---------------------------
-- Jetpack toggle
---------------------------
function toggleJetPack()
    triggerServerEvent ("JetPack_event", localPlayer)
end

bindKey('j', 'down', toggleJetPack)

addCommandHandler('jetpack', toggleJetPack)
addCommandHandler('jp', toggleJetPack)

---------------------
-----Buton Alpha-----
---------------------
addEventHandler ("onClientMouseEnter", root,
    function ()
        if source == vehicle_label then
            guiSetAlpha(vehicle_label, 0.5)
        else
        if source == skin_label then
            guiSetAlpha(skin_label, 0.5)
        else
        if source == close_label then
            guiSetAlpha(close_label, 0.5)
        else
        if source == jetpack_label then
            guiSetAlpha(jetpack_label, 0.5)
        else
        if source == reload_label then
            guiSetAlpha(reload_label, 0.5)
        else
        if source == rocket_label then
            guiSetAlpha(rocket_label, 0.5)
        end
        end
        end
        end
        end
        end
end)

addEventHandler ("onClientMouseLeave", root,
    function ()
        if source == vehicle_label then
            guiSetAlpha(vehicle_label, 1)
        else
        if source == skin_label then
            guiSetAlpha(skin_label, 1)
        else
        if source == close_label then
            guiSetAlpha(close_label, 1)
        else
        if source == jetpack_label then
            guiSetAlpha(jetpack_label, 1)
        else
        if source == reload_label then
            guiSetAlpha(reload_label, 1)
        else
        if source == rocket_label then
            guiSetAlpha(rocket_label, 1)
        end
        end
        end
        end
        end
    end
end)
----------------------
-----Functions-----
----------------------

local jetpacktoggle = false

local vehicles = {{'Formula 1'},{'Hydra'},{'Tanque'},{'Lamborghini Monster Truck'},{'Baño'}}
local skins = {{'Skips (Regular Show)'},{'Don Asomao'},{'El Banana'},{'Doritos'},{'Sanic'},{'Taringa +10'}}




addEventHandler("onClientGUIClick",root,function()

    if source == jetpack_label then

        if isPedInVehicle(localPlayer) == true then
            outputChatBox("El Globo no se puede usar cuando estas en un vehiculo.", 255, 0, 0, true)
        end
        if isPedInVehicle(localPlayer) == false then
            if jetpacktoggle == true then
                triggerServerEvent ("JetPack_event", localPlayer)
                jetpacktoggle = false
            else
                triggerServerEvent ("JetPack_event", localPlayer)
                jetpacktoggle = true
            end
        end
    end

    if source == skin_label then
        if (guiGridListGetSelectedItem (skins_list)) then
            local itemName = guiGridListGetItemText (skins_list, guiGridListGetSelectedItem (skins_list), 1)

            if itemName == 'Skips (Regular Show)' then
                itemID = 177
            elseif itemName == 'Don Asomao' then
                itemID = 160   
            elseif itemName == 'El Banana' then
                itemID = 161     
            elseif itemName == 'Doritos' then
                itemID = 170  
            elseif itemName == 'Sanic' then
                itemID = 171  
            elseif itemName == 'Taringa +10' then
                itemID = 176  
            end
            triggerServerEvent ("setskin", getLocalPlayer(), itemID)
        end
    end

    if source == vehicle_label then
        
        if (guiGridListGetSelectedItem (vehicles_list)) then
            local itemName = guiGridListGetItemText (vehicles_list, guiGridListGetSelectedItem (vehicles_list), 1)

            if itemName == 'Formula 1' then
                itemID = 494
            elseif itemName == 'Hydra' then
                itemID = 520
            elseif itemName == 'Tanque' then
                itemID = 432
            elseif itemName == 'Baño' then
                itemID = 583
            elseif itemName == 'Lamborghini Monster Truck' then
                itemID = 556
            end

            triggerServerEvent ("give_vehicle", getLocalPlayer(), itemID)
        end
    end

    if source == reload_label then
        triggerServerEvent ("setweapons", localPlayer)
    end

    if source == rocket_label then
        triggerServerEvent ("rocket", localPlayer)
    end
end)

for i,v in ipairs (vehicles) do
    local itemName = v[1]
    local row = guiGridListAddRow(vehicles_list)
    guiGridListSetItemText(vehicles_list, row, 1, itemName, false, true)
end

for i,v in ipairs (skins) do
    local itemName = v[1]
    local row = guiGridListAddRow(skins_list)
    guiGridListSetItemText(skins_list, row, 1, itemName, false, true)
end

function VipPanel()
    if guiGetVisible(panel) then
        guiSetVisible(panel, false)
        showCursor(false)
        removeEventHandler('onClientRender',root, drawlogo)
    else
        guiSetVisible(panel, true)
        guiSetVisible(logo, true)
        showCursor(true)
        addEventHandler('onClientRender',root, drawlogo)
    end	    
end
addEvent( "togglepanel", true )
addEventHandler( "togglepanel", getRootElement(), VipPanel)

function notification(status,msj)
    if status == 'bad' then
        exports.notifications.createNotification(1,'','VIP',msj,10000,{255,0,0})
    elseif status == 'good' then
        exports.notifications.createNotification(1,'','VIP',msj,10000,{0,255,0})
    end
end
addEvent( "onVipNotification", true )
addEventHandler( "onVipNotification", getRootElement(), notification)