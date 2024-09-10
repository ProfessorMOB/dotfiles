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
	
	if (MiniFiles.get_explorer_state().target_window) then 

		if (M.check_for_project_dir()) then
			MiniFiles.close()
			require("neovim-project.project").switch_project(vim.fs.normalize(M.project))
		else
			print("Directory is not a project")
		end
	else 
		print("A MiniFiles window must be open")
	end
end

return M

