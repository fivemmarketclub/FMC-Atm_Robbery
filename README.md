# FMC-Atm_Robbery
FMC-Atm Robbery


Dependencies
    
    qb-core
    qb-target
    ps-ui


1  Items (qb-core/shared/item.lua)

    ['moneyroll']                         = {['name'] = 'moneyroll',                           ['label'] = 'Money roll',                   ['weight'] = 1,          ['type'] = 'item',         ['image'] = 'moneyroll.png',                 ['unique'] = false,         ['useable'] = false,     ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = 'Money roll'},




2   Dispatch setup

    add ps-dispatch client/extraalers.lua

        local function Atmrobbery()
            local currentPos = GetEntityCoords(PlayerPedId())
            local locationInfo = getStreetandZone(currentPos)
            local gender = GetPedGender()
            TriggerServerEvent("dispatch:server:notify",{
                dispatchcodename = "atmrobbery", 
                dispatchCode = "10-50",
                firstStreet = locationInfo,
                gender = gender,
                model = nil,
                plate = nil,
                priority = 2, -- priority
                firstColor = nil,
                automaticGunfire = false,
                origin = {
                    x = currentPos.x,
                    y = currentPos.y,
                    z = currentPos.z
                },
                dispatchMessage = 'Atm robbery in progress',
                job = {"police"} 
            })
        end exports('Atmrobbery', Atmrobbery)
        RegisterNetEvent("ps-dispatch:client:atmrobbery", function ()
            Atmrobbery()
        end)


    add ps-dispatch server/dispatchcodes.lua


            ["atmrobbery"] =  {displayCode = '10-50', description = "Atm robbery In Progress", radius = 0, recipientList = {'police'}, blipSprite = 595, blipColour = 60, blipScale = 1.5, blipLength = 2, sound = "Lose_1st", sound2 = "GTAO_FM_Events_Soundset", offset = "false", blipflash = "false"},



3  qb-inventory/html/images

    Add the images to your inventory folder




