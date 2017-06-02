util.AddNetworkString("sales_npc")
util.AddNetworkString("shop_open")

local function paid (ply, item)
	ply:addMoney(-item.price)
	ply:Give(item.entity)
	DarkRP.notify(ply, NOTIFY_GENERIC, 5, "Thanks for your purchase" .. item.name  )
end

local function unpaid (ply, item)
	DarkRP.notify(ply, NOTIFY_GENERIC, 5, "you dont have enough money for a" .. item.name  )
end

local function handle (len, ply)
	local id = net.ReadString()

	if npc_Item[id] == nil then return end

	local item = npc_Item[id]

	if ply:canAfford(item.price) then
		paid(ply, item)
	else
		unpaid(ply, item)
	end	
end
net.Receive("sales_npc", handle)