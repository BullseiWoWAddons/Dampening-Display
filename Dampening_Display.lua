local frame = CreateFrame("Frame", "Dampening_Display" , UIParent, "UIWidgetTemplateIconAndText")
local _
local spellID = 110310

local dampeningtext
if C_Spell and C_Spell.GetSpellInfo then
	local spellInfo = C_Spell.GetSpellInfo(spellID)
	dampeningtext = spellInfo and spellInfo.name
else
	dampeningtext = GetSpellInfo(spellID)
end

local widgetSetID = C_UIWidgetManager.GetTopCenterWidgetSetID()
local widgetSetInfo = C_UIWidgetManager.GetWidgetSetInfo(widgetSetID)

local getDampeningValue
if GetPlayerAuraBySpellID then
	getDampeningValue = function()
			  --1	 2	 	3		4			5			6			   7			8				9				  10		11			12				13			14		15		   16
		local name, icon, count, debuffType, duration, expirationTime, source, isStealable, nameplateShowPersonal, spellID, canApplyAura, isBossDebuff, nameplateShowAll, noIdea, timeMod, percentage = GetPlayerAuraBySpellID(spellID) -- FindAuraByName(dampeningtext, unit, "HARMFUL")GetPlayerAuraBySpellID 
		return percentage
	end
elseif C_UnitAuras and C_UnitAuras.GetPlayerAuraBySpellID then
	getDampeningValue = function()
		local aura = C_UnitAuras.GetPlayerAuraBySpellID(spellID)
		if aura then return aura.points[1] end
	end
end



--this will maybe be the prefered way in the future

-- local widgetInfo = {
-- 	hasTimer = false,
-- 	orderIndex = 999999,
-- 	widgetTag = "dampening",
-- 	inAnimType = false,
-- 	outAnimType = false,
-- 	layoutDirection = Enum.UIWidgetLayoutDirection.Vertical
-- }
--local frame = UIWidgetTopCenterContainerFrame:CreateWidget(99999999, 0, UIWidgetManager:GetWidgetTypeInfo(0), widgetInfo)

frame:SetScript("OnEvent", function(self, event, ...) self[event](self, ...) end)
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:SetScript("OnEnter", nil)
frame:SetScript("OnLeave", nil)
frame:SetPoint(UIWidgetTopCenterContainerFrame.verticalAnchorPoint, UIWidgetTopCenterContainerFrame, UIWidgetTopCenterContainerFrame.verticalRelativePoint, 0, widgetSetInfo.verticalPadding)
frame.Text:SetParent(frame)
frame:SetWidth(200)
frame.Text:SetAllPoints()
frame.Text:SetJustifyH("CENTER")


function frame:UNIT_AURA(unit)
	local percentage = getDampeningValue()
		--local percentage = C_Commentator_GetDampeningPercent()
	if percentage and percentage > 0 then
		if not self:IsShown() then
			self:Show()
		end
		if self.dampening ~= percentage then
			self.dampening = percentage
			self.Text:SetText(dampeningtext..": "..percentage.."%")
		end

	elseif self:IsShown() then
		self:Hide()
	end
end

function frame:PLAYER_ENTERING_WORLD()
	local _, instanceType = IsInInstance()
	if instanceType == "arena" then
		self:RegisterUnitEvent("UNIT_AURA", "player")
	else
		self:UnregisterEvent("UNIT_AURA")
		self:Hide()
	end
end