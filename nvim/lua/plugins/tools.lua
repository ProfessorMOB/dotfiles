local function to_possesion_path(path)
    path = path:gsub("^" .. os.getenv("HOME"), "~")
    path = path:gsub("/$", "")
    return path
end

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
		--> Setup Neovim Session Management
	{
		"natecraddock/workspaces.nvim",
		config = function()

			require("telescope").load_extension("workspaces")

			require("workspaces").setup({
				path = vim.fn.expand("~/Centralized Personal Folder/sessions/workspaces"),
				hooks = {
					open_pre = {
						function() 
							if require("workspaces").name() == "home" then return end
							if require("workspaces").path() then 
								require("auto-session").SaveSession()
							end
						end
					},
					-- and require("workspaces").path() ~= vim.fn.getcwd() .. "/" 
					open = {
						function()
							if require("auto-session").session_exists_for_cwd() then
								require("auto-session").RestoreSession(nil, false)
							else
								vim.cmd(":wa")
								vim.cmd("silent! %bw!")
								vim.cmd("clearjumps")
								if require("workspaces").name() == "home" then
									vim.cmd("Alpha")
									return 
								end
								require("auto-session").SaveSession(nil, false)
							end
						end
					},
				},
			})
		end,
		dependencies = { "nvim-telescope/telescope.nvim" },
	},
	{
		"rmagatti/auto-session",
		config = function()
			require("auto-session").setup({
				root_dir = vim.fn.expand("~/Centralized Personal Folder/sessions/sessions"),
				auto_save = function() 

					if require("workspaces").name() == "home" then 
						return false
					end
					return true
				end,
				auto_restore = false,
				auto_create = function()

					if require("workspaces").path() then 
						if require("workspaces").name() == "home" then 
							return false
						end
						return true
					end
					return false
				end,
				suppressed_dirs = { "~" },
			})
		end,
		dependencies = {
			{ "natecraddock/workspaces.nvim" },
		},
	},
	-- {
	-- 	"coffebar/neovim-project",
	-- 	opts = {
	-- 		projects = { -- define project roots
	-- 			"~/.config/",
	-- 			"~/Projects/**/*",
	-- 		},
	-- 		last_session_on_startup = false,
	-- 	},
	-- 	init = function()
	-- 		-- enable saving the state of plugins in the session
	-- 		vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
	-- 	end,
	-- 	dependencies = {
	-- 		{ "nvim-lua/plenary.nvim" },
	-- 		{ "nvim-telescope/telescope.nvim", tag = "0.1.4" },
	-- 		{ "Shatur/neovim-session-manager" },
	-- 	},
	-- 	lazy = false,
	-- 	priority = 100,
	-- },
	-- {
	-- 	"numToStr/FTerm.nvim",
	-- },
}
