local M = {}

M.buttons = function(dashboard) 
	dashboard.section.buttons.val = { --> I used braille no dots pattern as a space lol
		dashboard.button("h", " Open Recent Projects", ":Telescope neovim-project history<CR>"),
		dashboard.button("o", "󰙅 Browse Filesystem", ":lua MiniFiles.open()<CR>"),
		dashboard.button("n", " Write/Take Notes", ":Neorg workspace notes<CR>:cd ~/notes<CR>"),
		dashboard.button("l", "󰒲 Open Lazy", ":Lazy<CR>"),
		dashboard.button("q", " Quit Neovim", ":qa<CR>"),
	}
end

return M
