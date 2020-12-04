function togglecine(toggle)
    if toggle then
        unbindKey('1')
        unbindKey('2')
        unbindKey('3')
        unbindKey('f1')
        unbindKey('f2')
        exports.sounds_animations:stop()
        hideAllWindows()
        showCursor(false)
        exports.notifications.createNotification(1,'','Bienvenido a WENA LOS CINE','Preciona el F6 para abrir el menu del\ncine',5000)

    else
        bindKey('f1', 'down', toggleFRWindow)
        bindKey('f2', 'down', toggleLocWindow)
        exports.sounds_animations:resume()
    end
end
addEvent('togglecine',true)
addEventHandler('togglecine',root,togglecine)