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
local lazy_plugins = {
  require("popo.treesitter"),
  require("popo.theme"),
  require("popo.formatting"),
  require("popo.lsp"),
  "folke/which-key.nvim",
  "folke/neodev.nvim",
  "theprimeagen/harpoon",
  "tpope/vim-fugitive",
  "mbbill/undotree",
  "norcalli/nvim-colorizer.lua",
  "NvChad/nvim-colorizer.lua",
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    'numToStr/Comment.nvim',
    opts = {
      toggler = { -- Comments current line
        line = '<C-_>',
        block = '<C-b>'
      },
      opleader = { -- Can select block to comment
        line = 'gc',
        block = 'gb'
      }
    },
    lazy = false,
  }
}

-- Setting up lazy plugins
require("lazy").setup(lazy_plugins)
