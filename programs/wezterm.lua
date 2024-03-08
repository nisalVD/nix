local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- general
config.automatically_reload_config = true
config.hide_tab_bar_if_only_one_tab = true

-- color scheme
config.color_scheme = "tokyonight_night"

-- font
config.font = wezterm.font({
	family = "JetBrains Mono",
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
})
config.line_height = 1.2
config.font_size = 15

config.use_dead_keys = false
config.scrollback_lines = 5000

-- bell
config.audible_bell = "Disabled"

config.adjust_window_size_when_changing_font_size = false
config.hide_tab_bar_if_only_one_tab = true
config.window_frame = {
	font = wezterm.font({ family = "Noto Sans", weight = "Regular" }),
}

-- keybindings
config.keys = {
	{ key = "p", mods = "CMD", action = wezterm.action.SendString("ʫ") },
	{ key = "l", mods = "CMD", action = wezterm.action.SendString("Ó") },
	{ key = "d", mods = "CMD", action = wezterm.action.SendString("ý") },
}
config.bypass_mouse_reporting_modifiers = "ALT"

return config
