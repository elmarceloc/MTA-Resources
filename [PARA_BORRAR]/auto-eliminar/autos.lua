setTimer( 
    function () 
        for _, vehicle in pairs(getElementsByType("vehicle") do 
            if (#getVehicleOccupants(vehicle) == 0) then 
              destroyVehicle(vehicle) 
            end 
        end 
    end, 10000, 1 
) 