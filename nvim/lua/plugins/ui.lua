return {
		--> Neovim Icons
	{
		"nvim-tree/nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup()
		end
	},
		--> Theme Manager
	{
		dir = "~/Projects/git/theme-manager.nvim",
		config = function()
			require("theme-manager").setup()
		end,
		lazy = false,
	},
		--> My Colorschemes
	{
		"f4z3r/gruvbox-material.nvim",
		config = function()
			-- require("gruvbox-material").setup()
		end,
	}, {
		"ellisonleao/gruvbox.nvim",
		config = function()
			-- require("gruvbox").setup()
		end,
	}, {
		"EdenEast/nightfox.nvim",
		config = function()
			-- require("nordic").setup()
		end,
	}, {
		"phha/zenburn.nvim",
		config = function()
			-- require("zenburn").setup()
		end,
	}, {
		"ofirgall/ofirkai.nvim",
		config = function()
			
			-- require("ofirkai").setup({
			-- 	theme = "dark_blue",
			-- })
		end,
	}, {
		"AlexvZyl/nordic.nvim",
		config = function()
			-- require("nordic").setup()
		end,
	}, {
		"shaunsingh/nord.nvim",
		config = function()
			-- require("nord").set()
		end,
	}, {
		"rebelot/kanagawa.nvim",
		config = function()
			-- require("kanagawa").setup()
		end,
	}, {
		"folke/tokyonight.nvim",
		config = function() 
			-- require("tokyonight").setup()
		end,
	}, {
		"Mofiqul/dracula.nvim",
		config = function() 
			-- require("dracula").setup()
		end,
	}, {
		"catppuccin/nvim",
		config = function() 
			-- require("catppuccin").setup()
		end,
	},
		--> Setup Color Tuner
	{
		"zefei/vim-colortuner",
	},
		--> Window Management and Resizing
	{
		"kwkarlwang/bufresize.nvim",
		config = function() 
			require("bufresize").setup()
		end,
	}, 
	--[[ {	--> I can use navigator.nvim if I want to use terminal multiplexers
		"numToStr/Navigator.nvim",
		config = function()
			require("Navigator").setup()
		end,
	}, ]]
		--> Setting up my Start Screen
	{
		"goolord/alpha-nvim", 
		config = function() require("alpha").setup(
			require("alpha.themes.dashboard").config) 
		end
	},
		--> Setup Lualine
	-- {
	-- 	"nvim-lualine/lualine.nvim",
	-- 	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- 	config = function() 
	-- 		require("lualine").setup({
	-- 			options = {
	-- 				icons_enabled = false, 
	-- 				component_separators = { left = '', right = '' },
	-- 				section_separators = { left = '', right = ' ' }, 
	-- 			},
	-- 		})
	-- 	end
	-- },
		--> Make Neovim transparent so I can have a transparent neovim when working with Wezterm
		--> I don't need this, I can do "lua vim.api.nvim_set_hl(0, "LazyNormaL", {})" instead
	{
		"xiyaowong/transparent.nvim",
		config = function()
			local transparent = require("transparent")
			transparent.setup()
			transparent.clear_prefix("Telescope")
			transparent.clear_prefix("Minifiles*")
			transparent.clear_prefix("LazyNormal")
			transparent.clear_prefix("NormalFloat")
		end,
		lazy = false,
	},
}
