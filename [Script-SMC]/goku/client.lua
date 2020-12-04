addEvent('transformation',true)
addEventHandler('transformation',root,function()
    local x,y,z = getElementPosition(source)
    local player = source

	sound = playSound3D('sound.mp3',x,y,z)	

	attachElements(sound, player)

    setTimer(function()
        ki = fxAddTankFire(x,y,z-2,0,0,10)
        chispas = fxAddSparks(x,y,z-2,0,0,10)
        setEffectDensity(chispas,2)
    end,100,100)
end)