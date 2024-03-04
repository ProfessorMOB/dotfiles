local io = require("io")

local M = {}

M.set_default = function() 

	JSON_file = io.open(vim.fs.normalize("$HOME/.config/themes.json"))
	if (JSON_file) then JSON = JSON_file:read("*a") JSON_file:close() end
	JSON = vim.json.decode(JSON)

	local neovim = JSON.default
	local lualine = JSON.default
	
	if (JSON[JSON.default]) then 

		neovim=JSON[JSON.default].rest
		lualine=JSON[JSON.default].rest

		if (JSON[JSON.default]).neovim then
			neovim = JSON[JSON.default].neovim 
		end
		if (JSON[JSON.default].lualine) then
			lualine = JSON[JSON.default].lualine
		end
	end
	
	vim.cmd.colorscheme(neovim)
	require("lualine").setup({ options = { theme = lualine } })
end

return M
