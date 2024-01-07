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
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function ()
            local configs = require("nvim-treesitter.configs")
            configs.setup({
                ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "typescript", "javascript", "html" },
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    },
    "folke/which-key.nvim",
    { "folke/neoconf.nvim", cmd = "Neoconf" },
    "folke/neodev.nvim",
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup({
                -- Your lualine configuration here
            })
        end
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                -- Your catppuccin configuration here
                        color_overrides = {
                        mocha = {
                          base = "#0a0a10"
                        }
                }
        })
            vim.cmd.colorscheme "catppuccin"
        end,
    },
    {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"rust_analyzer",
				"tsserver",
				"eslint",
				"gopls",
				"golangci_lint_ls",
				"html",
				"marksman",
				"pyre",
				"tailwindcss",
			},
			handlers = {
				function (server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup {
						on_attach = attach
					}
				end,
			}
		})
	end
    }
}

-- Setting up lazy plugins
require("lazy").setup(lazy_plugins)
