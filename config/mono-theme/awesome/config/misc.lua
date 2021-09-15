-- Standard awesome library
local gears = require("gears")
local awful = require("awful")

-- Theme handling library
local beautiful = require("beautiful")

-- Misc libraries
local bling = require("bling")
local machi = require("layout-machi")

-- Layouts
awful.layout.layouts = {
    awful.layout.suit.fair,
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.top,
    awful.layout.suit.tile.bottom,
    bling.layout.centered,
    bling.layout.deck,
    bling.layout.equalarea,
    bling.layout.mstab,
    machi.default_layout,
    awful.layout.suit.floating,
}

machi.editor.nested_layouts = {
    ["0"] = awful.layout.suit.fair,
    ["1"] = awful.layout.suit.tile,
    ["2"] = awful.layout.suit.tile.left,
    ["3"] = awful.layout.suit.tile.top,
    ["4"] = awful.layout.suit.tile.bottom,
    ["5"] = bling.layout.centered,
    ["6"] = bling.layout.deck,
    ["7"] = bling.layout.equalarea,
    ["8"] = bling.layout.mstab,
}


-- Corners
client.connect_signal("manage", function(c)
    c.shape = function(cr, w, h, r) gears.shape.rounded_rect(cr, w, h, 0) end
end)


awful.screen.connect_for_each_screen(function(s)
    bling.module.tiled_wallpaper("x", s, {
        fg = "#d5d5d5",
        bg = "#d5d5d5",
        offset_y = 25,
        offset_x = 25,
        font = "Hack",
        font_size = 14,
        padding = 100,
        zickzack = true
    })
end)

-- Flash focus
bling.module.flash_focus.disable()
