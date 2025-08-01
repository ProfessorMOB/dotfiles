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

	if (default.rest) then theme=default.rest end
	if (default.wezterm) then theme=default.wezterm end 
	if (default.opacity) then opacity=default.opacity end
	if (default.blur) then blur=default.blur end
end

config.color_scheme = theme
config.window_background_opacity = opacity
config.macos_window_background_blur = blur

-- config.custom_block_glyphs = false
config.allow_square_glyphs_to_overflow_width = "Always"
-- config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }
-- config.font = wezterm.font("robotomono nerd font propo", {weight="medium", stretch="normal", style="normal"})
-- AzarMehrMonospaced, Kawkab Mono
config.font = wezterm.font_with_fallback({
	"JetBrainsMono Nerd Font Mono", 
	-- harfbuzz_features = { 'liga=0', 'clig=0', 'calt=0' },
	{
		family = "Kawkab Mono", scale = 1, 
	}
})
config.normalize_output_to_unicode_nfc = true
config.cell_widths = {
	{ first = 0xFDFD, last = 0xFDFD, width = 6 }, -- BismIllah
	-- { first = 0xFEF5, last = 0xFEFC, width = 1 }, -- Lam Alef Ligature
}
-- config.allow_square_glyphs_to_overflow_width = "Always"
-- config.treat_east_asian_ambiguous_width_as_wide = true

config.keys = {
	{
		key = 'n', 
		mods = "SHIFT|SUPER", 
		action = wezterm.action.ToggleFullScreen,
	},
}

-- config.native_macos_fullscreen_mode = true

return config
