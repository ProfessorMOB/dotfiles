local M = {}
M.dashboard = function()
	local dashboard = require("alpha.themes.dashboard")
	
	dashboard.section.header.val = {
		"           ▄ ▄                   ",
		"       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ",
		"       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ",
		"    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ",
		"  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ",
		"  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄",
		"▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █",
		"█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █",
		"    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ",
	}
	dashboard.section.footer.val= {
		"In the name of Allah", 
		" the Most Graceful,",
		" the Most Merciful,",
		-- "        ﷳ  ﷲ",
		-- "     ﷽             ",
	}
	dashboard.section.buttons.val = { 
		dashboard.button("h", " Open Recent Projects", ":Telescope neovim-project history<CR>"),
		dashboard.button("o", "󰙅 Browse Filesystem", ":lua MiniFiles.open()<CR>"),
		dashboard.button("n", " Write/Take Notes", ":Neorg workspace notes<CR>"),
		dashboard.button("l", "󰒲 Open Lazy", ":Lazy<CR>"),
		dashboard.button("q", " Quit Neovim", ":qa<CR>"),
	}
	return dashboard.config
end

return M
