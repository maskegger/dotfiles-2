local wezterm = require 'wezterm';

return {
  front_end = "OpenGL",
  font = wezterm.font({'Iosevka', stretch="UltraCondensed", weight="Regular"}),
  font_size = 11,
  colors = {
      foreground = "#d5d5d5",
      background = "#181e23",
      cursor_bg = "#d5d5d5",
      cursor_fg = "#d5d5d5",
      cursor_border = "#d5d5d5",
      selection_fg = "#181e23",
      selection_bg = "#d5d5d5",
      scrollbar_thumb = "#d5d5d5",
      split = "#384149",
      ansi = {"#384149", "#ff8080", "#97d59b", "#fffe80", "#80d1ff", "#c780ff", "#ace1ff", "#d5d5d5"},
      brights = {"#384149", "#ff8080", "#97d59b", "#fffe80", "#80d1ff", "#c780ff", "#ace1ff", "#d5d5d5"},
      indexed = {[136] = "#d5d5d5"},
  },
  window_padding = {
    left = 20,
    right = 20,
    top = 20,
    bottom = 20,
  },
  enable_tab_bar = false,
  default_cursor_style = "BlinkingBar",
}
