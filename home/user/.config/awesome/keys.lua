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
-- local machi = require("layout-machi")

-- Begin keybindings --

-- Set mod key

modkey = "Mod4"

globalkeys = gears.table.join(

    -- AwesomeWM --

         -- Toggle titlebar
         awful.key({modkey}, "`", function() local t = screen.primary.selected_tag for idx, c in ipairs(t:clients()) do awful.titlebar.toggle(c, 'top') end end, {
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
        awful.key({modkey, "Shift"}, "f", function() client.focus.fullscreen = not client.focus.fullscreen client.focus:raise() end, {
            description = "Toggle fullscreen mode",
            group = "Windows"
        }),

        -- Close window
        awful.key({modkey, "Shift"}, "q", function() client.focus:kill() end, {
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

        -- Minimize windows
        awful.key({modkey}, "m", function() client.focus.minimized = true end, {
            description = "Minimize windows", group = "Windows"
        }),

        -- Un-minimize windows
        awful.key({modkey, "Control"}, "m", function () local c = awful.client.restore() if c then c:activate { raise = true, context = "key.unminimize" } end end, {
            description = "Un-minimize windows", group = "Windows"
        }),

    -- Applications and menus --

        -- Open terminal
        awful.key({modkey}, "Return", function() awful.spawn(terminal) end, {
            description = "Open terminal",
            group = "Applications and menus"
        }),

        -- Open launcher
        awful.key({modkey}, "space", function() awful.spawn.with_shell("rofi -show drun -display-drun 'App Launcher' -dpi 196") end, {
            description = "Open terminal",
            group = "Applications and menus"
        }),

        -- Switch windows
        awful.key({modkey}, "Tab", function() awful.spawn.with_shell("rofi -show window -display-window 'Switch windows' -dpi 196") end, {
            description = "Switch windows",
            group = "Applications and menus"
        }),

        -- Calculator
        awful.key({modkey}, "c", function() awful.spawn.with_shell("rofi -show calc -modi calc -no-shwo-match -no-sort -display-calc 'Calculator' -dpi 196") end, {
            description = "Calculator",
            group = "Applications and menus"
        }),

        -- Wallpaper switcher
        awful.key({modkey}, "b", function() awful.spawn.with_shell("~/.bin/rofi-wallpaper") end, {
            description = "Wallpaper switcher",
            group = "Applications and menus"
        }),

        -- Screenshot
        awful.key({modkey}, "s", function() awful.spawn.with_shell("~/.bin/rofi-screenshot") end, {
            description = "Screenshot",
            group = "Applications and menus"
        }),

        -- Image to text
        awful.key({modkey, "Shift"}, "s", function() awful.spawn.with_shell("~/.bin/rofi-imgtext") end, {
            description = "Image to text",
            group = "Applications and menus"
        }),

        -- Shorten url
        awful.key({modkey}, "u", function() awful.spawn.with_shell("~/.bin/rofi-urlshorten") end, {
            description = "Shorten URL",
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

for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys, 

    awful.key({modkey}, "#" .. i + 9, function() local screen = awful.screen.focused() local tag = screen.tags[i] if tag then tag:view_only() end end, {
        description = "View workspace #" .. i,
        group = "Workspaces"
    }),

    awful.key({modkey, "Shift"}, "#" .. i + 9, function() if client.focus then local tag = client.focus.screen.tags[i] if tag then client.focus:move_to_tag(tag) end end end, {
        description = "Move focused client to workspace #" .. i,
        group = "Workspaces"
    }))
end
--         -- Machi --
--         awful.keyboard.append_global_keybindings(
--     {
--         awful.key({modkey}, ".",
--                   function() machi.default_editor.start_interactive() end, {
--             description = "edit the current layout if it is a machi layout",
--             group = "layout"
--         }),
--         awful.key({modkey}, ",",
--                   function() machi.switcher.start(client.focus) end, {
--             description = "switch between windows for a machi layout",
--             group = "layout"
--         })
--     })
