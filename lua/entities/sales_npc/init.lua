AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Initialize()
	self:SetModel("models/Eli.mdl")
	self:SetHullSizeNormal()
	self:SetSolid(SOLID_BBOX)
	self:SetUseType(SIMPLE_USE)
	self:DropToFloor()
end

function ENT:AcceptInput(inputName, activator, caller)
	if !caller:IsPlayer() then return end

	net.Start("shop_open")
	net.Send(caller)

end	