local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local gcolor = require("gears.color")
local beautiful = require("beautiful")

local bg_normal = beautiful.tabbar_bg_normal or beautiful.bg_normal or "#ffffff"
local fg_normal = beautiful.tabbar_fg_normal or beautiful.fg_normal or "#000000"
local bg_focus  = beautiful.tabbar_bg_focus  or beautiful.bg_focus  or "#000000"
local fg_focus  = beautiful.tabbar_fg_focus  or beautiful.fg_focus  or "#ffffff"
local font      = beautiful.tabbar_font      or beautiful.font      or "Hack 15"
local size      = beautiful.tabbar_size      or 20
local position  = beautiful.tabbar_position  or "top"

local function create(c, focused_bool, buttons)
    local bg_temp = focused_bool and bg_focus or bg_normal
    local fg_temp = focused_bool and fg_focus or fg_normal

    local wid_temp = wibox.widget({
        {
            { -- Left
                wibox.widget.base.make_widget(awful.titlebar.widget.iconwidget(c)),
                buttons = buttons,
                layout  = wibox.layout.fixed.horizontal,
            },
            { -- Title
                wibox.widget.base.make_widget(awful.titlebar.widget.titlewidget(c)),
                buttons = buttons,
                widget  = wibox.container.place,
            },
            { -- Right
                focused_bool and wibox.widget.base.make_widget(awful.titlebar.widget.floatingbutton(c))  or nil,
                focused_bool and wibox.widget.base.make_widget(awful.titlebar.widget.stickybutton(c))    or nil,
                focused_bool and wibox.widget.base.make_widget(awful.titlebar.widget.ontopbutton(c))     or nil,
                focused_bool and wibox.widget.base.make_widget(awful.titlebar.widget.maximizedbutton(c)) or nil,
                focused_bool and wibox.widget.base.make_widget(awful.titlebar.widget.minimizebutton(c))  or nil,
                focused_bool and wibox.widget.base.make_widget(awful.titlebar.widget.closebutton(c))     or nil,
                layout = wibox.layout.fixed.horizontal,
            },
            layout = wibox.layout.align.horizontal,
        },
        bg      = bg_temp,
        fg      = fg_temp,
        widget  = wibox.container.background,
    })

    return wid_temp
end


return {
    layout    = wibox.layout.flex.horizontal,
    create    = create,
    position  = position,
    size      = size,
    bg_normal = bg_normal,
    bg_focus  = bg_focus,
}
