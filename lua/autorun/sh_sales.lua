npc_Item = {}

local function addItem(name, price, entity)
	npc_Item[name] = {name = name, price = price, entity = entity}
end	

addItem("stuff", 100, "entity")
addItem("stuffs", 100, "entity")