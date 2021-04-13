local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

src = {}
Tunnel.bindInterface("last_anti",src)
Proxy.addInterface("last_anti",src)
acClient = Tunnel.getInterface("last_anti")

RegisterNUICallback("loadNuis", function(data, cb)
	acClient.pegaTrouxa()
end)


