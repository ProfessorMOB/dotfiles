local M = {}

M.check_for_project_dir = function()
	local path_on_cursor = require("mini.files").get_fs_entry().path
	local projects = require("neovim-project.utils.path").get_all_projects()
	for _, project in ipairs(projects) do
		print(vim.fn.expand(project))
		if (vim.fn.expand(project) == path_on_cursor) then
			return true
		end
	end
	return false
end

M.load_project = function()
end

return M
