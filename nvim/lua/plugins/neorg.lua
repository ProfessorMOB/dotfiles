return {
		--> Setup Neorg
	{
		"vhyrro/luarocks.nvim",
		priority = 1000, -- We'd like this plugin to load first out of the rest
		config = true, -- This automatically runs `require("luarocks-nvim").setup()`
	},
	{
		"nvim-neorg/neorg",
		dependencies = { "luarocks.nvim"},
		lazy = false, 
		version = "*",
		config = function()
			require("neorg").setup {
				load = {
					["core.defaults"] = {}, -- Loads default behaviour
					["core.concealer"] = {}, -- Adds pretty icons to your documents
					["core.dirman"] = { -- Manages Neorg workspaces
						config = {
							workspaces = {
								notes = "~/Centralized Personal Folder/notes",
							},
							default_workspace = "notes",
						},
					},
					["core.keybinds"] = {
						config = {
							neorg_leader = "<Space>",
						},
					},
				},
			}
		end,
	},
}
