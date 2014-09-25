local L = LibStub( "AceLocale-3.0" ):NewLocale( "CharmCommand", "enUS", true )

-- The chat commands
L[ "charmcommand" ] = true
L[ "charm" ]        = true
L[ "mark" ]         = true
L[ "charmtarget" ]  = true
L[ "marktarget" ]   = true
L[ "charmfocus" ]   = true
L[ "markfocus" ]    = true
L[ "charmme" ]      = true
L[ "markme" ]       = true

-- The targeting options
L[ "focus" ]        = true
L[ "target" ]       = true

-- The symbols
L[ "clear" ]        = true
L[ "remove" ]       = true
L[ "star" ]         = true
L[ "circle" ]       = true
L[ "coin" ]         = true
L[ "diamond" ]      = true
L[ "triangle" ]     = true
L[ "moon" ]         = true 
L[ "square" ]       = true 
L[ "cross" ]        = true 
L[ "x" ]            = true 
L[ "skull" ]        = true 

-- Usage strings
L[ "Usage:" ]       = "Usage:"
L[ "usagebase" ]    = "/charm <target> <charm> or /mark <target> <charm>"
L[ "usagebase2" ]   = "   Marks the specified target with the specified charm."
L[ "usageme" ]      = "/charmme <charm> or /markme <charm>"
L[ "usageme2" ]     = "   Marks you with the specified charm."
L[ "usagetarget" ]  = "/charmtarget <charm> or /marktarget <charm>"
L[ "usagetarget2" ] = "   Marks your target with the specified charm."
L[ "usagefocus" ]   = "/charmfocus <charm> or /markfocus <charm>"
L[ "usagefocus2" ]  = "   Marks your focus target with the specified charm."

-- Error strings

L[ "Error:" ]                      = true
L[ "No target or charm provided" ] = true
L[ "No charm provided" ]           = true
L[ "Invalid charm" ]               = true

-- Command descriptions

L[ "Show usage information." ] = true
