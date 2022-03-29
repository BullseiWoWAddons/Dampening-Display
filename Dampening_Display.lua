local frame = CreateFrame("Frame", "Dampening_Display" , UIParent, "UIWidgetTemplateIconAndText")
local _
local FindAuraByName = AuraUtil.FindAuraByName
local dampeningtext = GetSpellInfo(110310)
local widgetSetID = C_UIWidgetManager.GetTopCenterWidgetSetID()
local widgetSetInfo = C_UIWidgetManager.GetWidgetSetInfo(widgetSetID)


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
frame:SetPoint(UIWidgetTopCenterContainerFrame.verticalAnchorPoint, UIWidgetTopCenterContainerFrame, UIWidgetTopCenterContainerFrame.verticalRelativePoint, 0, widgetSetInfo.verticalPadding)
frame.Text:SetParent(frame)
frame:SetWidth(200)
frame.Text:SetAllPoints()
frame.Text:SetJustifyH("CENTER")


function frame:UNIT_AURA(unit)
	--     1	  2		3		4			5			6			7			8				9				  10		11			12				13				14		15		   16
	local name, icon, count, debuffType, duration, expirationTime, source, isStealable, nameplateShowPersonal, spellID, canApplyAura, isBossDebuff, nameplateShowAll, noIdea, timeMod , percentage = FindAuraByName(dampeningtext, unit, "HARMFUL")

	if percentage then
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
	end
end