--> My Keymappings

vim.keymap.set('t', "<ESC>", "<C-\\><C-n>") --> Escape terminal with <ESC>

vim.keymap.set('n', "<Leader>o", MiniFiles.open) --> Open File Explorer
-- vim.keymap.set('n', "<Leader>o", require("telescope").extensions.file_browser.file_browser) --> Open File Explorer

--> Move around in the beginning/end of line using Space+e/w/b 

vim.keymap.set({'n', 'v'}, "<Leader>e", "$") --> Space+e for end of line

vim.keymap.set({'n', 'v'}, "<Leader>b", "0") --> Space+b for start of line

vim.keymap.set({'n', 'v'}, "<Leader>w", "$b") --> Soace+w for start of last word

vim.keymap.set({'n', 'v'}, "<Leader>W", "$B") --> Space+W for start of last word, whitespace-only delimited

--> Mappings to imitate Shift+Arrow-Keys movement
vim.keymap.set({'n', 'v'}, "<S-h>", "<S-Left>")

vim.keymap.set({'n', 'v'}, "<S-j>", "<S-Down>")

vim.keymap.set({'n', 'v'}, "<S-k>", "<S-Up>")

vim.keymap.set({'n', 'v'}, "<S-l>", "<S-Right>")

vim.keymap.set('n', "<Leader>p", require("utils.load_project_from_minifiles").load_project)

--[[	TODO
--	Configure so that I can navigate rightmost/leftmost then next/previous row. 
--	Issue I'm having is that when I navigate with C-W+w, I go down then right. Not ideal. 
--]]

-- vim.keymap.set('n', "<Leader>f", "<C-z>") --> 	This gives me a project idea, managing workspaces through
-- 									--	foreground tasks and job control. 
