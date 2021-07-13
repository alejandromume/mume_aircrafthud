ESX = nil

Citizen.CreateThread(function() 
    while ESX == nil do 
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) 
        Citizen.Wait(0)
    end 
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(50)
        local jugador = GetPlayerPed(-1)
        
        if IsPedInAnyPlane(jugador) or IsPedInAnyHeli(jugador) then

            local vehiculo = GetVehiclePedIsUsing(jugador)
            local velo = (GetEntitySpeed(vehiculo)* 1.94384) -- Relación con km/h http://www.kronzky.info/fivemwiki/index.php?title=GetEntitySpeed
            local gaso = GetVehicleFuelLevel(vehiculo)
            local vida = GetVehicleEngineHealth(vehiculo)
            local coche = IsPedSittingInAnyVehicle(jugador)
            local altura = ESX.Math.Round(GetEntityHeightAboveGround(jugador), 1)
            local roll = ESX.Math.Round(GetEntityRoll(jugador), 1)
            local pitch = ESX.Math.Round(GetEntityPitch(jugador), 1)
			local direction = GetEntityHeading(jugador)

            local x,y,z = table.unpack(GetEntityCoords(jugador, false))
            local streetName, crossing = GetStreetNameAtCoord(x, y, z)
			streetName = GetStreetNameFromHashKey(streetName)
            local time
            if GetClockMinutes() < 10 then
                time = GetClockHours() .. ":0" .. GetClockMinutes()
            else
                time = GetClockHours() .. ":" .. GetClockMinutes()
            end

        
            Citizen.Wait(20)
            SendNUIMessage({
                coche = coche; 
                vel = velo; 
                gasolina = gaso;
                vida = vida;
                altura = altura;
                roll = roll;
                streetName = streetName;
                pitch = pitch;
                time = time;
            })
        else
            SendNUIMessage({
                coche = false;
            })
        end
    end
end)