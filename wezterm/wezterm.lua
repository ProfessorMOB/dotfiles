local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- config.custom_block_glyphs = true
-- config.allow_square_glyphs_to_overflow_width = "Always"
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }
config.color_scheme = "tokyonight"
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
