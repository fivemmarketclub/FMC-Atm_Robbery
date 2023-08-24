local QBCore = exports["qb-core"]:GetCoreObject()



RegisterNetEvent("FMC-atmrobbery:server:reward", function(Money)
	Player = QBCore.Functions.GetPlayer(source)
	Player.Functions.AddItem('moneyroll', math.random(500, 1000), false, info)	
end)


AddEventHandler('onResourceStart', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then
	  return
	end
	print(resourceName.. ' loading 100% ')
  end)

  AddEventHandler('onResourceStop', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then
	  return
	end
	print(resourceName..  ' loading 100% ')
  end)

