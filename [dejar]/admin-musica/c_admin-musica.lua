function musica(url)
    lol = playSound(url)
    setSoundVolume(lol,4.0)

end
addEvent('musica',true)
addEventHandler('musica',root,musica)