std = "lua51"
max_line_length = false
exclude_files = {
	"**/Libs",
}
only = {
	"011", -- syntax
	"1", -- globals
}
ignore = {
	"11/SLASH_.*", -- slash handlers
	"1/[A-Z][A-Z][A-Z0-9_]+", -- three letter+ constants
}
globals = {
	-- wow std api
	"abs",
	"acos",
	"asin",
	"atan",
	"atan2",
	"bit",
	"ceil",
	"cos",
	"date",
	"debuglocals",
	"debugprofilestart",
	"debugprofilestop",
	"debugstack",
	"deg",
	"difftime",
	"exp",
	"fastrandom",
	"floor",
	"forceinsecure",
	"foreach",
	"foreachi",
	"format",
	"frexp",
	"geterrorhandler",
	"getn",
	"gmatch",
	"gsub",
	"hooksecurefunc",
	"issecure",
	"issecurevariable",
	"ldexp",
	"log",
	"log10",
	"max",
	"min",
	"mod",
	"rad",
	"random",
	"scrub",
	"securecall",
	"seterrorhandler",
	"sin",
	"sort",
	"sqrt",
	"strbyte",
	"strchar",
	"strcmputf8i",
	"strconcat",
	"strfind",
	"string.join",
	"strjoin",
	"strlen",
	"strlenutf8",
	"strlower",
	"strmatch",
	"strrep",
	"strrev",
	"strsplit",
	"strsub",
	"strtrim",
	"strupper",
	"table.wipe",
	"tan",
	"time",
	"tinsert",
	"tremove",
	"wipe",

	-- framexml
	"getprinthandler",
	"hash_SlashCmdList",
	"setprinthandler",
	"tContains",
	"tDeleteItem",
	"tInvert",
	"tostringall",

	-- everything else
	"AceGUIWidgetLSMlists",
	"AlertFrame",
	"Ambiguate",
    "AuraUtil",
	"BackdropTemplateMixin",
	"BasicMessageDialog",
	"BattleGroundEnemies",
	"BNGetFriendIndex",
	"BNIsSelf",
	"BNSendWhisper",
	"BossBanner",
	"C_ChatInfo",
	"C_EncounterJournal",
	"C_FriendList",
	"C_GossipInfo",
	"ChatFrame_ImportAllListsToHash",
	"ChatTypeInfo",
	"CheckInteractDistance",
	"CinematicFrame_CancelCinematic",
	"C_Map",
	"CombatLogGetCurrentEventInfo",
	"CombatLog_String_GetIcon",
	"CreateFrame",
	"C_BattleNet",
	"C_Commentator",
	"C_CVar",
	"C_NamePlate",
	"C_RaidLocks",
	"C_Scenario",
	"C_Spell",
	"C_Timer",
	"C_UIWidgetManager",
	"C_UnitAuras",
	"DebuffTypeColor",
	"EJ_GetCreatureInfo",
	"EJ_GetEncounterInfo",
	"EJ_GetTierInfo",
	"ElvUI",
	"EnableAddOn",
	"FlashClientIcon",
	"GameFontHighlight",
	"GameFontNormal",
	"GameFontNormalSmall",
	"GameTooltip",
	"GameTooltip_Hide",
	"GetAddOnDependencies",
	"GetAddOnEnableState",
	"GetAddOnInfo",
	"GetAddOnMetadata",
	"GetAddOnOptionalDependencies",
	"GetBuildInfo",
	"GetClassInfo",
	"GetDifficultyInfo",
	"GetFramesRegisteredForEvent",
	"GetInstanceInfo",
	"GetItemCount",
	"GetLocale",
	"GetNumAddOns",
	"GetNumGroupMembers",
	"GetNumSpecializationsForClassID",
	"GetNumSpellTabs",
	"GetPartyAssignment",
	"GetPlayerAuraBySpellID",
	"GetPlayerFacing",
	"GetProfessionInfo",
	"GetProfessions",
	"GetRaidRosterInfo", -- Classic/AQ40/Cthun.lua
	"GetRaidTargetIndex",
	"GetRealmName",
	"GetRealZoneText",
	"GetSpecialization",
	"GetSpecializationInfoByID",
	"GetSpecializationInfoForClassID",
	"GetSpecializationRole",
	"GetSpellBookItemName",
	"GetSpellCooldown",
	"GetSpellDescription",
	"GetSpellInfo",
	"GetSpellLink",
	"GetSpellTabInfo",
	"GetSpellTexture",
	"GetSubZoneText",
	"GetTime",
	"GetTrackedAchievements",
	"InCombatLockdown",
	"IsAddOnLoaded",
	"IsAddOnLoadOnDemand",
	"IsAltKeyDown",
	"IsControlKeyDown",
	"IsEncounterInProgress",
	"IsGuildMember",
	"IsHarmfulSpell",
	"IsHelpfulSpell",
	"IsInGroup",
	"IsInRaid",
	"IsItemInRange",
	"IsLoggedIn",
	"IsPartyLFG",
	"IsSpellKnown",
	"IsTestBuild",
	"LFGDungeonReadyPopup",
	"LibStub",
	"LoadAddOn",
	"LoggingCombat",
	"MovieFrame",
	"NO",
	"ObjectiveTrackerFrame",
	"PlayerHasToy",
	"PlaySound",
	"PlaySoundFile",
	"PVPMatchScoreboard",
	"RaidBossEmoteFrame",
	"RaidNotice_AddMessage",
	"RaidWarningFrame",
	"RolePollPopup",
	"SecondsToTime",
	"SendChatMessage",
	"SetBattlefieldScoreFaction",
	"SetRaidTarget",
	"SlashCmdList",
	"StaticPopupDialogs",
	"StaticPopup_Show",
	"StopSound",
	"Tukui",
	"UIErrorsFrame",
	"UIParent",
	"UIWidgetTopCenterContainerFrame",
	"UnitAffectingCombat",
	"UnitAura",
	"UnitCanAttack",
	"UnitCastingInfo",
	"UnitClass",
	"UnitDetailedThreatSituation",
	"UnitExists",
	"UnitFactionGroup",
	"UnitGetTotalAbsorbs",
	"UnitGroupRolesAssigned",
	"UnitGUID",
	"UnitHealth",
	"UnitHealthMax",
	"UnitInParty",
	"UnitInRaid",
	"UnitInVehicle",
	"UnitIsConnected",
	"UnitIsCorpse",
	"UnitIsDead",
	"UnitIsDeadOrGhost",
	"UnitIsEnemy", -- Multiple old modules
	"UnitIsFriend", -- MoP/SiegeOfOrgrimmar/TheFallenProtectors.lua
	"UnitIsGroupAssistant",
	"UnitIsGroupLeader",
	"UnitIsPlayer",
	"UnitIsUnit",
	"UnitLevel",
	"UnitName",
	"UnitPhaseReason",
	"UnitPlayerControlled",
	"UnitPosition",
	"UnitPower",
	"UnitPowerMax",
	"UnitPowerType", -- Multiple old modules
	"UnitRace",
	"UnitSetRole",
	"UnitThreatSituation", -- Cataclysm/Bastion/Sinestra.lua
	-- Legion/TombOfSargeras/Kiljaeden.lua
	"GetTrackingInfo",
	"SetTracking",
	"GetNumTrackingTypes",
	"Minimap",
	"YES",
	"C_PvP",
	"GetBattlefieldArenaFaction",
	"GetBattlefieldScore",
	"GetBattlefieldTeamInfo",
	"GetNumBattlefieldScores",
	"IsInInstance",
	"PowerBarColor",
	"RequestBattlefieldScoreData",
	"SetMapToCurrentZone",
	"UnitDebuff",
	"UnitIsGhost",
	"GetMaxPlayerLevel",
	"GetTexCoordsForRoleSmallCircle",
	"RegisterUnitWatch",
	"RequestTicker",
	"UnitChannelInfo",
	"UnitChannelInfo",
	"WorldMapFrame",
	"GetNumArenaOpponents"
}