--                             --
--- Keybindings for AwesomeWM ---
--                             --

-- Includes --

-- Load Luarocks modules
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")

-- Hotkeys library
local hotkeys_popup = require("awful.hotkeys_popup")

-- Begin keybindings --

-- Set mod key

modkey = "Mod4"

globalkeys = gears.table.join(

    -- AwesomeWM --

         -- Toggle titlebar
        awful.key({modkey}, "`", function(c) awful.titlebar.toggle(c, 'left') end, {
            description = "Toggle titlebar",
            group = "AwesomeWM"
        }),

    -- Workspaces --

        -- Previous workspace
        awful.key({modkey}, "Left", awful.tag.viewprev, {
            description = "Previous workspace",
            group = "Workspaces"
        }),

        -- Next workspace
        awful.key({modkey}, "Right", awful.tag.viewnext, {
            description = "Next workspace",
            group = "Workspaces"
        }),

    -- Window management --

        -- Switch layout
        awful.key({modkey, "Shift"}, "space", function() awful.layout.inc(1) end, {
            description = "Switch layout",
            group = "Windows"
        }),

        -- Toggle floating mode
        awful.key({modkey, "Control"}, "space", awful.client.floating.toggle, {
            description = "Toggle floating mode",
            group = "Windows"
        }),

        -- Toggle Fullscreen
        awful.key({modkey, "Shift"}, "f", function(c) c.fullscreen = not c.fullscreen c:raise() end, {
            description = "Toggle fullscreen mode",
            group = "Windows"
        }),

        -- Close window
        awful.key({modkey, "Shift"}, "q", function(c) c:kill() end, {
            description = "Close window",
            group = "Windows"
        }),

        -- Focus next client
        awful.key({modkey, "Shift"}, "j", function() awful.client.focus.byidx(1) end, {
            description = "Focus next client",
            group = "Windows"
        }),

        -- Focus previous client
        awful.key({modkey, "Shift"}, "k", function() awful.client.focus.byidx(-1) end, {
            description = "Focus previous client",
            group = "Windows"
        }),

        -- Swap with next client
        awful.key({modkey, "Control"}, "j", function() awful.client.swap.byidx(1) end, {
            description = "Swap with next client",
            group = "Windows"
        }),

        -- Swap with previous client
        awful.key({modkey, "Control"}, "k", function() awful.client.swap.byidx(-1) end, {
            description = "Swap with previous client",
            group = "Windows"
        }),

        -- Focus previous in history
        awful.key({modkey}, "Tab", function() awful.client.focus.history.previous() if client.focus then client.focus:raise() end end, {
            description = "Focus previous in history",
            group = "Windows"
        }),

    -- Applications and menus --

        -- Open terminal
        awful.key({modkey}, "Return", function() awful.spawn(terminal) end, {
            description = "Open terminal",
            group = "Applications and menus"
        }),

        -- Open launcher
        awful.key({modkey}, "space", function() awful.spawn.with_shell("rofi -show drun -display-drun 'App Launcher'") end, {
            description = "Open terminal",
            group = "Applications and menus"
        }),

        -- Applications menu
        awful.key({"Mod1"}, "space", function() awful.spawn.with_shell("cat ~/.config/jgmenu/jgmenu | jgmenu --simple") end, {
            description = "Applications menu",
            group = "Applications and menus"
        }),

        -- Power menu
        awful.key({modkey}, "Escape", function() awful.spawn.with_shell("~/.bin/rofi-power") end, {
            description = "Power menu",
            group = "Applications and menus"
        }),

        -- Help menu
        awful.key({modkey}, "/", hotkeys_popup.show_help, {
            description = "Hotkey menu",
            group = "Applications and menus"
        })

)
