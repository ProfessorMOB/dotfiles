local M = {}

M.buttons = function(dashboard) 
	dashboard.section.buttons.val = { --> I used braille no dots pattern as a space lol
		dashboard.button("s", " Open Recent Sessions", ":Telescope workspaces<CR>"),
		dashboard.button("g", "󰊢 Open Git Projects", ":lua MiniFiles.open('~/Projects/git')<CR>"),
		dashboard.button("n", " Write/Take Notes", ":Neorg workspace notes<CR>:cd ~/notes<CR>"),
		dashboard.button("l", "󰒲 Open Lazy", ":Lazy<CR>"),
		dashboard.button("q", " Quit Neovim", ":qa<CR>"),
	}
end

return M
