-- Load Luarocks modules
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local gfs = require("gears.filesystem")
local awful = require("awful")
require("awful.autofocus")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

-- Widget and layout library
local wibox = require("wibox")

-- Theme handling library
local beautiful = require("beautiful")

-- Notification library
local naughty = require("naughty")

-- Menubar library
local menubar = require("menubar")

-- Wibar

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

    s.promptbox = awful.widget.prompt()
    
    clock = wibox.widget.textclock()

    -- Create the wibox
    s.wibar = awful.wibar({
        position = "bottom",
        x = 0,
        y = 0,
        screen = s,
        height = 60,
        width = 2500,
        visible = true,
        type = "dock",
        shape = function(cr, w, h, r) gears.shape.octogon(cr, w, h, 25) end,
        stretch = false,
        bg = "#1f252a",
    })

    s.wibar.x = 1280
    s.wibar.y = 2800

    -- Add widgets to the wibox
    s.wibar:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            wibox.widget {
                widget = wibox.widget.separator,
                forced_width = 30,
                opacity = 0
            },
            layout = wibox.layout.fixed.horizontal,
            s.taglist,
            wibox.widget {
                widget = wibox.widget.separator,
                forced_width = 850,
                opacity = 0
            },
            s.promptbox,
        },
        {
            layout = wibox.layout.fixed.horizontal,
        },
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            spacing = 40,
            wibox.widget.systray(),
            clock,
            s.layoutbox,
            wibox.widget {
                widget = wibox.widget.separator,
                forced_width = 1,
                opacity = 0
            },
        },
    }
end)
