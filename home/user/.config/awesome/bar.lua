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

-- Panel --
-- awesome_menu = {
--    { "Hotkeys", function() awful.hotkeys_popup.show_help(nil, awful.screen.focused()) end },
--    { "Edit config", editor_cmd .. " " .. awful.awesome.conffile },
--    { "Restart", awful.awesome.restart },
-- }

local icon_awesome = wibox.widget {
    widget = wibox.widget.imagebox,
    image = gfs.get_configuration_dir() .. "icons/awesome.png",
    resize = true
}

local awesome_icon = wibox.widget {
    {
        icon_awesome,
        top = dpi(5),
        bottom = dpi(5),
        left = dpi(10),
        right = dpi(5),
        widget = wibox.container.margin
    },
    bg = beautiful.bg_normal,
    widget = wibox.container.background
}

awesome_icon:buttons(gears.table.join(awful.button({}, 1, function()
    awesome.emit_signal("widgets::start::toggle", awful.screen.focused)
end)))

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
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
        awful.button({}, 1, function() awful.layout.inc(1) end),
        awful.button({}, 3, function() awful.layout.inc(-1) end)
    ))

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen = s,
        filter = awful.widget.taglist.filter.all,
        buttons = taglist_buttons
    }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen = s,
        filter = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons
    }

    -- Create the wibox
    s.mywibox = awful.wibar({
        position = "bottom",
        screen = s,
        height = 60,
        visible = true,
        type = "desktop",
        bg = "#1f252a"
    })

    -- Add widgets to the wibox
    s.mywibox:setup{
        {
           layout = wibox.layout.fixed.horizontal,
           awesome_icon,
           s.mytaglist,
           spacing = 15,
             spacing_widget = {
               color = beautiful.fg_focus,
               shape = gears.shape.powerline,
               widget = wibox.widget.separator
             },
        },
        layout = wibox.layout.fixed.horizontal,
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            s.mylayoutbox
        }
    }
end)

