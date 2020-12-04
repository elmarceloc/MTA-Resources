function hideMenus(toggle)
    if toggle then
        unbindKey('1')
        unbindKey('2')
        unbindKey('3')
        unbindKey('f1')
        unbindKey('f2')
        exports.sounds_animations:stop()
        hideAllWindows()
    else
        bindKey('f1', 'down', toggleFRWindow)
        bindKey('f2', 'down', toggleLocWindow)
        exports.sounds_animations:resume()
    end
end
addEvent('hideMenus',true)
addEventHandler('hideMenus',root,hideMenus)