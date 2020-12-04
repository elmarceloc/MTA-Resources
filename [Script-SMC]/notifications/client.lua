-- 
--  DX NOTIFICATIONS 
-- 
local swidth,sheight = guiGetScreenSize()
local notificationQueue = {} 
local drawNotifications 
  
  
addEvent('notification',true)
addEventHandler('notification',root,createNotification)  
function createNotification(id, message, submessage,duration,bgColor2) 
    if notificationQueue[id] then 
        destroyNotification(id) 
    end 
     

    local chrs = string.len( message )

    if chrs*10 < 300 then
        width = 300
    else
        width = chrs*10
    end

    height = 140

    x = (swidth/2)-width/2
    y = 20
    
    if type(submessage) ~= "string" then 
        submessage = ''
    end 
    if type(font) ~= "string" then 
        font = 'arial'
    end 
    if type(scale) ~= "number" then 
        scale = 1.5
    end 
    if type(scale2) ~= "number" then 
        scale2 = 1.25
    end 
    if type(textColor) ~= "table" then 
        textColor = {255,255,255}
    end 
    if type(bgColor) ~= "table" then 
        bgColor = {0,0,0,85}
    end 
    if type(bgColor2) ~= "table" then 
        bgColor2 = {42,93,132}
    end 
    if type(duration) ~= "number" then 
        duration = 1000
    end 
    if not showTicks then 
        showTicks = 4000
    end 
    showTicks = duration

     
    local newNotification = {} 
    newNotification.message = message
    newNotification.submessage = submessage 
    newNotification.x = x 
    newNotification.y = y 
    newNotification.width = width
    newNotification.height = height 
    newNotification.font = font 
    newNotification.scale = scale 
    newNotification.scale2 = scale2
    newNotification.textColor = textColor 
    newNotification.bgColor = bgColor 
    newNotification.bgColor2 = bgColor2 
    newNotification.showTicks = showTicks 
    newNotification.shownTicks = 0 
    newNotification.lastAlpha = 0 
    newNotification.duration = duration

    if #notificationQueue == 0 then 
        addEventHandler("onClientRender", root, drawNotifications) 
    end 
    notificationQueue[id] = newNotification 
end 
  
function destroyNotification(id) 
    if notificationQueue[id] then 
        notificationQueue[id] = nil 
     
        if #notificationQueue == 0 then 
            removeEventHandler("onClientRender", root, drawNotifications) 
        end 
    end 
end 
  
--[[local]] function drawNotifications() 
    --[[if not isLocalPlayerLoggedIn(localPlayer) then 
        return 
    end]] 
     
    for id, notification in pairs(notificationQueue) do 
        local shownTicks, lastAlpha = notification.shownTicks, notification.lastAlpha 
        local bgColor, bgColor2, textColor = notification.bgColor,notification.bgColor2, notification.textColor 
         
        -- If the nofication is still new or fading in 
        if shownTicks == 0 then 
            if lastAlpha < 200 then 
                lastAlpha = lastAlpha + 6 
                if lastAlpha > 200 then 
                    lastAlpha = 200
                end 
                 
                bgColor[4] = lastAlpha 
                bgColor2[4] = lastAlpha 
                textColor[4] = lastAlpha 
                notification.lastAlpha = lastAlpha 
            else 
                notification.firstTick = getTickCount() 
                notification.shownTicks = 1 
            end 
        elseif shownTicks >= notification.showTicks then -- Fade out or delete old notifications 
            if lastAlpha > 0 then 
                lastAlpha = lastAlpha - 6 
                if lastAlpha < 0 then 
                    lastAlpha = 0 
                end 
                 
                notification.lastAlpha = lastAlpha 
                bgColor[4] = lastAlpha 
                bgColor2[4] = lastAlpha 
                textColor[4] = lastAlpha 
            else 
                destroyNotification(id) 
            end 
        else -- Buisness as usual 
            notification.shownTicks = getTickCount() - notification.firstTick 
        end 
         
        dxDrawRectangle(notification.x, notification.y, notification.width, notification.height, tocolor(unpack(bgColor))) 
        dxDrawRectangle(notification.x, notification.y, notification.width, notification.height/4, tocolor(unpack(bgColor2))) 
        dxDrawText(notification.message, notification.x, notification.y-100, notification.x + notification.width, notification.y + notification.height, tocolor(unpack(textColor)), notification.scale, notification.font, "center", "center") 
        dxDrawText(notification.submessage, notification.x+10, notification.y+40, notification.x + notification.width, notification.y + notification.height, tocolor(unpack(textColor)), notification.scale2, notification.font, "left", "top",false,true) 

    end 
end