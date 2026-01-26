local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- =========================================================
-- PERFORMANCE (The "Go Fast" Section)
-- =========================================================
-- Use OpenGL for better latency on Intel graphics
config.front_end = "OpenGL"

-- Force XWayland (often snappier than native Wayland on some setups)
config.enable_wayland = false

-- Limit rendering to 60 FPS (matches most laptop screens)
config.max_fps = 60

-- Reduce idle resource usage (since you don't use blinking cursors)
config.animation_fps = 1

-- Limit scrollback to save RAM
config.scrollback_lines = 3500
config.enable_scroll_bar = false

-- OPTIONAL: Uncomment the lines below if it's still slow while scrolling code
-- config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }

-- =========================================================
-- APPEARANCE & UX
-- =========================================================
config.color_scheme = "catppuccin-mocha"
config.hide_tab_bar_if_only_one_tab = true

config.window_background_opacity = 1.0

-- Dim inactive panes slightly to focus on the active one
config.inactive_pane_hsb = {
  saturation = 0.9,
  brightness = 0.8,
}

config.window_padding = {
  left = 0,
  right = 0,
  top = 5,
  bottom = 0,
}

-- =========================================================
-- CURSOR
-- =========================================================
config.default_cursor_style = "SteadyBlock"
config.cursor_blink_rate = 0

return config
