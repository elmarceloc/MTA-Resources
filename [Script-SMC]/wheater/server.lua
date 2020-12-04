local function setWeatherChile()
    local lugar = 'Santiago,Chile'

    fetchRemote('http://api.openweathermap.org/data/2.5/weather?q='.. lugar ..'&appid=3e3b96f4160e4636b42b2ec0f4e5106b',function(data, errno)
        if data ~= nil then
            output = fromJSON(data)
            weather = tonumber(output.weather[1].id)
            weatherstring = output.weather[1].main

            if weather == 800 then
                setWeather(0) -- super soleado
            elseif weather == 801 then
                setWeather(1) -- soleado
            elseif weather == 802 then
                setWeather(3) -- smog
            elseif weather == 803 or weather == 804 then
                setWeather(4) -- nublado
            elseif weatherstring == 'Fog' then
                setWeather(9) -- neblina
            elseif weatherstring == 'Rain' or weatherstring == 'Drizzle' then
                setWeather(8) -- lluvia
            end
            outputDebugString('Clima: '..weather)
        else
            outputDebugString('ERROR CLIMA')
        end
    end)
end


local function resourceStart ( )
    setWeatherChile()
    setTimer(function() 
        setWeatherChile()
    end,60*60*1000,1)
end
addEventHandler ( "onResourceStart", getRootElement(), resourceStart )