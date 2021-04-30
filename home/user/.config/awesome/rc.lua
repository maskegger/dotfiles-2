-- Load Luarocks modules
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
local helpers = {}

-- Widget and layout library
local wibox = require("wibox")

-- Theme handling library
local beautiful = require("beautiful")
beautiful.init("/home/matei/.config/awesome/quiet/theme.lua")

-- Notification library
local naughty = require("naughty")

-- Menubar library
local menubar = require("menubar")

-- Keybindings
require("keys")

-- Menu bar
require("bar")

-- Bling bling
local bling = require("bling")

-- Layouts
local machi = require("layout-machi")

-- Expose-like thing
local revelation = require("revelation")
revelation.init()

-- Error handling
-- Check if awesome encountered an error during startup
if awesome.startup_errors then
    naughty.notify({
        preset = naughty.config.presets.critical,
        title = "There were errors during startup",
        text = awesome.startup_errors
    })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = tostring(err) })
        in_error = false
    end)
end

-- This is used later as the default terminal and editor to run.
terminal = "kitty"
editor = os.getenv("EDITOR") or "nano"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
modkey = "Mod4"

clientbuttons = gears.table.join(awful.button({}, 1, function(c)
    c:emit_signal("request::activate", "mouse_click", {raise = true})
end), awful.button({modkey}, 1, function(c)
    c:emit_signal("request::activate", "mouse_click", {raise = true})
    awful.mouse.client.move(c)
end), awful.button({modkey}, 3, function(c)
    c:emit_signal("request::activate", "mouse_click", {raise = true})
    awful.mouse.client.resize(c)
end))

-- Set keys
root.keys(globalkeys)

-- Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    {
        rule = {},
        properties = {
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus = awful.client.focus.filter,
            raise = true,
            keys = clientkeys,
            buttons = clientbuttons,
            screen = awful.screen.preferred,
            placement = awful.placement.no_overlap +
            awful.placement.no_offscreen
        }
    }, -- Floating clients.
    {
        rule_any = {
            class = {"Gpick", "Sxiv", "Tor Browser", "Gimp", "xtightvncviewer"}

        },
        properties = {floating = true}
    }, -- Add titlebars to normal clients and dialogs
    {
        rule_any = {type = {"normal", "dialog"}},
        properties = {titlebars_enabled = true}
    }

}

-- Signals

-- Signal function to execute when a new client appears.
client.connect_signal("manage", function(c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup and not c.size_hints.user_position and
        not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    -- buttons for the titlebar
    local buttons = gears.table.join(awful.button({}, 1, function()
        c:emit_signal("request::activate", "titlebar", {raise = true})
        awful.mouse.client.move(c)
    end), awful.button({}, 3, function()
        c:emit_signal("request::activate", "titlebar", {raise = true})
        awful.mouse.client.resize(c)
    end))
    awful.titlebar(c, {position = 'top', size = '60'}):setup{
        {
            {
                awful.titlebar.widget.closebutton(c),
                awful.titlebar.widget.minimizebutton(c),
                awful.titlebar.widget.maximizedbutton(c),
                layout = wibox.layout.fixed.horizontal,
                widget
            },
            {
                {
                    align = "center",
                    widget = awful.titlebar.widget.titlewidget(c),
                },
                buttons = buttons,
                layout = wibox.layout.flex.horizontal
            },
            {
                awful.widget.clienticon(c),
                layout = wibox.layout.fixed.horizontal,
                widget
            },
            layout = wibox.layout.align.horizontal
        },
        widget = wibox.container.margin,
        left = 8,
        right = 8,
        top = 8,
        bottom = 8
    }
end)

-- Corners
client.connect_signal("manage", function(c)
    c.shape = function(cr, w, h) gears.shape.rounded_rect(cr, w, h, 0) end
end)

-- Layouts
awful.layout.layouts = {
    awful.layout.suit.fair,
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.top,
    awful.layout.suit.tile.bottom,
    bling.layout.centered,
    machi.default_layout,
    bling.layout.mstab,
    awful.layout.suit.floating,
}

awful.screen.connect_for_each_screen(function(s)
    bling.module.tiled_wallpaper("", s, {
        fg = "#384149",
        bg = "#1f252a",
        offset_y = 15,
        offset_x = 15,
        font = "Iosevka Nerd Font",
        font_size = 15,
        padding = 100,
        zickzack = true
    })
end)

-- Autostart apps
awful.spawn.with_shell("~/.config/awesome/autorun.sh")
