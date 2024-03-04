return {
		--> Setup File Explorer
	{
		"echasnovski/mini.files",
		config = function() 
			require("mini.files").setup()
		end,
	},
		--> Setup Comment.nvim
	{
		"numToStr/Comment.nvim",
		lazy = false,
		config = function()
			require("Comment").setup()
		end,
	},
		--> Setup Neovim Project Management
	{
		"coffebar/neovim-project",
		opts = {
			projects = { -- define project roots
			"~/.config/",
			"~/Centralized Personal Folder/Projects/git/*",
			"~/Centralized Personal Folder/Learning To Code/*",
			},
			last_session_on_startup = false,
		},
		init = function()
		-- enable saving the state of plugins in the session
		vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
		end,
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope.nvim", tag = "0.1.4" },
			{ "Shatur/neovim-session-manager" },
		},
		lazy = false,
		priority = 100,
	},
	-- {
	-- 	"numToStr/FTerm.nvim",
	-- },
}
