local wezterm = require("wezterm")
local os = require("os")
local io = require("io")
local theme_manager = wezterm.plugin.require("https://www.github.com/ProfessorMOB/theme-manager.wezterm")
 
local config = wezterm.config_builder()   
theme_manager.apply_to_config(config, wezterm, {})

-- config.custom_block_glyphs = false
-- config.allow_square_glyphs_to_overflow_width = "Always"
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
-- config.cell_widths = {
-- 	{ first = 0xFDFD, last = 0xFDFD, width = 6 }, -- BismIllah
	-- { first = 0xFEF5, last = 0xFEFC, width = 1 }, -- Lam Alef Ligature
-- }
-- config.allow_square_glyphs_to_overflow_width = "Always"
-- config.treat_east_asian_ambiguous_width_as_wide = true

config.keys = {
	{
		key = 'n', 
		mods = "SHIFT|CTRL", 
		action = wezterm.action.ToggleFullScreen,
	},
}

-- config.native_macos_fullscreen_mode = true

return config
