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

-- Bling bling
local bling = require("bling")

-- Sweet animations
local awestore = require("awestore")

-- Layout editor
local machi = require("layout-machi")

-- Discord
local discord_anim_y = awestore.tweened(5120, {
    duration = 500,
    easing = awestore.easing.cubic_in_out
})

local discord_anim_x = awestore.tweened(1440, {
    duration = 500,
    easing = awestore.easing.cubic_in_out
})

local discord_scratch = bling.module.scratchpad:new {
    command = "discocss",
    rule = { instance = "discord" },
    sticky = true,
    autoclose = true,
    floating = true,
    geometry = {x=1440, y=400, height=2000, width=2400},
    reapply = true,
    dont_focus_before_close  = false,
    awestore = {x = discord_anim_x, y = discord_anim_y}
}

-- Terminal
local terminal_anim_y = awestore.tweened(-1000, {
    duration = 500,
    easing = awestore.easing.cubic_in_out
})

local terminal_anim_x = awestore.tweened(0, {
    duration = 500,
    easing = awestore.easing.cubic_in_out
})

local terminal_scratch = bling.module.scratchpad:new {
    command = "kitty --class kitty_scratch",
    rule = { instance = "kitty_scratch" },
    sticky = true,
    autoclose = true,
    floating = true,
    geometry = {x=0, y=0, height=1000, width=5120},
    reapply = true,
    dont_focus_before_close  = false,
    awestore = {x = terminal_anim_x, y = terminal_anim_y}
}

-- Spotify
local spotify_anim_y = awestore.tweened(2880, {
    duration = 500,
    easing = awestore.easing.cubic_in_out
})

local spotify_anim_x = awestore.tweened(5120, {
    duration = 500,
    easing = awestore.easing.cubic_in_out
})

local spotify_scratch = bling.module.scratchpad:new {
    command = "spotify --no-zygote",
    rule = { instance = "spotify" },
    sticky = true,
    autoclose = true,
    floating = true,
    geometry = {x=700, y=700, height=2000, width=3000},
    reapply = true,
    dont_focus_before_close  = false,
    awestore = {x = spotify_anim_x, y = spotify_anim_y}
}

-- Tag preview
bling.widget.tag_preview.enable {
    show_client_content = true,
    x = 2880,
    y = 100,
    scale = 0.25,
    honor_padding = false,
    honor_workarea = false
}

-- Begin keybindings --

-- Set mod key

modkey = "Mod4"

globalkeys = gears.table.join(

    -- AwesomeWM --

         -- Toggle titlebar
         awful.key({modkey}, '`', function() awful.titlebar.toggle(client.focus) end, {
             description = "Toggle title bar", group = "AwesomeWM"
         }),

         -- Toggle swallowing
         awful.key({modkey}, 's', function() bling.module.window_swallowing.toggle() end, {
            description = 'Toggle swallowing', group = "AwesomeWM"
         }),

    -- Scratchpad --

         -- Discord
         awful.key({modkey, "Control"}, 'd', function() discord_scratch:toggle() end, {
             description = "Toggle Discord scratchpad", group = "Scratchpad"
         }),

         -- Terminal
         awful.key({modkey, "Control"}, 't', function() terminal_scratch:toggle() end, {
             description = "Toggle terminal scratchpad", group = "Scratchpad"
         }),

         -- Spotify
         awful.key({modkey, "Control"}, 's', function() spotify_scratch:toggle() end, {
             description = "Toggle spotify scratchpad", group = "Scratchpad"
         }),

    -- Machi --

        -- Edit the current layout
        awful.key({modkey}, "'", function() machi.default_editor.start_interactive() end, {
            description = "Edit the current layout",
            group = "Machi"
        }),

        -- Switch windows in Machi layout
        awful.key({modkey}, ".", function() machi.switcher.start(client.focus) end, {
            description = "Switch windows in Machi layout",
            group = "Machi"
        }),

        -- Switch layout to Machi
        awful.key({modkey}, ",", function() awful.layout.set(machi.default_layout) end, {
            description = "Switch layout to Machi",
            group = "Machi"
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
