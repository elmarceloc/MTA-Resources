--[[
***************************************************************************************************
* Draft resource by Eddie Eezo <eddie.eezo@gmail.com>
* 
* When one car is driving behind another, it will experience less air resistance, making it 
* possible to reach higher speeds more easily or even overtake the car in front. That is what
* this resource tries to simulate - a nice little asset to race gamemodes, but also really fun
* for simply cruising around with fast cars.
* Permission is hereby granted to use and modify this code in any way you want, just please don't
* re-release it and claim it to be your own.
***************************************************************************************************
]]

addEvent ("onClientPlayerDraft", false)
addEvent ("enableDrafting", true)
addEvent ("disableDrafting", true)

local draftInterval
local draftMaxDistance
local draftDisplayThreshold
local draftEnabled
local draftColShape
local draftTimer
local isDrafting
local showDraftText

local supportedVehicleTypes = {
    ["Automobile"] = true,
    ["Bike"] = true,
    ["BMX"] = true,
    ["Monster Truck"] = true,
    ["Quad"] = true
}

-- This function enables drafting - typically called via a server-triggered event
function enableDrafting (vehicle, interval, maxDistance, displayThreshold)
    if draftEnabled then return end
    if not isDraftVehicleSupported (vehicle) then return end
    if getVehicleOccupant (vehicle, 0) ~= localPlayer then return end    
    
    -- Copy settings over
    draftInterval = interval or draftInterval
    draftMaxDistance = maxDistance or draftMaxDistance
    draftDisplayThreshold = displayThreshold or draftDisplayThreshold
    
    -- Set up some elements
    createDraftColShape (vehicle)
    createDraftTimer ()    
    
    draftEnabled = true
end
addEventHandler ("enableDrafting", localPlayer, enableDrafting)

-- This function disables drafting - typically called via a server-triggered event
function disableDrafting ()
    if isTimer (draftTimer) then killTimer (draftTimer) end    
    if isElement (draftColShape) then destroyElement (draftColShape) end
    
    draftEnabled = false
    draftTimer = nil
    draftColShape = nil
end
addEventHandler ("disableDrafting", localPlayer, disableDrafting)

function createDraftTimer ()
    if isTimer (draftTimer) then killTimer (draftTimer) end
    
    draftTimer = setTimer (applyDraft, draftInterval, 0)
end


function createDraftColShape (vehicle)
    if isElement (draftColShape) then destroyElement (draftColShape) end

    draftColShape = createColCircle (0, 0, draftMaxDistance)
    attachElements (draftColShape, vehicle, 0, 0, 0)
end

function isDraftVehicleSupported (vehicle)
    if not isElement (vehicle) then return false end
    
    local t = getVehicleType (vehicle)
    return not not (supportedVehicleTypes[t] and getElementCollisionsEnabled (vehicle))
end

function applyDraft ()
    local vehicle = getPedOccupiedVehicle (localPlayer)
    
    -- Check if the vehicle is still valid - if not, just clean stuff up and return
    if not isElement (vehicle) then
        disableDrafting ()
        return
    end
   
    
    -- If somehow the colshape doesn't exist anymore, simply recreate it
    if not isElement (draftColShape) then
        createDraftColShape (vehicle)
    end
    
    local myPosition = { getElementPosition (vehicle) }
    local myVelocity = { getElementVelocity (vehicle) }
    local mySpeed = getDistanceBetweenPoints3D (0, 0, 0, unpack (myVelocity))
    local myHeading = { myVelocity[1] / mySpeed,  myVelocity[2] / mySpeed, myVelocity[3] / mySpeed }
    
    -- Get all nearby vehicles
    local nearbyVehicles = getElementsWithinColShape (draftColShape, "vehicle")
    local totalDraft = 0
    local draftCount = 0
    for _, otherVehicle in ipairs (nearbyVehicles) do
        if otherVehicle ~= vehicle and isDraftVehicleSupported (vehicle) then
            local box = { getElementBoundingBox (otherVehicle) }            
            
            local otherPosition = { getElementPosition (otherVehicle) }
            local otherVelocity = { getElementVelocity (otherVehicle) }            
            local otherSpeed = getDistanceBetweenPoints3D (0, 0, 0, unpack (otherVelocity))
            
            
            if otherSpeed ~= 0 and #box == 6 then
                -- Now some simple maths using normalized vectors, dot products and whatnot
                local otherHeading = { otherVelocity[1] / otherSpeed,  otherVelocity[2] / otherSpeed, otherVelocity[3] / otherSpeed }
                
                local posDifference = { otherPosition[1] - myPosition[1], otherPosition[2] - myPosition[2], otherPosition[3] - myPosition[3] }
                local distance = getDistanceBetweenPoints3D (0, 0, 0, unpack (posDifference))
                
                local normalizedOffset = { posDifference[1] / distance, posDifference[2] / distance, posDifference[3] / distance }
                local posCorrection = otherHeading[1] * normalizedOffset[1] + otherHeading[2] * normalizedOffset[2] + otherHeading[3] * normalizedOffset[3]
                
                local draftFactor = otherHeading[1] * myHeading[1] + otherHeading[2] * myHeading[2] + otherHeading[3] * myHeading[3]
                               
                if draftFactor > 0 and posCorrection >= 0 then
                    -- Tie it all together into one number
                    local width, depth, height = box[2] - box[1], box[4] - box[3], box[6] - box[5]                    
                    draftFactor = (otherSpeed * draftFactor * math.sqrt (width * height) * posCorrection ^ 10) * ((draftMaxDistance - distance) / draftMaxDistance)                
                    totalDraft = totalDraft + draftFactor
                    draftCount = draftCount + 1
                end
            end
        end
    end
 
    -- If we were drafting in the last update, we have to update anyway
    if draftCount > 0 or isDrafting then
        local draftFactor = totalDraft * math.sqrt (draftCount)
        triggerEvent ("onClientPlayerDraft", localPlayer, vehicle, draftFactor)
    end
end

addEventHandler ("onClientPlayerDraft", localPlayer,
    function (vehicle, draftFactor)
        triggerServerEvent ("setDraftFactor", localPlayer, vehicle, draftFactor)
        
        showDraftText = draftFactor >= draftDisplayThreshold
        isDrafting = (draftFactor > 0)
    end
)

-- onClientRender handler to draw the draft image
local screenWidth, screenHeight = guiGetScreenSize ()
addEventHandler ("onClientRender", root,
    function ()
        if not showDraftText then return end
        
        -- Use different sizes for different resolutions
        local sizeMultiplier
        if screenWidth < 800 then sizeMultiplier = 2
        elseif screenWidth < 1200 then sizeMultiplier = 3
        else sizeMultiplier = 4 end
        
        
        dxDrawImage (screenWidth * 0.85, screenHeight * 0.25, 32 * sizeMultiplier, 16 * sizeMultiplier, "draft.png")
    end
)

-- Enable drafting for everyone in a vehicle when this resource starts
addEventHandler ("onClientResourceStart", resourceRoot,
    function ()
        local vehicle = getPedOccupiedVehicle (localPlayer)
        if not isDraftVehicleSupported (vehicle) then return end
        if getVehicleOccupant (vehicle, 0) ~= localPlayer then return end
        
        triggerServerEvent ("requestDraftInit", localPlayer, vehicle)        
    end
)
