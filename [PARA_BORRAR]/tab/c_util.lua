--[[

	Author: danibayez
	MTA Forum: https://goo.gl/QX0mcT

]]

screenW, screenH = guiGetScreenSize( )

function _getZoneName( x, y, z )
	if ( getElementDimension( localPlayer ) == 0 ) then
		local zoneName = getZoneName( x, y, z )
		return zoneName ~= "Unknow" and zoneName or "No localizado"
	end
end

function isCursorOnElement( posX, posY, width, height )
	if isCursorShowing( ) then
		local mouseX, mouseY = getCursorPosition( )
		local mouseX, mouseY = mouseX * screenW, mouseY * screenH
		if ( mouseX > posX and mouseX < ( posX + width ) and mouseY > posY and mouseY < ( posY + height ) ) then
			return true
		end
	end
	return false
end

function cursorY( )
	if isCursorShowing( ) then
		local _, mouseY = getCursorPosition( )
		return mouseY * screenH
	end
	return 0
end

function convertNumber( number )  
	local formatted = number  
	while true do      
		formatted, k = string.gsub( formatted, "^(-?%d+)(%d%d%d)", '%1.%2' )    
		if ( k==0 ) then      
			break   
		end  
	end  
	return formatted
end

function round(num) 
    if ( num >= 0 ) then return math.floor( num + .5 ) 
    else return math.ceil( num - .5 ) end
end

function dxDrawCorner( x, y, r, color, corner, postGUI )
	local corner = corner or 1
	local start = corner % 2 == 0 and 0 or -r
	local stop = corner % 2 == 0 and r or 0
	local m = corner > 2 and -1 or 1
	local h = ( corner == 1 or corner == 3 ) and -1 or 1
 	for yoff = start, stop do
 		local xoff = math.sqrt( r * r - yoff * yoff ) * m
 		dxDrawRectangle( x - xoff, y + yoff, xoff, h, color, postGUI )
	end 
end

function _dxDrawRectangle( posX, posY, width, height, radius, color, postGUI )	
	local posX, posY, width, height = round( posX ), round( posY ), round( width ), round( height )
	local radius = radius and math.min( radius, math.min( width, height ) / 2 )  or 12
	
	dxDrawRectangle( posX, posY + radius, width, height - radius * 2, color, postGUI )
	dxDrawRectangle( posX + radius, posY, width - 2 * radius, radius, color, postGUI )
	dxDrawRectangle( posX + radius, posY + height - radius, width - 2 * radius, radius, color, postGUI )
	
	dxDrawCorner( posX + radius, posY + radius, radius, color, 1, postGUI )
	dxDrawCorner( posX + radius, posY + height - radius, radius, color, 2, postGUI )
	dxDrawCorner( posX + width - radius, posY + radius, radius, color, 3, postGUI )
	dxDrawCorner( posX + width - radius, posY + height - radius, radius, color, 4, postGUI )
end