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

-- Notification library
local naughty = require("naughty")

-- Menubar library
local menubar = require("menubar")

-- Keybindings
require("keys")

-- Menu bar
require("bar")

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
    awesome.connect_signal("debug::error", function(err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({
            preset = naughty.config.presets.critical,
            title = "An error happened",
            text = tostring(err)
        })
        in_error = false
    end)
end

-- This is used later as the default terminal and editor to run.
terminal = "kitty"
editor = os.getenv("EDITOR") or "nano"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
modkey = "Mod4"

-- Wibar
-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
                            awful.button({}, 1, function(t) t:view_only() end),
                            awful.button({modkey}, 1, function(t)
        if client.focus then client.focus:move_to_tag(t) end
    end), awful.button({}, 3, awful.tag.viewtoggle),
                            awful.button({modkey}, 3, function(t)
        if client.focus then client.focus:toggle_tag(t) end
    end), awful.button({}, 4, function(t) awful.tag.viewnext(t.screen) end),
                            awful.button({}, 5, function(t)
        awful.tag.viewprev(t.screen)
    end))

local tasklist_buttons = gears.table.join(
                             awful.button({}, 1, function(c)
        if c == client.focus then
            c.minimized = true
        else
            c:emit_signal("request::activate", "tasklist", {raise = true})
        end
    end), awful.button({}, 3, function()
        awful.menu.client_list({theme = {width = 250}})
    end), awful.button({}, 4, function() awful.client.focus.byidx(1) end),
                             awful.button({}, 5, function()
        awful.client.focus.byidx(-1)
    end))

local function set_wallpaper(s) end

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)

    -- Each screen has its own tag table.
    awful.tag({"1", "2", "3", "4", "5", "6", "7", "8", "9"}, s,
              awful.layout.layouts[1])

    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                              awful.button({}, 1,
                                           function() awful.layout.inc(1) end),
                              awful.button({}, 3,
                                           function()
            awful.layout.inc(-1)
        end), awful.button({}, 4, function() awful.layout.inc(1) end),
                              awful.button({}, 5,
                                           function()
            awful.layout.inc(-1)
        end)))

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
        height = 30,
        visible = true,
        type = "desktop"
    })

    -- Add widgets to the wibox
    s.mywibox:setup{
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            s.mytaglist
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            wibox.widget.systray(),
            mytextclock,
            s.mylayoutbox
        }
    }
end)

-- Key bindings
-- awful.key({modkey, "Control"}, "n", function()
--     local c = awful.client.restore()
--     -- Focus restored client
--     if c then
--         c:emit_signal("request::activate", "key.unminimize", {raise = true})
--     end
-- end, {description = "restore minimized", group = "client"}), -- Prompt
-- clientkeys = gears.table.join(awful.key({modkey}, "n", function(c)
--     -- The client currently has the input focus, so it cannot be
--     -- minimized, since minimized clients can't have the focus.
--     c.minimized = true
-- end, {description = "minimize", group = "client"}),
--
-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
-- for i = 1, 9 do
--     globalkeys = gears.table.join(globalkeys, -- View tag only.
--     awful.key({modkey}, "#" .. i + 9, function()
--         local screen = awful.screen.focused()
--         local tag = screen.tags[i]
--         if tag then tag:view_only() end
--     end, {description = "view tag #" .. i, group = "tag"}),
--     -- Toggle tag display.
--                                   awful.key({modkey, "Control"}, "#" .. i + 9,
--                                             function()
--         local screen = awful.screen.focused()
--         local tag = screen.tags[i]
--         if tag then awful.tag.viewtoggle(tag) end
--     end, {description = "toggle tag #" .. i, group = "tag"}),
--     -- Move client to tag.
--                                   awful.key({modkey, "Shift"}, "#" .. i + 9,
--                                             function()
--         if client.focus then
--             local tag = client.focus.screen.tags[i]
--             if tag then client.focus:move_to_tag(tag) end
--         end
--     end, {description = "move focused client to tag #" .. i, group = "tag"}),
--     -- Toggle tag on focused client.
--                                   awful.key({modkey, "Control", "Shift"},
--                                             "#" .. i + 9, function()
--         if client.focus then
--             local tag = client.focus.screen.tags[i]
--             if tag then client.focus:toggle_tag(tag) end
--         end
--     end, {description = "toggle focused client on tag #" .. i, group = "tag"}))
-- end
--
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
    awful.titlebar(c, {position = 'left', size = '40'}):setup{
        {
            {
                awful.titlebar.widget.closebutton(c),
                awful.titlebar.widget.minimizebutton(c),
                awful.titlebar.widget.maximizedbutton(c),
                layout = wibox.layout.fixed.vertical,
                widget
            },
            {
                {
                    align = "center",
                    widget = awful.titlebar.widget.iconwidget('none')
                },
                buttons = buttons,
                layout = wibox.layout.flex.vertical
            },
            {

                awful.titlebar.widget.floatingbutton(c),
                awful.titlebar.widget.stickybutton(c),
                awful.titlebar.widget.ontopbutton(c),
                spacing = -1,
                layout = wibox.layout.fixed.vertical,
                widget

            },
            layout = wibox.layout.align.vertical
        },
        widget = wibox.container.margin,
        left = 10,
        right = 10,
        top = 10,
        bottom = 10
    }
end)

awful.titlebar.enable_tooltip = false

beautiful.useless_gap = 20
beautiful.gap_single_client = true

-- Theme
beautiful.init("/home/matei/.config/awesome/quiet/theme.lua")

-- Corners
client.connect_signal("manage", function(c)
    c.shape = function(cr, w, h) gears.shape.rounded_rect(cr, w, h, 20) end
end)

-- Autostart apps
awful.spawn.with_shell("~/.config/awesome/autorun.sh")

-- Layouts
awful.layout.layouts = {
    awful.layout.suit.fair, awful.layout.suit.tile, awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom, awful.layout.suit.tile.top,
    awful.layout.suit.floating
}

-- Helpers

helpers.resize_gaps = function(amt)
    local t = awful.screen.focused().selected_tag
    t.gap = t.gap + tonumber(amt)
    awful.layout.arrange(awful.screen.focused())
end

helpers.resize_gaps(-10)
