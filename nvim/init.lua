--> Load my config

require("options")

--> Setup lazy.nvim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	require("plugins.treesitter"),
	require("plugins.telescope"),
	require("plugins.ui"),
	require("plugins.tools"),
	require("plugins.indentation"),
	require("plugins.neorg"),
})

require("keymaps")

local themes = require("utils.theme_manager")
themes.watch_for_theme_changes()
themes.set_default()

require("alpha").setup(require("dashboards.skibidi_toilet_dm").dashboard())
