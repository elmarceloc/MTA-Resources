-- los items que van dentro de la rueda
emojis = {
    -- rueda emojis 1
    {
        {x = 207, y = 37}, 
        {x = 330, y = 90},
        {x = 380, y = 195},
        {x = 340, y = 315},
        {x = 204, y = 380},
        {x = 70, y = 315},
        {x = 35, y = 195},
        {x = 87, y = 84},
        {x = 256, y = 120}, 
        {x = 332, y = 156}, 
        {x = 363, y = 225}, 
        {x = 339, y = 300}, 
        {x = 256, y = 342}, 
        {x = 167, y = 300}, 
        {x = 148, y = 226}, 
        {x = 181, y = 153}, 
    },

}
animations = {
    -- rueda emojis 1
    {

    --  {x = 120, y = 85,type= "new", anim = "electro_shuffle2", duration = 4},

       -- {x = 364, y = 110,type= "normal", group = "ped", anim = "SHOT_partial", duration = 2},
        {x = 364, y = 110,type= "new", anim = "electro_shuffle2", duration = 99999},
        {x = 421, y = 300,type= "new", anim = "jazz_dance", duration = 99999},
        {x = 262, y = 526,type= "normal", group = "beach",anim = "parksit_m_loop", duration = 999},
        {x = 80, y = 302,type= "normal", group = "DANCING", anim = "dnce_M_c", duration = 4},
        {x = 148, y = 100,type= "normal", group = "scratching", anim = "scmid_l", duration = 4},
    },
    {
        {x = 364, y = 110,type= "new", anim = "never_gonna", duration = 99999},
        {x = 421, y = 300,type= "new", anim = "Disco", duration = 99999},
        {x = 262, y = 526,type= "new", anim = "", duration = 99999},
        {x = 80, y = 302,type= "new",  anim = "dream_feet", duration = 99999},
        {x = 148, y = 100,type= "new", anim = "twist", duration = 99999},
    },
    {
        {x = 364, y = 110,type= "new", anim = "", duration = 99999},
        {x = 421, y = 300,type= "new", anim = "", duration = 99999},
        {x = 262, y = 526,type= "new", anim = "", duration = 99999},
        {x = 80, y = 302,type= "new",  anim = "", duration = 99999},
        {x = 148, y = 100,type= "new", anim = "Robot", duration = 99999},
    },
    {
        {x = 364, y = 110,type= "new", anim = "baile_alegre1", duration = 99999},
        {x = 421, y = 300,type= "new", anim = "baile_ninja", duration = 99999},
        {x = 262, y = 526,type= "new", anim = "banana", duration = 99999},
        {x = 80, y = 302,type= "new",  anim = "cabeza", duration = 99999},
        {x = 148, y = 100,type= "new", anim = "alien", duration = 99999},
    },
    {
        {x = 364, y = 110,type= "new", anim = "dab", duration = 99999},
        {x = 421, y = 300,type= "new", anim = "firlandes", duration = 99999},
        {x = 262, y = 526,type= "new", anim = "floss", duration = 99999},
        {x = 80, y = 302,type= "new",  anim = "gorila", duration = 99999},
        {x = 148, y = 100,type= "new", anim = "cangrejo", duration = 99999},
    },
    {
        {x = 364, y = 110,type= "new", anim = "guitarra", duration = 99999},
        {x = 421, y = 300,type= "new", anim = "nalgazo", duration = 99999},
        {x = 262, y = 526,type= "new", anim = "paso_feliz", duration = 99999},
        {x = 80, y = 302,type= "new",  anim = "starlord", duration = 99999},
        {x = 148, y = 100,type= "new", anim = "gracias", duration = 99999},
    },

}




screenWhidth, screenHeight = guiGetScreenSize()
width, height = 512,512
type = ''
img = ''
wheel_num = 0
state = false
doinganim = false

function clickitem(button, state, x, y)

    if state == 'down' then

        removeEventHandler('onClientRender',root,renderwheel) -- quitamos la wheel
        removeEventHandler('onClientClick',root,clickitem) -- quitamos la wheel
        showCursor(false)

        if type == 'emoji' then
            doaction(emojis,x,y)
        elseif type == 'animation' then
            doaction(animations,x,y)
        end

    end

end


-- al apretar alguna tecla
addEventHandler("onClientKey",root,function(btn,press)
    if not isChatBoxInputActive() then 
    if press == false then return end        
    
        -- panel de emojis
        if btn == "2" then
            type = 'emoji'
            folder = 1

            init(btn)
        elseif btn == "3" then
            type = 'animation'
            folder = 1
            init(btn)
        elseif btn == "4" then
            type = 'animation'
            folder = 3
            init(btn)
        elseif btn == "5" then
            type = 'animation'
            folder = 4
            init(btn)
        elseif btn == "6" then
            type = 'animation'
            folder = 5
            init(btn)
        elseif btn == "7" then
            type = 'animation'
            folder = 6
            init(btn)
        elseif btn == "8" then
            folder = 2
            vip(btn)
        elseif btn == "lshift" or btn == "mouse1" or btn == "w" or btn == "s" or btn == "a" or btn == "d" then
            if isChatBoxInputActive() then return end
            if doinganim == true then
                if isElement(sound) then stopSound(sound) end
                triggerServerEvent('emojiSystem:stopsound',root,localPlayer)
                doinganim = false
            end 
        end


    end
end
)

function vip(btn)
    triggerServerEvent("emojiSystem:checkvip",localPlayer,btn) 
end
addEvent('emojiSystem:dovip',true)
addEventHandler('emojiSystem:dovip',root,
function(btn)
    type = 'animation'
    init(btn)
end
)

function doaction(wheels,x,y)


    for i, wheel in pairs(wheels) do
        repeat
        
        if i ~= folder then 
            do break end
        end


        local minDif = 10000

        local closest;
        local index;

        for j, item in pairs(wheel) do
            -- calculamos la distancia con el teorema de pitagoras
            local distance = math.sqrt( math.pow( item['x'] +20 +  screenWhidth/2 - width/2 - x , 2) +  math.pow( item['y'] +20 + screenHeight/2 - height/2 - y , 2)  )

            if distance < minDif then
                closest = item;
                index = j;
                minDif = distance;
            end

        end

        if type == 'emoji' then

            triggerServerEvent("emojiSystem:sendEmojiToServer",localPlayer,"emojis/".. folder .. '/' .. index ..".png") 
            
        elseif type == 'animation' then    

            doinganim = true

            if img == "4"  then
                triggerServerEvent('emojiSystem:sound',root,'4/'..index,localPlayer)
            end
            if img == "6"  then
                triggerServerEvent('emojiSystem:sound',root,'6/'..index,localPlayer)
            end
            if img == "7"  then
                triggerServerEvent('emojiSystem:sound',root,'7/'..index,localPlayer)
            end
            if img == "8"  then
                triggerServerEvent('emojiSystem:sound',root,'8/'..index,localPlayer)
            end
            if closest['type'] == 'normal' then
                triggerServerEvent('animation',root,localPlayer,closest['group'],closest['anim'],closest['duration'])
            elseif closest['type'] == 'new' then
                triggerServerEvent('newanimation',root,localPlayer,closest['anim'],closest['duration'])
            end
        end



        until true


    end
end
function init(btn)
    if isMTAWindowActive() then return end
    img = btn
    showCursor(true)
    setCursorPosition (screenWhidth/2, screenHeight/2) --set the cursor position to the center of the screen
    addEventHandler('onClientRender',root,renderwheel) -- mostramos la wheel
    addEventHandler('onClientClick',root,clickitem)

end

-- esto corre cada fotograma, sirve para mostrar imagenes por ejemplo
function renderwheel()
     -- x, y , anchura, altura,  imagen
    dxDrawImage(screenWhidth/2 - width/2 ,screenHeight/2 - height/2, width, height, img..'.png') 
end