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
    config = function()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        autotag = {
          enable = true,
        },
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "typescript", "javascript", "html", "tsx", "go", "rust", "css" },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  },
  "folke/which-key.nvim",
  {
    "abecodes/tabout.nvim",
    config = function()
      require("tabout").setup({})
    end
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  },
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
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    -- or                              , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    "windwp/nvim-ts-autotag",
    ft = { -- only runs this when ft is one of these.
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end
  },
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.prettierd,
        },
        on_attach = function(client, bufnr) -- Formats on save
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({
              group = augroup,
              buffer = bufnr,
            })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({ bufnr = bufnr })
              end,
            })
          end
        end,
      })
    end,
  },
  "theprimeagen/harpoon",
  "tpope/vim-fugitive",
  "mbbill/undotree",
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/nvim-cmp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      require("mason").setup({
        opts = {
          ensure_installed = {
            "prettierd",
            "eslint-lsp",
            "tailwindcss-language-server",
            "typescript-language-server",
          }
        }
      })
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "rust_analyzer",
          "gopls",
          "golangci_lint_ls",
          "html",
          "marksman",
          "cssls"
        },
        handlers = {
          function(server_name) -- default handler (optional)
            require("lspconfig")[server_name].setup {
              on_attach = attach
            }
          end,
        }
      })
      -- Auto complete stuff
      local cmp = require('cmp')
      local cmp_select = { behavior = cmp.SelectBehavior.Select }
      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body) -- for luasnip.
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
          ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
          ['<C-y>'] = cmp.mapping.confirm({ select = true }),
          ['<C-Space>'] = cmp.mapping.complete(),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        }, {
          { name = 'buffer' },
        })
      })

      vim.diagnostic.config({
        update_in_insert = true,
        float = {
          focusable = false,
          style = "minimal",
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      })
    end
  }
}

-- Setting up lazy plugins
require("lazy").setup(lazy_plugins)
