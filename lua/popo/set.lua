-- vim.opt.guicursor = "" -- sets fat cursor even on insert mode.

-- sets line numbers and relative order
vim.opt.nu = true
vim.opt.relativenumber = true

-- sets tabs to 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

-- vim.opt.wrap = false -- disables linewrap 

-- allows undotree to have way more history
vim.opt.swapfile = false
vim.opt.backup = false
vim.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

-- for some reason scrolloff isn't working right now...
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- 
-- vim.opt.colorcolumn = "80"

vim.g.mapleader = " "
