function getStatus(country,thePlayer)
    fetchRemote("https://corona.lmao.ninja/v2/countries", sendStatus, "", false, country,thePlayer)
end

function sendStatus(responseData, errno, country,thePlayer)
    if errno == 0 then
        local data = fromJSON("["..responseData.."]")
        for k,v in ipairs(data) do
            if v.country == country then
	  triggerClientEvent(thePlayer,"writeCoronaStatus", root, tostring(v.cases), tostring(v.todayCases), tostring(v.deaths), tostring(v.recovered))
            end
        end
    end
end

addEvent("openCoronaStats", true)
addEventHandler("openCoronaStats", getRootElement(),
function (thePlayer)
	local Country = "Chile"
	getStatus(Country,thePlayer)
end)
