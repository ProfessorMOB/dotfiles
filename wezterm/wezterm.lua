local wezterm = require("wezterm")
local os = require("os")
local io = require("io")

local config = wezterm.config_builder()
local theme_path = os.getenv("HOME").."/.config/themes.json"

wezterm.add_to_config_reload_watch_list(theme_path)
JSON_file = io.open(theme_path)
if (JSON_file) then JSON = JSON_file:read("*a") JSON_file:close() end
JSON = wezterm.json_parse(JSON)
--

local theme = JSON.default
if (JSON[JSON.default]) then 
	theme=JSON[JSON.default].rest
	if (JSON[JSON.default].wezterm) then
		theme=JSON[JSON.default].wezterm
	end 
end
-- config.custom_block_glyphs = true
-- config.allow_square_glyphs_to_overflow_width = "Always"
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }
config.color_scheme = theme
-- config.font = wezterm.font("robotomono nerd font propo", {weight="medium", stretch="normal", style="normal"})
config.font = wezterm.font_with_fallback({"JetBrainsMono Nerd Font Mono", {family = "Damascus", scale = 1.5}})

config.unicode_version = 13

config.window_background_opacity = 0.75
config.macos_window_background_blur = 6
config.keys = {
	{
		key = 'n', 
		mods = "SHIFT|SUPER", 
		action = wezterm.action.ToggleFullScreen,
	},
}

-- config.native_macos_fullscreen_mode = true

return config
