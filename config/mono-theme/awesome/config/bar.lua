pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")

-- Widget and layout library
local wibox = require("wibox")

-- Theme handling library
local beautiful = require("beautiful")

-- Declarative object management
local hotkeys_popup = require("awful.hotkeys_popup")

awful.screen.connect_for_each_screen(function(s)

    -- Set tags and default layout
    awful.tag({"1", "2", "3", "4", "5"}, s, awful.layout.suit.fair)

    -- Show currently used layout
    s.layoutbox = awful.widget.layoutbox(s)

    s.layoutbox:buttons(gears.table.join(
        awful.button({}, 1, function() awful.layout.inc(1) end),
        awful.button({}, 3, function() awful.layout.inc(-1) end)
    ))

    s.taglist = awful.widget.taglist {
        screen = s,
        filter = awful.widget.taglist.filter.all,
        style = {
            shape = gears.shape.squircle
        },
        layout = {
            spacing = 0,
            spacing_widget = {
                color = '#000000',
                shape = gears.shape.squircle,
                widget = wibox.widget.separator,
            },
            layout = wibox.layout.fixed.horizontal
        },
    }

    -- Battery
    battery = awful.widget.watch('bash -c "echo `cat /sys/class/power_supply/BAT0/capacity`%"', 15) 

    local battery_tooltip = awful.tooltip
    {
        objects        = { battery },
        timer_function = function()
            return io.popen("bash -c \"echo -n Status: `cat /sys/class/power_supply/BAT0/status`\""):read("*a")
        end,
        timeout=0,
        bg="#181e23",
        align="bottom_left",
        margins="5"
    }

    -- Create the bar
    s.wibar = awful.wibar({
        screen = s,
        height = 35,
        width = 200,
        visible = true,
        stretch = false,
        position = top,
        x = 0,
        y = 0,
        bg = "#000000",
    })

    -- Add widgets
    s.wibar:setup {
        layout = wibox.layout.align.horizontal,
        expand = "none",
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            wibox.layout.margin(s.taglist, 7, 7, 7, 7)
        },
        {
            layout = wibox.layout.fixed.horizontal,
        },
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            wibox.layout.margin(battery, 7, 7, 7, 7),
        },
    }
end)
