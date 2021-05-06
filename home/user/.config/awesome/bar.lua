-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys")

-- Widget and layout library
local wibox = require("wibox")

-- Click to change to workspace
local taglist_buttons = gears.table.join(awful.button({}, 1, function(t) t:view_only() end))

local tasklist_buttons = gears.table.join(
                             awful.button({}, 1, function(c)
        if c == client.focus then
            c.minimized = true
        else
            c:emit_signal("request::activate", "tasklist", {raise = true})
        end
    end))

awful.screen.connect_for_each_screen(function(s)

    -- Set tags and default layout
    awful.tag({"1", "2", "3", "4", "5", "6", "7", "8", "9"}, s, awful.layout.suit.fair)

    -- Show currently used layout
    s.layoutbox = awful.widget.layoutbox(s)

    s.layoutbox:buttons(gears.table.join(
        awful.button({}, 1, function() awful.layout.inc(1) end),
        awful.button({}, 3, function() awful.layout.inc(-1) end)
    ))

    -- Taglist widget
    s.taglist = awful.widget.taglist {
        screen = s,
        filter = awful.widget.taglist.filter.all,
        buttons = taglist_buttons
    }

    -- Prompt
    s.promptbox = awful.widget.prompt()
   
    -- Clock
    clock = wibox.widget.textclock()

    -- Menu
    awesomemenu = {
     {"Hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end},
     {"Reload", awesome.restart},
     {"Quit", function() awesome.quit() end},
    }

    appmenu = {
     {"Terminal", function() awful.spawn.with_shell("kitty") end},
     {"Browser", function() awful.spawn.with_shell("qutebrowser") end},
     {"Music", function() awful.spawn.with_shell("spotify") end},
    }

    scriptmenu = {
     {"Replace app folder", function() awful.spawn.with_shell("~/.bin/apps") end},
     {"Random man pager", function() awful.spawn.with_shell("~/.bin/randman") end},
     {"Take screenshot", function() awful.spawn.with_shell("~/.bin/rofi-screenshot") end},
     {"Image to text", function() awful.spawn.with_shell("~/.bin/rofi-imgtext") end},
     {"Shorten url", function() awful.spawn.with_shell("~/.bin/rofi-urlshorten") end},
     {"Change wallpaper", function() awful.spawn.with_shell("~/.bin/rofi-wallpaper") end},
    }

    mainmenu = awful.menu({items = { 
        {"AwesomeWM", awesomemenu, beautiful.awesome_icon},
        {"Scripts", scriptmenu, beautiful.terminal},
        {"Apps", appmenu, beautiful.tux},
    }})

    launcher = awful.widget.launcher({image = beautiful.ghost, menu = mainmenu})

    -- Create the wibox
    s.wibar = awful.wibar({
        position = "bottom",
        x = 0,
        y = 0,
        screen = s,
        height = 60,
        width = 3000,
        visible = true,
        type = "dock",
        shape = function(cr, w, h, r) gears.shape.octogon(cr, w, h, 0) end,
        stretch = false,
        bg = "#1f252a",
    })

    s.wibar.x = 1150
    s.wibar.y = 2800

    -- Add widgets
    s.wibar:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            launcher,
            wibox.widget {
                widget = wibox.widget.separator,
                forced_width = 15,
                opacity = 0
            },
            layout = wibox.layout.fixed.horizontal,
            s.taglist,
            wibox.widget {
                widget = wibox.widget.separator,
                forced_width = 1000,
                opacity = 0
            },
            -- s.promptbox,
            clock,
        },
        {
            layout = wibox.layout.fixed.horizontal,
        },
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            spacing = 40,
            wibox.widget.systray(),
            s.layoutbox,
            wibox.widget {
                widget = wibox.widget.separator,
                forced_width = 1,
                opacity = 0
            },
        },
    }
end)
