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

require("utils.theme_manager").enable_theming()

require("alpha").setup(require("dashboards.muslim2").dashboard())
