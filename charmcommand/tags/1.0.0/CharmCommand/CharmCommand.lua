-- CharmCommand
-- Version 1.0.0 by Soraia

CharmCommand = LibStub( "AceAddon-3.0" ):NewAddon( "CharmCommand", "AceConsole-3.0" )
local L = LibStub( "AceLocale-3.0" ):GetLocale( "CharmCommand" )

local options = {
   name = "CharmCommand",
   handler = CharmCommand,
   type = 'group',
   args = {
      usage = {
         type = "execute",
         name = "usage",
         desc = L[ "Show usage information." ],
         func = "UsageCmd",
      },
   },
}

local charms = {}

local colorRed = "|cffff0000"
local colorLightBlue = "|cff00e0ff"

function CharmCommand:OnInitialize()
   LibStub( "AceConfig-3.0" ):RegisterOptionsTable( "CharmCommand", options, {"charmcommand" } )

   self:BuildCharmsTable()
end

function CharmCommand:OnEnable()
   self:RegisterChatCommand( "charm", "CharmCmd" )
   self:RegisterChatCommand( "mark", "CharmCmd" )
   self:RegisterChatCommand( "charmtarget", "CharmTargetCmd" )
   self:RegisterChatCommand( "marktarget", "CharmTargetCmd" )
   self:RegisterChatCommand( "charmfocus", "CharmFocusCmd" )
   self:RegisterChatCommand( "markfocus", "CharmFocusCmd" )
   self:RegisterChatCommand( "charmme", "CharmSelfCmd" )
   self:RegisterChatCommand( "markme", "CharmSelfCmd" )
end

function CharmCommand:OnDisable()
   self:UnregisterChatCommand( "charm" )
   self:UnregisterChatCommand( "mark" )
   self:UnregisterChatCommand( "charmtarget" )
   self:UnregisterChatCommand( "marktarget" )
   self:UnregisterChatCommand( "charmfocus" )
   self:UnregisterChatCommand( "markfocus" )
   self:UnregisterChatCommand( "charmme" )
   self:UnregisterChatCommand( "markme" )
end

function CharmCommand:BuildCharmsTable()
   -- Remove the charm
   charms[ "0" ]             = 0
   charms[ L[ "clear" ] ]    = 0
   charms[ L[ "remove" ] ]   = 0
   -- Charm 1 (star)
   charms[ "1" ]             = 1
   charms[ "rt1" ]           = 1
   charms[ L[ "star" ] ]     = 1
   -- Charm 2 (circle)
   charms[ "2" ]             = 2
   charms[ "rt2" ]           = 2
   charms[ L[ "circle" ] ]   = 2
   charms[ L[ "coin" ] ]     = 2
   -- Charm 3 (diamond)
   charms[ "3" ]             = 3
   charms[ "rt3" ]           = 3
   charms[ L[ "diamond" ] ]  = 3
   -- Charm 4 (triangle)
   charms[ "4" ]             = 4
   charms[ "rt4" ]           = 4
   charms[ L[ "triangle" ] ] = 4
   -- Charm 5 (moon)
   charms[ "5" ]             = 5
   charms[ "rt5" ]           = 5
   charms[ L[ "moon" ] ]     = 5
   -- Charm 6 (square)
   charms[ "6" ]             = 6
   charms[ "rt6" ]           = 6
   charms[ L[ "square" ] ]   = 6
   -- Charm 7 (x)
   charms[ "7" ]             = 7
   charms[ "rt7" ]           = 7
   charms[ L[ "cross" ] ]    = 7
   charms[ L[ "x" ] ]        = 7
   -- Charm 8 (skull)
   charms[ "8" ]             = 8
   charms[ "rt8" ]           = 8
   charms[ L[ "skull" ] ]    = 8 
end

-- Error reporting function
function CharmCommand:Error( text )
   self:Print( colorRed .. L[ "Error:" ] .. "|r " .. text )
end

-- Usage function
function CharmCommand:PrintUsage( func )
   self:Print( colorLightBlue .. L[ "Usage:" ] .. "|r " .. L[ "usage" .. func ] )
   self:Print( L[ "usage" .. func .. "2" ] )
end

function CharmCommand:CharmCmd( input )
   if not input or strtrim( input ) == "" then
      self:Error( L[ "No target or charm provided" ] )
      self:PrintUsage( "base" )
      return
   end

   local pos = strfind( input, " " )
   if not pos then
      self:Error( L[ "No charm provided" ] )
      self:PrintUsage( "base" )
      return
   end

   local target = strsub( input, 1, pos - 1 )
   local charm  = strsub( input, pos + 1 )

   self:Charm( target, charm )
end

function CharmCommand:CharmTargetCmd( input )
   if not input or strtrim( input ) == "" then
      self:Error( L[ "No charm provided" ] )
      self:PrintUsage( "target" )
      return
   end

   self:Charm( "target", input )
end

function CharmCommand:CharmFocusCmd( input )
   if not input or strtrim( input ) == "" then
      self:Error( L[ "No charm provided" ] )
      self:PrintUsage( "focus" )
      return
   end

   self:Charm( "focus", input )
end

function CharmCommand:CharmSelfCmd( input )
   if not input or strtrim( input ) == "" then
      self:Error( L[ "No charm provided" ] )
      self:PrintUsage( "me" )
      return
   end

   self:Charm( "player", input )
end

function CharmCommand:Charm( target, charm )
   if not charms[ charm ] then
      self:Error( L[ "Invalid charm" ] )
      return
   end

   SetRaidTarget( target, charms[ charm ] )
end

function CharmCommand:UsageCmd()
   self:Print( colorLightBlue .. L[ "Usage:" ] .. "|r" )
   self:Print( L[ "usagebase" ] )
   self:Print( L[ "usagebase2" ] )
   self:Print( L[ "usageme" ] )
   self:Print( L[ "usageme2" ] )
   self:Print( L[ "usagetarget" ] )
   self:Print( L[ "usagetarget2" ] )
   self:Print( L[ "usagefocus" ] )
   self:Print( L[ "usagefocus2" ] )
end
