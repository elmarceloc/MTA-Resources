


addEventHandler('onResourceStart',getRootElement(),function()

    local ids = {4716}
    
    for _,obj in ipairs (ids) do
        removeWorldModel (obj, 10000, 0, 0, 0)
    end

end)