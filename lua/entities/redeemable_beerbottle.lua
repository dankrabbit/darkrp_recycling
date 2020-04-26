AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Redeemable Beer Bottle"
ENT.Author = "Dank Rabbit"
ENT.Contact = "https://discord.gg/3aPGk66"
ENT.Purpose = "Collect and redeem for money!"
ENT.Spawnable = true
ENT.AdminSpawnable = false
ENT.Category = "Redeem Recycle"

function ENT:Initialize()
	if SERVER then
		self:SetModel( "models/props_junk/garbage_glassbottle001a.mdl" )
		self:PhysicsInit( SOLID_VPHYSICS )
		self:SetMoveType( MOVETYPE_VPHYSICS )
		self:SetSolid( SOLID_VPHYSICS )
		local phys = self:GetPhysicsObject()
		if (phys:IsValid()) then phys:Wake() end
		self:SetUseType(SIMPLE_USE)
	end
end

if SERVER then
	function ENT:StartTouch(ent)
		if (table.HasValue(RedeemRecycle.items, self:GetClass())) and table.HasValue(RedeemRecycle.recycleCenters, ent:GetClass()) then
			self.redeeming = true
		end
	end

	function ENT:EndTouch(ent)
		if (table.HasValue(RedeemRecycle.items, self:GetClass())) and table.HasValue(RedeemRecycle.recycleCenters, ent:GetClass()) then
			self.redeeming = nil
		end
	end
end

if CLIENT then
	function ENT:Draw()
		self:DrawModel()
	end
end