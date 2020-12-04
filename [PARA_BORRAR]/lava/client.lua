local tickEntroLava = getTickCount() -- Milisegundo en el que se entró a la lava
local onLava = false -- Si esta en la lava
local lavaElement = nil -- Elemento de la lava
local sonidoLava = nil -- Sonido de la lava
local texturaPuesta = false -- Si la textura de la lava ya fue colocada

function onRender() -- Una vez iniciado el evento vía server, el cliente revisa en cada frame:
	if getElementDimension(localPlayer) == 0 and getElementInterior(localPlayer) == 0 then -- Si estás en dim 0 e int 0 entonces =>
		if isElementInWater(localPlayer) then -- Si estas en la lava
			if not onLava then -- Y marca como que no estas en la lava
				onLava = true -- Cambia el valor a true
				tickEntroLava = getTickCount() -- Marca el milisegundo cuando entraste a la lava
			end
			
			_setPedOnFire(localPlayer, true) -- Te prende fuego
			if getTickCount()-tickEntroLava > 1000 then -- Y si estuviste más de un segundo
				tickEntroLava = getTickCount() -- Resetea el milisegundo donde entraste a la lava
				_setElementHealth(localPlayer, (tickEntroLava-getTickCount())/250) -- Te saca como mínimo 4 de vida
			end
		elseif onLava then -- De lo contrario te coloca que no estas en la lava
			onLava = false -- Cambia el valor a false
		end
		
		if not onLava and isElement(lavaElement) then -- Si no estas en la lava y la lava existe
			local x, y, z = getElementPosition(localPlayer)
			if z <= getWaterLevel(lavaElement) + 1 then -- Y además estás a 1 metro (en coordenadas Z) de la lava (o sea que la estas tocando con los pies)
				_setPedOnFire(localPlayer, true) -- Te prendes fuego
			end
			
			local x, y, z = getCameraMatrix() -- Posición de la cámara
			local dist = getDistanceBetweenPoints3D(x, y, z, x, y, getWaterLevel(lavaElement)) -- Distancia entre la cámara y la lava
			if dist <= 10 then -- Si la distancia es menor o igual a 10 metros entonces
				if not sonidoLava then
					sonidoLava = playSound("sounds/lava.mp3", true) -- Que se reproduzca un sonido de lava
				end
				
				local volumen = 1-(dist/10) -- El volumen va de 0.0 a 1.0, esto invierte los valores (ejemplo la distancia es de 7 metros, entonces volumen = 1-0.7 = 0.3)
				setSoundVolume(sonidoLava, volumen) -- Le coloca el nuevo volumen
			elseif sonidoLava then -- En cambio si la distancia es mayor a 10 metros
				if isElement(sonidoLava) then stopSound(sonidoLava) end -- Y esta el sonido de la lava, lo detiene
				sonidoLava = nil
			end
		end
		
		if not texturaPuesta and isElement(lavaElement) then -- Si existe la lava pero no tiene textura
			texturaPuesta = true -- Entonces cambia el valor a que ya la tiene
			setWaterColor(255, 255, 255, 255) -- Cambia el color del agua a blanco bien blanco y sin transparencia
			shader = dxCreateShader("texturas/textureChanger.fx") -- Carga el shader
			textura = dxCreateTexture("texturas/lava.png") -- Carga la textura
			dxSetShaderValue(shader, "TEXTURE", textura) -- Le coloca al shader el valor de la textura
			engineApplyShaderToWorldTexture(shader, "waterclear256") -- Cambia todas las texturas waterclear256 por la textura del shader
		end
	end
end

function finalizarLava() -- Cuando el servidor le dice que el evento termino
	if isEventHandlerAdded("onClientRender", root, onRender) then
		removeEventHandler("onClientRender", root, onRender) -- Detiene el chequeo de frames
		engineRemoveShaderFromWorldTexture(shader, "waterclear256") -- Quita la textura personalizada del agua
		if sonidoLava and isElement(sonidoLava) then stopSound(sonidoLava) end -- Y si hay un sonido de lava, lo detiene
		sonidoLava = nil
		texturaPuesta = false -- Así se puede volver a poner la textura si el evento vuelve a ser iniciado sin reiniciar el resource
	end
end
addEvent("onLavaFinalizar", true)
addEventHandler("onLavaFinalizar", root, finalizarLava)

addEvent("onLavaCrearLava", true)
addEventHandler("onLavaCrearLava", root, 
	function(element) -- Sync
		lavaElement = element -- Cuando el servidor crea el agua que será lava, se le envia al cliente para sincronizar
		addEventHandler("onClientRender", root, onRender) -- Lo cual quiere decir que el evento inico, por lo cual se inicia el chequeo de frames
	end
)