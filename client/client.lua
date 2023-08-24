local QBCore = exports["qb-core"]:GetCoreObject()

local rob = false

local objecs = {
"prop_atm_01",
"prop_atm_02",
"prop_atm_03",
"prop_fleeca_atm"
}

function loadAnimDict(dict)
if not HasAnimDictLoaded(dict) then
RequestAnimDict(dict)
while not HasAnimDictLoaded(dict) do
Wait(0)
end
end
end

RegisterNetEvent("FMC-atmrobbery:client:rob")
AddEventHandler("FMC-atmrobbery:client:rob", function()
local hasItem = QBCore.Functions.HasItem('trojan_usb')


local function Playvending_machineRAnimation(animation)
    local playerPed = PlayerPedId()
    if animation == 'idle_a' then
        RequestAnimDict('amb@prop_human_parking_meter@male@idle_a')
        while not HasAnimDictLoaded('amb@prop_human_parking_meter@male@idle_a') do
            Wait(0)
        end
        TaskPlayAnim(playerPed, 'amb@prop_human_parking_meter@male@idle_a', "idle_a", 1.0,-1.0, 10500, 1, 1, true, true, true)
    end
end



if rob then
    QBCore.Functions.Notify("You are already rob the atm", "error")
    Citizen.Wait(Config.cooldown)
    rob = false
else
if hasItem then
    exports['ps-ui']:Scrambler(function(success)
        if success then
            TriggerServerEvent("FMC-atmrobbery:server:reward")
            rob = true
            Playvending_machineRAnimation('idle_a')
            exports['progressbar']:Progress({
                name = "unique_action_atm",
                duration = 10500,
                label = "Taking money roll",
                useWhileDead = false,
                canCancel = false,
                controlDisables = {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                },
            })
            QBCore.Functions.Notify("you have successfully rob the atm", "error")

        else
            QBCore.Functions.Notify("You failed", "error")
            exports['ps-dispatch']:Atmrobbery()
            ClearPedTasksImmediately(PlayerPedId())
        end
    end, "numeric", 30, 0)
else
    QBCore.Functions.Notify("You don't have a Trojan Usb", "error")
end
end
end)

Citizen.CreateThread(function()
while true do
exports['qb-target']:AddTargetModel(objecs, {
options = {
{
event = "FMC-atmrobbery:client:rob",
icon = "fas fa-hands",
label = "Rob Atm",
},
},
distance = 2.0,
})
end
end)
