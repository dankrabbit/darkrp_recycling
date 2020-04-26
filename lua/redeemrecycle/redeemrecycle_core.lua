hook.Add("GravGunOnDropped", "RedeemRecycle_GravGun", function(ply, ent)
	if ent.redeeming != true then return end
	if (RedeemRecycle.restrictJobs == true) and !table.HasValue(RedeemRecycle.jobs, team.GetName(ply:Team())) then return end

	if table.HasValue(RedeemRecycle.items, ent:GetClass()) then
		ent:Remove()

		print(ent:GetClass() .. " was recycled for $" .. RedeemRecycle.itemWorth[ent:GetClass()] .. " by " .. ply:Nick())
		ply:addMoney(RedeemRecycle.itemWorth[ent:GetClass()])
		ply:ChatPrint("You recieved $" .. RedeemRecycle.itemWorth[ent:GetClass()] .. " for recycling!")
	end
end)

local useCooldown = 3
hook.Add("PlayerUse", "RedeemRecycle_OnUse", function(ply, ent)
	if !IsValid(ent) then return end
	if table.HasValue(RedeemRecycle.items, ent:GetClass()) then
		if !ent.nextUse then ent.nextUse = 0 end
		if ent.nextUse > CurTime() then return end

		if (RedeemRecycle.restrictJobs == true) and !table.HasValue(RedeemRecycle.jobs, team.GetName(ply:Team())) then
			ply:ChatPrint("That's gross, do you really wanna touch that? Leave it for a hobo to pick up!")
			ent.nextUse = CurTime() + useCooldown
			return false
		end
		ply:ChatPrint("Reduce, Reuse, Recycle! This is worth $" .. RedeemRecycle.itemWorth[ent:GetClass()] .. " at your local recycling center!")
		ent.nextUse = CurTime() + useCooldown
	elseif table.HasValue(RedeemRecycle.recycleCenters, ent:GetClass()) then
		if !ent.nextUse then ent.nextUse = 0 end
		if ent.nextUse > CurTime() then return end

		if (RedeemRecycle.restrictJobs == true) and !table.HasValue(RedeemRecycle.jobs, team.GetName(ply:Team())) then
			ply:ChatPrint("Hobos bring recyclables here for spare change.")
			ent.nextUse = CurTime() + useCooldown
			return false
		end
		ply:ChatPrint("Reduce, Reuse, Recycle! Bring recyclables here for a reward!")
		ent.nextUse = CurTime() + useCooldown
	end
end)

print("RedeemRecycle has finished loading!")