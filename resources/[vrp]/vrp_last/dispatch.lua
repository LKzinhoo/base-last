-----------------------------------------------------------------------------------------------------------------------------------------
-- DENSITY NPCS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
			
    	SetVehicleDensityMultiplierThisFrame(0.0)
		SetPedDensityMultiplierThisFrame(0.0)
		SetRandomVehicleDensityMultiplierThisFrame(0.0)
		SetParkedVehicleDensityMultiplierThisFrame(0.0)
		SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0)
		
		local playerPed = GetPlayerPed(-1)
		local pos = GetEntityCoords(playerPed) 
		RemoveVehiclesFromGeneratorsInArea(pos['x'] - 500.0, pos['y'] - 500.0, pos['z'] - 500.0, pos['x'] + 500.0, pos['y'] + 500.0, pos['z'] + 500.0);
    	
		Citizen.Wait(1)
	end

end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISPATCH
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	for i = 1,120 do
		EnableDispatchService(i,false)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DESABILITAR X NA MOTO
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        local timeDistance = 500
        local ped = PlayerPedId()
        if IsPedInAnyVehicle(ped) then
            local vehicle = GetVehiclePedIsIn(ped)
            if (GetPedInVehicleSeat(vehicle, -1) == ped or GetPedInVehicleSeat(vehicle, 0) == ped) and GetVehicleClass(vehicle) == 8 then
                timeDistance = 4
                DisableControlAction(0, 345, true)
            end
        end
        Citizen.Wait(timeDistance)
    end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- [ ERRO DE TANKAR HS ]-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        Wait(4)

        SetPedSuffersCriticalHits(PlayerPedId(-1), true)
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DESABILITAR A CORONHADA
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        local ped = PlayerPedId()
        if IsPedArmed(ped,6) then
            DisableControlAction(0,140,true)
            DisableControlAction(0,141,true)
            DisableControlAction(0,142,true)
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DESABILITAR AUTO-CAPACETE NA MOTO
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread( function()
	while true do
		Citizen.Wait(5)  
		local veh = GetVehiclePedIsUsing(PlayerPedId())
		if veh ~= 0 then 
			SetPedConfigFlag(PlayerPedId(),35,false) 
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DESABILITAR O Q
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local ped = PlayerPedId()
        local health = GetEntityHealth(ped)
        if health >= 101 then
        	DisableControlAction(0,44,true)
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMOVER ARMA ABAIXO DE 60KMH DENTRO DO CARRO
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		local ped = PlayerPedId()
		if IsPedInAnyVehicle(ped) then
			local vehicle = GetVehiclePedIsIn(PlayerPedId())
			if GetPedInVehicleSeat(vehicle,-1) == ped then
				local speed = GetEntitySpeed(vehicle)*3.6
				if speed >= 70 then
					SetPlayerCanDoDriveBy(PlayerId(),false)
				else
					SetPlayerCanDoDriveBy(PlayerId(),true)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DESATIVA EMPINAR A MOTO A MAIS DE 100KM/H
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		local ped = PlayerPedId()
		if IsPedInAnyVehicle(ped) then
		local vehicle = GetVehiclePedIsIn(ped)
      	local speed = math.floor(GetEntitySpeed(vehicle) * 3.6)
      		if GetPedInVehicleSeat(vehicle, -1) == ped and (GetVehicleClass(vehicle) == 8 or IsVehicleModel(vehicle,GetHashKey("kawasaki"))) then
        		if speed > 100 then
					DisableControlAction(1,60,true)
        		end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DRIFT
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local RusherSleep = 1000
		local ped = PlayerPedId()
		local vehicle = GetVehiclePedIsIn(PlayerPedId())
		if IsPedInAnyVehicle(ped) then
			local speed = GetEntitySpeed(vehicle)*3.6
			if GetPedInVehicleSeat(vehicle,-1) == ped 
				and (GetEntityModel(vehicle) ~= GetHashKey("coach") 
					and GetEntityModel(vehicle) ~= GetHashKey("bus") 
					and GetEntityModel(vehicle) ~= GetHashKey("youga2") 
					and GetEntityModel(vehicle) ~= GetHashKey("ratloader") 
					and GetEntityModel(vehicle) ~= GetHashKey("taxi") 
					and GetEntityModel(vehicle) ~= GetHashKey("boxville4") 
					and GetEntityModel(vehicle) ~= GetHashKey("trash2") 
					and GetEntityModel(vehicle) ~= GetHashKey("tiptruck") 
					and GetEntityModel(vehicle) ~= GetHashKey("rebel") 
					and GetEntityModel(vehicle) ~= GetHashKey("speedo") 
					and GetEntityModel(vehicle) ~= GetHashKey("phantom") 
					and GetEntityModel(vehicle) ~= GetHashKey("packer")
					and GetEntityModel(vehicle) ~= GetHashKey("pdcharger18") 
					and GetEntityModel(vehicle) ~= GetHashKey("pdtahoe") 
					and GetEntityModel(vehicle) ~= GetHashKey("pdtaurus")
					and GetEntityModel(vehicle) ~= GetHashKey("chevyss")  
					and GetEntityModel(vehicle) ~= GetHashKey("kawasaki") 
					and GetEntityModel(vehicle) ~= GetHashKey("pdram") 
					and GetEntityModel(vehicle) ~= GetHashKey("ghispo2") 
					and GetEntityModel(vehicle) ~= GetHashKey("paramedicotahoe")  
					and GetEntityModel(vehicle) ~= GetHashKey("paramedicocharger2014")    
					and GetEntityModel(vehicle) ~= GetHashKey("paramedicoambu")) then
					RusherSleep = 100
					if speed <= 100.0 then
					if IsControlPressed(1,21) then
						SetVehicleReduceGrip(vehicle,true)
					else
						SetVehicleReduceGrip(vehicle,false)
					end
				end    
			end
		end
		Citizen.Wait(RusherSleep)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- STATUS DO DISCORD
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        SetDiscordAppId(770130667576754206)

        SetRichPresence('discord.gg/lastultimate')
        SetDiscordRichPresenceAsset('logo')
        SetDiscordRichPresenceAssetText('discord.gg/lastultimate')

        Citizen.Wait(10000)
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BLIPS
-----------------------------------------------------------------------------------------------------------------------------------------
local blips = {
	{ -29.99,-1105.07,26.43,225,4,"Concessionária",0.5 },
	{ 437.61,-982.04,30.69,60,3,"Departamento Policial",0.5 },
    { 1851.45,3686.71,34.26,60,3,"Departamento Policial",0.5 },
    { -448.18,6011.68,31.71,60,3,"Departamento Policial",0.5 },
	{ 55.43,-876.19,30.66,357,3,"Garagem",0.4 },
	{ 317.25,2623.14,44.46,357,3,"Garagem",0.4 },
	{ -773.34,5598.15,33.60,357,3,"Garagem",0.4 },
	{ 596.40,90.65,93.12,357,3,"Garagem",0.4 },
	{ -340.76,265.97,85.67,357,3,"Garagem",0.4 },
	{ -2030.01,-465.97,11.60,357,3,"Garagem",0.4 },
	{ -1184.92,-1510.00,4.64,357,3,"Garagem",0.4 },
	{ -73.44,-2004.99,18.27,357,3,"Garagem",0.4 },
	{ 214.02,-808.44,31.01,357,3,"Garagem",0.4 },
	{ -348.88,-874.02,31.31,357,3,"Garagem",0.4 },
	{ 67.74,12.27,69.21,357,3,"Garagem",0.4 },
	{ 361.90,297.81,103.88,357,3,"Garagem",0.4 },
	{ 1156.90,-453.73,66.98,357,3,"Garagem",0.4 },
	{ -102.21,6345.18,31.57,357,3,"Garagem",0.4 },
	{ -830.74,-420.58,36.77,357,3,"Garagem",0.4 },
	{ 1990.01,3052.29,47.22,385,5,"Yellow Jack",0.5 },
	{ 128.96,-1299.03,29.24,121,7,"Vanilla Unicorn",0.5 },
	{ 265.05,-1262.65,29.3,361,41,"Posto de Gasolina",0.4 },
	{ 819.02,-1027.96,26.41,361,41,"Posto de Gasolina",0.4 },
	{ 1208.61,-1402.43,35.23,361,41,"Posto de Gasolina",0.4 },
	{ 1181.48,-330.26,69.32,361,41,"Posto de Gasolina",0.4 },
	{ 621.01,268.68,103.09,361,41,"Posto de Gasolina",0.4 },
	{ 2581.09,361.79,108.47,361,41,"Posto de Gasolina",0.4 },
	{ 175.08,-1562.12,29.27,361,41,"Posto de Gasolina",0.4 },
	{ -319.76,-1471.63,30.55,361,41,"Posto de Gasolina",0.4 },
	{ 1782.33,3328.46,41.26,361,41,"Posto de Gasolina",0.4 },
	{ 49.42,2778.8,58.05,361,41,"Posto de Gasolina",0.4 },
	{ 264.09,2606.56,44.99,361,41,"Posto de Gasolina",0.4 },
	{ 1039.38,2671.28,39.56,361,41,"Posto de Gasolina",0.4 },
	{ 1207.4,2659.93,37.9,361,41,"Posto de Gasolina",0.4 },
	{ 2539.19,2594.47,37.95,361,41,"Posto de Gasolina",0.4 },
	{ 2679.95,3264.18,55.25,361,41,"Posto de Gasolina",0.4 },
	{ 2005.03,3774.43,32.41,361,41,"Posto de Gasolina",0.4 },
	{ 1687.07,4929.53,42.08,361,41,"Posto de Gasolina",0.4 },
	{ 1701.53,6415.99,32.77,361,41,"Posto de Gasolina",0.4 },
	{ 180.1,6602.88,31.87,361,41,"Posto de Gasolina",0.4 },
	{ -94.46,6419.59,31.48,361,41,"Posto de Gasolina",0.4 },
	{ -2555.17,2334.23,33.08,361,41,"Posto de Gasolina",0.4 },
	{ -1800.09,803.54,138.72,361,41,"Posto de Gasolina",0.4 },
	{ -1437.0,-276.8,46.21,361,41,"Posto de Gasolina",0.4 },
	{ -2096.3,-320.17,13.17,361,41,"Posto de Gasolina",0.4 },
	{ -724.56,-935.97,19.22,361,41,"Posto de Gasolina",0.4 },
	{ -525.26,-1211.19,18.19,361,41,"Posto de Gasolina",0.4 },
	{ -70.96,-1762.21,29.54,361,41,"Posto de Gasolina",0.4 },
	{ 46.73,-1749.55,29.64,78,30,"Mega Mall",0.4 },
	{ 133.15,-1462.67,29.36,267,2,"Emprego | Entregador",0.4 },
	{ 223.83,121.52,102.78,67,2,"Emprego | Transportador",0.5 },
	{ -1880.48,2041.93,140.73,478,27,"Emprego | Vinhedo",0.5 },
	{ -470.8,-1718.2,18.69,171,2,"Emprego | Lixeiro",0.5 },
	{ 455.15,-601.45,28.53,513,2,"Emprego | Motoristas",0.5 },
	{ 78.85,112.18,81.17,537,2,"Emprego | Carteiro",0.5 },
	{ -358.0,-133.88,38.8,402,47,"Central | Mecânica",0.5 }
}

Citizen.CreateThread(function()
	for _,v in pairs(blips) do
		local blip = AddBlipForCoord(v[1],v[2],v[3])
		SetBlipSprite(blip,v[4])
		SetBlipAsShortRange(blip,true)
		SetBlipColour(blip,v[5])
		SetBlipScale(blip,v[7])
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(v[6])
		EndTextCommandSetBlipName(blip)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TASERTIME
-----------------------------------------------------------------------------------------------------------------------------------------
local tasertime = false
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)
		local ped = PlayerPedId()
		if IsPedBeingStunned(ped) then
			SetPedToRagdoll(ped,10000,10000,0,0,0,0)
		end

		if IsPedBeingStunned(ped) and not tasertime then
			tasertime = true
			ShakeGameplayCam("FAMILY5_DRUG_TRIP_SHAKE",1.0)
		elseif not IsPedBeingStunned(ped) and tasertime then
			tasertime = false
			SetTimeout(5000,function()
				SetTimeout(10000,function()
					SetTimecycleModifier("")
					SetTransitionTimecycleModifier("")
					StopGameplayCamShaking()
				end)
			end)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMOVER ARMA ABAIXO DE 40MPH DENTRO DO CARRO
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local timeDistance = 500
		local ped = PlayerPedId()
		if IsPedInAnyVehicle(ped) then
			timeDistance = 4
			local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
			local speed = GetEntitySpeed(vehicle)*3.6
			if GetEntityModel(vehicle) ~= GetHashKey('buzzard2') and GetEntityModel(vehicle) ~= GetHashKey('polmav') then
				timeDistance = 4
				if speed >= 40 or GetSelectedPedWeapon(ped) ~= GetHashKey("WEAPON_STUNGUN") then
					timeDistance = 4
					DisableControlAction(0, 69, true)
					DisableControlAction(0, 92, true)
				end
			end
		end
		Citizen.Wait(timeDistance)
	end
end)

Citizen.CreateThread( function()
    while true do
         Citizen.Wait(0)
         RestorePlayerStamina(PlayerId(), 1.0)
     end
 end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- COOLDOWN BUNNYHOP
-----------------------------------------------------------------------------------------------------------------------------------------
local bunnyhop = 0
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(2000)
		if bunnyhop > 0 then
			bunnyhop = bunnyhop - 2
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		local ped = PlayerPedId()
		if IsPedJumping(ped) and bunnyhop <= 0 then
			bunnyhop = 2
		end
		if bunnyhop > 0 then
			DisableControlAction(0,22,true)
		end
		Citizen.Wait(5)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BLACKLIST WEAPONS
-----------------------------------------------------------------------------------------------------------------------------------------
blackWeapons = {
	--"WEAPON_ASSAULTRIFLE_MK2",
	--"WEAPON_CARBINERIFLE_MK2",
	--"WEAPON_MACHINEPISTOL",
	--"WEAPON_HEAVYPISTOL",
	--"WEAPON_SPECIALCARBINE_MK2",
	"WEAPON_PISTOL50",
	"WEAPON_SNSPISTOL_MK2",
	"WEAPON_FLAREGUN",
	"WEAPON_MARKSMANPISTOL",
	"WEAPON_REVOLVER_MK2",
	"WEAPON_DOUBLEACTION",
	"WEAPON_RAYPISTOL",
	--"WEAPON_SMG_MK2",
	"WEAPON_GUSENBERG",
	"WEAPON_MINISMG",
	"WEAPON_RAYCARBINE",
	"WEAPON_PUMPSHOTGUN_MK2",
	--"WEAPON_PUMPSHOTGUN",
	--"WEAPON_SAWNOFFSHOTGUN",
	"WEAPON_ASSAULTSHOTGUN",
	"WEAPON_BULLPUPSHOTGUN",
	"WEAPON_HEAVYSHOTGUN",
	"WEAPON_DBSHOTGUN",
	"WEAPON_AUTOSHOTGUN",
	"WEAPON_ASSAULTRIFLE",
	"WEAPON_ADVANCEDRIFLE",
	"WEAPON_SPECIALCARBINE",
	"WEAPON_BULLPUPRIFLE",
	"WEAPON_BULLPUPRIFLE_MK2",
	"WEAPON_COMPACTRIFLE",
	"WEAPON_MG",
	"WEAPON_COMBATMG",
	"WEAPON_COMBATMG_MK2",
	"WEAPON_SNIPERRIFLE",
	"WEAPON_HEAVYSNIPER",
	"WEAPON_HEAVYSNIPER_MK2",
	"WEAPON_MARKSMANRIFLE",
	"WEAPON_MARKSMANRIFLE_MK2",
	"WEAPON_RPG",
	"WEAPON_GRENADELAUNCHER",
	"WEAPON_GRENADELAUNCHER_SMOKE",
	"WEAPON_MINIGUN",
	"WEAPON_FIREWORK",
	"WEAPON_RAILGUN",
	"WEAPON_HOMINGLAUNCHER",
	"WEAPON_COMPACTLAUNCHER",
	"WEAPON_RAYMINIGUN",
	"WEAPON_GRENADE",
	"WEAPON_BZGAS",
	"WEAPON_MOLOTOV",
	"WEAPON_STICKYBOMB",
	"WEAPON_PROXMINE",
	"WEAPON_PIPEBOMB",
	"WEAPON_SNOWBALL",
	"WEAPON_BALL",
	"WEAPON_SMOKEGRENADE"
}

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		for k,v in ipairs(blackWeapons) do
			if GetSelectedPedWeapon(PlayerPedId()) == GetHashKey(v) then
				RemoveWeaponFromPed(PlayerPedId(),GetHashKey(v))
				TriggerServerEvent("adminLogs:Armamentos", v)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RADAR
-----------------------------------------------------------------------------------------------------------------------------------------
local radar = {
	shown = false,
	freeze = false,
	info = "INICIANDO O SISTEMA DO RADAR",
	info2 = "INICIANDO O SISTEMA DO RADAR"
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADRADAR
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local timeDistance = 1000
		local ped = PlayerPedId()
		if IsPedInAnyPoliceVehicle(ped) then
			timeDistance = 5
			if IsControlJustPressed(1,306) then
				radar.shown = not radar.shown
			end

			if IsControlJustPressed(1,301) then
				radar.freeze = not radar.freeze
			end

			if radar.shown and IsPedInAnyVehicle(ped) then
				if not radar.freeze then
					local veh = GetVehiclePedIsIn(ped)
					local coordA = GetOffsetFromEntityInWorldCoords(veh,0.0,1.0,1.0)
					local coordB = GetOffsetFromEntityInWorldCoords(veh,0.0,105.0,0.0)
					local frontcar = StartShapeTestCapsule(coordA,coordB,3.0,10,veh,7)
					local a,b,c,d,e = GetShapeTestResult(frontcar)

					if IsEntityAVehicle(e) then
						local fmodel = GetDisplayNameFromVehicleModel(GetEntityModel(e))
						local fvspeed = GetEntitySpeed(e) * 3.6
						local fplate = GetVehicleNumberPlateText(e)
						radar.info = string.format("~y~PLACA: ~w~%s   ~y~MODELO: ~w~%s   ~y~VELOCIDADE: ~w~%s KMH",fplate,fmodel,math.ceil(fvspeed))
					end

					local bcoordB = GetOffsetFromEntityInWorldCoords(veh,0.0,-105.0,0.0)
					local rearcar = StartShapeTestCapsule(coordA,bcoordB,3.0,10,veh,7)
					local f,g,h,i,j = GetShapeTestResult(rearcar)

					if IsEntityAVehicle(j) then
						local bmodel = GetDisplayNameFromVehicleModel(GetEntityModel(j))
						local bvspeed = GetEntitySpeed(j) * 3.6
						local bplate = GetVehicleNumberPlateText(j)
						radar.info2 = string.format("~y~PLACA: ~w~%s   ~y~MODELO: ~w~%s   ~y~VELOCIDADE: ~w~%s KMH",bplate,bmodel,math.ceil(bvspeed))
					end
				end

				dwText(radar.info,0.905)
				dwText(radar.info2,0.93)
			end
		end

		if not IsPedInAnyVehicle(ped) and radar.shown then
			radar.shown = false
			radar.freeze = false
		end

		Citizen.Wait(timeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DWTEXT
-----------------------------------------------------------------------------------------------------------------------------------------
function dwText(text,height)
	SetTextFont(4)
	SetTextScale(0.50,0.50)
	SetTextColour(255,255,255,180)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(0.5,height)
end

local recoil = {
	[453432689] = 0.3, -- PISTOL
	[3219281620] = 0.8, -- PISTOL MK2
	[584646201] = 0.1, -- AP PISTOL
	[2578377531] = 0.6, -- PISTOL .50
	[324215364] = 0.2, -- MICRO SMG
	[4024951519] = 0.1, -- ASSAULT SMG
	[3220176749] = 0.2, -- ASSAULT RIFLE
	[2937143193] = 0.1, -- ADVANCED RIFLE
	[2634544996] = 0.1, -- MG
	[2144741730] = 0.1, -- COMBAT MG
	[3686625920] = 0.1, -- COMBAT MG MK2
	[487013001] = 0.9, -- PUMP SHOTGUN



	[961495388] = 0.230, -- ASSAULT RIFLE MK2
	[-2084633992] = 0.100, -- CARBINE RIFLE
	[-86904375] = 0.150, -- CARBINE RIFLE MK2
	[-1768145561] = 0.230, -- SPECIAL CARBINE MK2


	[-1075685676] = 0.220, -- PISTOL MK2
	[1593441988] = 0.180, -- COMBAT PISTOL
	[-1076751822] = 0.180, -- SNS PISTOL
	[-771403250] = 0.180, -- HEAVY PISTOL

	[1432025498] = 0.9, -- PUMP SHOTGUN MK2
	[2017895192] = 0.9, -- SAWNOFF SHOTGUN
	[3800352039] = 0.4, -- ASSAULT SHOTGUN
	[2640438543] = 0.2, -- BULLPUP SHOTGUN
	[911657153] = 0.1, -- STUN GUN
	[100416529] = 0.5, -- SNIPER RIFLE
	[205991906] = 0.7, -- HEAVY SNIPER
	[177293209] = 0.6, -- HEAVY SNIPER MK2
	[856002082] = 1.2, -- REMOTE SNIPER
	[2726580491] = 1.0, -- GRENADE LAUNCHER
	[1305664598] = 1.0, -- GRENADE LAUNCHER SMOKE
	[2982836145] = 0.0, -- RPG
	[1752584910] = 0.0, -- STINGER
	[1119849093] = 0.01, -- MINIGUN
	[3218215474] = 0.2, -- SNS PISTOL
	[1627465347] = 0.1, -- GUSENBERG
	[3523564046] = 0.5, -- HEAVY PISTOL
	[2132975508] = 0.2, -- BULLPUP RIFLE

	[-619010992] = 0.1, -- MACHINE PISTOL
	[736523883] = 0.1, -- SMG
	[2024373456] = 0.1, -- SMG MK2
	[171789620] = 0.1, -- COMBAT PDW

	[-2066285827] = 0.15, -- BULLPUP RIFLE MK2
	[137902532] = 0.4, -- VINTAGE PISTOL
	[2828843422] = 0.7, -- MUSKET
	[984333226] = 0.2, -- HEAVY SHOTGUN
	[3342088282] = 0.3, -- MARKSMAN RIFLE
	[1785463520] = 0.25, -- MARKSMAN RIFLE MK2
	[1672152130] = 0, -- HOMING LAUNCHER
	[1198879012] = 0.9, -- FLARE GUN
	[3696079510] = 0.9, -- MARKSMAN PISTOL
	[1834241177] = 2.4, -- RAILGUN
	[3675956304] = 0.3, -- MACHINE PISTOL
	[3249783761] = 0.6, -- REVOLVER
	[-879347409] = 0.6, -- REVOLVER MK2
	[4019527611] = 0.7, -- DOUBLE BARREL SHOTGUN
	[1649403952] = 0.3, -- COMPACT RIFLE
	[317205821] = 0.2, -- AUTO SHOTGUN
	[125959754] = 0.5, -- COMPACT LAUNCHER
	[3173288789] = 0.1, -- MINI SMG	
}
------------------------------------------------------------------------------
-- DANO POR OSSO + RECOIL CONFIG
------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsPedShooting(PlayerPedId()) then
			local wep = GetSelectedPedWeapon(PlayerPedId())
			if recoil[wep] and recoil[wep] ~= 0 then
				Wait(0)
				p = GetGameplayCamRelativePitch()
				if not IsPedInAnyHeli(PlayerPedId()) then
					SetGameplayCamRelativePitch(p+recoil[wep], 1.2)
				end
			end
        end
        local headshotFive = HasPedBeenDamagedByWeapon(PlayerPedId(), -1075685676, 0) -- Pistol
        local headshotGlock = HasPedBeenDamagedByWeapon(PlayerPedId(), 1593441988, 0) -- Pistol
		local headshotFajuta = HasPedBeenDamagedByWeapon(PlayerPedId(), -1076751822, 0) -- Pistol
		local headshotPesada = HasPedBeenDamagedByWeapon(PlayerPedId(), 3523564046, 0) -- Pistol

		local headshotTec = HasPedBeenDamagedByWeapon(PlayerPedId(), -619010992, 0) -- SMG
		local headshotSmg = HasPedBeenDamagedByWeapon(PlayerPedId(), 736523883, 0) -- SMG
		local headshotSmg2 = HasPedBeenDamagedByWeapon(PlayerPedId(), 0x78A97CD0, 0) -- SMG MK2
        local headshotMtar = HasPedBeenDamagedByWeapon(PlayerPedId(), 3675956304, 0) -- SMG
		local headshotSig = HasPedBeenDamagedByWeapon(PlayerPedId(), 171789620, 0) -- SMG

		local headshotAK = HasPedBeenDamagedByWeapon(PlayerPedId(), 961495388, 0) -- Fuzil
		local headshotAK2 = HasPedBeenDamagedByWeapon(PlayerPedId(), 961495388, 0) -- Fuzil
		local headshotM4 = HasPedBeenDamagedByWeapon(PlayerPedId(), -2084633992, 0) -- Fuzil
		local headshotMPX = HasPedBeenDamagedByWeapon(PlayerPedId(), -86904375, 0) -- Fuzil
		local headshotG3 = HasPedBeenDamagedByWeapon(PlayerPedId(), -1768145561, 0) -- G3

		local headshot12 = HasPedBeenDamagedByWeapon(PlayerPedId(), 487013001, 0) -- 12
		local headshotMini12 = HasPedBeenDamagedByWeapon(PlayerPedId(), 2017895192, 0) -- 12
		local a, b = GetPedLastDamageBone(PlayerPedId())
		if a and b == 31086 then
			if headshotFive or headshotGlock or headshotFajuta or headshotPesada or headshotSmg or headshotSmg2 or headshotMtar or headshotSig or headshotTec then
				SetEntityHealth(PlayerPedId(), 101)
			elseif headshotAK or headshotAK2 or headshotM4 or headshotMPX or headshotG3 or headshotG32 or headshot12 or headshotMini12 then
				SetEntityHealth(PlayerPedId(), GetEntityHealth(PlayerPedId()) - 101)
			end
			a, b, headshotFive, headshotGlock, headshotFajuta, headshotPesada, headshotTec, headshotSmg, headshotSmg2, headshotMtar, headshotSig, headshotAK, headshotAK2, headshotM4, headshotMPX, headshotG3, headshotG32, headshot12, headshotMini12 = nil, nil, nil, nil, nil, nil
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		local sleep = 100
		if IsPedArmed(PlayerPedId(),6) then
			sleep = 4
			DisableControlAction(1,140,true)
			DisableControlAction(1,141,true)
			DisableControlAction(1,142,true)
		end
		Citizen.Wait(sleep)
	end
end)