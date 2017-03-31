local frame = CreateFrame("Frame", nil , UIParent, "WorldStateAlwaysUpTemplate")
local _
local UnitDebuff, dampeningtext = UnitDebuff, GetSpellInfo(110310)
_, frame.text = frame:GetRegions()

frame:SetScript("OnEvent", function(self, event, ...) self[event](...) end)
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:SetPoint("TOP", WorldStateAlwaysUpFrame, "BOTTOM",-23,-10)

function frame.UNIT_AURA(unit)
	local _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, percentage = UnitDebuff(unit, dampeningtext)
	if percentage then
		if not frame:IsShown() then -- only do this stuff when the buff appears the first time	
			frame:Show()
		end
		if frame.dampening ~= percentage then
			frame.dampening = percentage
			frame.text:SetText(dampeningtext..": "..percentage.."%")
		end
	elseif frame:IsShown() then
		frame:Hide()
	end
end

function frame.PLAYER_ENTERING_WORLD()
	local _, instanceType = IsInInstance()
	if instanceType == "arena" then
		frame:RegisterUnitEvent("UNIT_AURA", "player")
	else	
		frame:UnregisterEvent("UNIT_AURA")
	end
end