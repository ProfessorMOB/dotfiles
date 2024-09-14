local M = {}

--[[ TODO brainstorm what to do for session management *
--
--	create a mapping that unloads the current session and then creates a
--	dashboard buffer instead
--		open the home dir, and add a checker to see if I'm switching from
--		the home dir so it doesn't save it at all
--
--	Issue: migrating all my current projects from neovim-project to 
--	workspaces.nvim and autosessions.nvim
--		disable all appropriate dashboard shortcuts temporarily /
--		delete all sessions by deleting the session directory
--		uninstall neovim-project
--		tinker with sessions and workspaces until I can get it to work in
--		the way I like it
--]]

M.project = nil

M.project_directories = { "~/Projects/git/*", "~/.config", "~/Projects/*", "~/Projects/Learning To Code/*" }

M.update_project_directories  = function() 

	local has_matched = false

	for _, dir in ipairs(M.project_directories) do 
		for str in string.gmatch(vim.fn.expand(dir), "[^\n]+") do 
			for _, workspc in ipairs(require("workspaces").get()) do
				if vim.fn.expand(workspc.path) == str .. "/" then
					has_matched = true
					break
				end
			end
			if not has_matched then
				if vim.fn.isdirectory(str) ~= 0 then 
					require("workspaces").add(str)
				end
			end
			has_matched = false
		end
	end
end

M.check_workspace = function() 

	local path_on_cursor = require("mini.files").get_fs_entry().path
	local workspaces = require("workspaces").get()

	for _, workspace in ipairs(workspaces) do 
		if (vim.fn.expand(workspace.path) == path_on_cursor .. "/") then
			M.workspace = workspace
			return true
		end
	end
end

M.load_workspace = function()
	
	if (MiniFiles.get_explorer_state().target_window) then 

		if (M.check_workspace()) then
			MiniFiles.close()
			require("workspaces").open(M.workspace.name)
		else
			print("Directory is not a project")
		end
	else 
		print("A MiniFiles window must be open")
	end
end

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

