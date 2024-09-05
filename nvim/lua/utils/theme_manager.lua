local io = require("io")

local M = {}

M.JSON_path = vim.fs.normalize("$HOME/.config/themes.json")

M.set_default = function() 

	M.JSON_file = io.open(M.JSON_path, "r")
	if (M.JSON_file) then JSON = M.JSON_file:read("*a") M.JSON_file:close() end

	JSON = vim.json.decode(JSON)

	local neovim = JSON.default
	local lualine = JSON.default
	
	if (JSON[JSON.default]) then 

		neovim=JSON[JSON.default].rest or neovim
		lualine=JSON[JSON.default].rest or lualine

		if (JSON[JSON.default]).neovim then
			neovim = JSON[JSON.default].neovim 
		end
		if (JSON[JSON.default].lualine) then
			lualine = JSON[JSON.default].lualine
		end
	end

	vim.cmd.colorscheme(neovim)
	require("lualine").setup({ options = { theme = lualine } })

		--[[ --> Reset transparency because it turns it off for some reason
	local transparent = require("transparent")
	transparent.setup()
	transparent.clear_prefix("Telescope")
	transparent.clear_prefix("Minifiles*")
	transparent.clear_prefix("LazyNormal") ]]

	-- transparent.clear_prefix("NormalFloat")
end

M.start_watching_for_theme_changes = function()

	M.themes_file_handler = vim.uv.new_fs_event()

	M.themes_file_handler:start(
		M.JSON_path,
		{}, 
		function() 
			vim.schedule(function() M.set_default() end)
		end
	)
end

M.stop_watching_theme_changes = function()
	M.themes_file_handler:close()
	-- vim.uv.close(M.themes_file_handler)
end

return M
