local wezterm = require("wezterm")
local os = require("os")
local io = require("io")

local config = wezterm.config_builder()
local theme_path = os.getenv("HOME").."/.config/themes.json"

local JSON = ""
local theme = ""
local opacity = 0.6
local blur = 6

wezterm.add_to_config_reload_watch_list(theme_path)
local JSON_file = io.open(theme_path)
if (JSON_file) then JSON = JSON_file:read("*a") JSON_file:close() end
JSON = wezterm.json_parse(JSON)

local default = JSON[JSON.default]
local theme = JSON.default

if (default) then 

	if (default.wezterm) then theme=default.wezterm end 
	if (default.opacity) then opacity=default.opacity end
	if (default.blur) then blur=default.blur end
	if (default.rest) then theme=default.rest end
end

config.color_scheme = theme
config.window_background_opacity = opacity
config.macos_window_background_blur = blur

-- config.custom_block_glyphs = true
-- config.allow_square_glyphs_to_overflow_width = "Always"
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }
-- config.font = wezterm.font("robotomono nerd font propo", {weight="medium", stretch="normal", style="normal"})
config.font = wezterm.font_with_fallback({"JetBrainsMono Nerd Font Mono", {family = "Damascus", scale = 1.5}})

config.unicode_version = 13

config.keys = {
	{
		key = 'n', 
		mods = "SHIFT|SUPER", 
		action = wezterm.action.ToggleFullScreen,
	},
}

-- config.native_macos_fullscreen_mode = true

return config
