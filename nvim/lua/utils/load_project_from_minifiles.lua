local M = {}

M.project = nil

M.check_for_project_dir = function()
	local path_on_cursor = require("mini.files").get_fs_entry().path
	local projects = require("neovim-project.utils.path").get_all_projects()
	for _, project in ipairs(projects) do
		-- print(project)
		if (vim.fn.expand(project) == path_on_cursor) then
			M.project = project
			return true
		end
	end
	return false
end

M.load_project = function()
	
	print(M.check_for_project_dir())
	print(M.project)
	-- print(vim.fn.expand(require("neovim-project.utils.history").get_recent_projects()[1]))
end

return M
