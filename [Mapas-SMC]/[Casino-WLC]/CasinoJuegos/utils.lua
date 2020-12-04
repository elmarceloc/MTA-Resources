local font = dxCreateFont("assets/fonts/gotham-medium.ttf", 10)

function dxDrawButton(x, y, w, h, text)
    dxDrawRectangle(x, y, w, h, tocolor(10, 31, 31, 255))
    dxDrawRectangle(x+2, y+2, w-4, h-4, tocolor(10, 41, 41, 255))
    dxDrawText(text, x*2, y*2, w, h, tocolor(255, 255, 255, 255), 1, font, "center", "center")
    if cursorPosition(x, y, w, h) then
        dxDrawShadow(x, y, w, h, 10, 41, 41, 100, 5, false)
    end
end

function dxDrawRecText(x, y, w, h, text)
    dxDrawRectangle(x, y, w, h, tocolor(10, 31, 31, 255))
    dxDrawRectangle(x+2, y+2, w-4, h-4, tocolor(10, 41, 41, 255))
    dxDrawText(text, x*2, y*2, w, h, tocolor(255, 255, 255, 255), 1, font, "center", "center")
end

edits = {
    selected = {},
    text = {},
    click = false,
}
function dxDrawEdit(x, y, w, h, text, ID)
    if not edits.text[ID] then
        edits.text[ID] = ""
    end
    local state = false
    for i,v in pairs(edits.selected) do
        if v == true then
            state = true
        end
        guiSetInputEnabled(state)
    end
    dxDrawRectangle(x, y, w, h, tocolor(10, 31, 31, 255))
    dxDrawRectangle(x+2, y+2, w-4, h-4, tocolor(255, 255, 255, 255))
    if edits.text[ID] ~= "" then
        dxDrawText(edits.text[ID], x*2, y*2, w, h, tocolor(35, 35, 35, 255), 1, font, "center", "center")
    else
        dxDrawText(text, x*2, y*2, w, h, tocolor(40, 40, 40, 100), 1, font, "center", "center")
    end
    if edits.selected[ID] then
        dxDrawShadow(x, y, w, h, 10, 41, 41, 255, 5, false)
    end
    if getKeyState("mouse1") then
        edits.click = true
        if cursorPosition(x, y, w, h) then
            edits.selected[ID] = true
        else
            edits.selected[ID] = false
        end
    else
        edits.click = false
    end
    return edits.text[ID]
end

function outputPressedCharacter(character)
    for i,v in pairs(edits.selected) do
        if v == true and string.len(edits.text[i]) < 9 then
            if (character >= "0" and character <= "9") then
                edits.text[i] = edits.text[i]..character
            end
        end
    end
end
addEventHandler("onClientCharacter", root, outputPressedCharacter)

function outputPressedKey(button, press)
    for i,v in pairs(edits.selected) do
        if v == true and button == "backspace" and press then
            edits.text[i] = utf8.sub(edits.text[i], 1, utf8.len(edits.text[i])-1)
        end
    end
end
addEventHandler("onClientKey", root, outputPressedKey)


function cursorPosition(x, y, w, h)
    if (not isCursorShowing()) then
        return false
    end
    local mx, my = getCursorPosition()
    local fullx, fully = guiGetScreenSize()
    cursorx, cursory = mx*fullx, my*fully
    if cursorx > x and cursorx < x + w and cursory > y and cursory < y + h then
        return true
    else
        return false
    end
end

function dxDrawShadow(x,y,w,h,r,g,b,a,radius,fill)
    if(radius > 0)then
        dxDrawGradient(x, y-radius, w,radius,r,g,b,a,true,false)
        dxDrawGradient(x-radius, y, radius,h,r,g,b,a,false,false)
        dxDrawGradient(x+w, y, radius,h,r,g,b,a,false,true)
        dxDrawGradient(x, y+h, w,radius,r,g,b,a,true,true)

        dxDrawCircle(x, y, radius, 180, 270, tocolor(r,g,b,0),tocolor(r,g,b,a), radius)
        dxDrawCircle(x+w, y+h, radius, 0, 90, tocolor(r,g,b,0),tocolor(r,g,b,a), radius)
        dxDrawCircle(x+w, y, radius, 270, 360, tocolor(r,g,b,0),tocolor(r,g,b,a), radius)
        dxDrawCircle(x, y+h, radius, 90, 180, tocolor(r,g,b,0),tocolor(r,g,b,a), radius)
    end
    if(fill and fill == true)then
        dxDrawRectangle(x+1,y+1,w-1,h-1, tocolor(r,g,b,a))
    end
end


function dxDrawGradient(x,y,w,h,r,g,b,a,vertical,inverce)
    if(vertical == true)then
        for i=0,h do
            if inverce == false then
                dxDrawRectangle(x, y+i, w, 1,tocolor(r,g,b,i/h*a or 255));
            else
                dxDrawRectangle(x, y+h-i, w, 1,tocolor(r,g,b,i/h*a or 255)); 
            end
        end
    else
        for i=0,w do
            if inverce == false then
                dxDrawRectangle(x+i, y, 1, h,tocolor(r,g,b,i/w*a or 255));
            else
                dxDrawRectangle(x+w-i, y, 1, h,tocolor(r,g,b,i/w*a or 255)); 
            end
        end
    end
end

function math.round(number, decimals, method)
    decimals = decimals or 0
    local factor = 10 ^ decimals
    if (method == "ceil" or method == "floor") then return math[method](number * factor) / factor
    else return tonumber(("%."..decimals.."f"):format(number)) end
end

function isEventHandlerAdded( sEventName, pElementAttachedTo, func )
     if type( sEventName ) == 'string' and isElement( pElementAttachedTo ) and type( func ) == 'function' then
          local aAttachedFunctions = getEventHandlers( sEventName, pElementAttachedTo )
          if type( aAttachedFunctions ) == 'table' and #aAttachedFunctions > 0 then
               for i, v in ipairs( aAttachedFunctions ) do
                    if v == func then
                     return true
                end
           end
      end
     end
     return false
end