return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        color_overrides = {
          mocha = {
            base = "#13131f" -- made the base color a bit darker [ #0a0a10 ]
          }
        },
        transparent_background = false, -- disables setting the background color.
        background = { -- :h background
          light = "latte",
          dark = "mocha",
        },
        show_end_of_buffer = false,    -- shows the '~' characters after the end of buffers
        term_colors = false,           -- sets terminal colors (e.g. `g:terminal_color_0`)
        dim_inactive = {
          enabled = false,             -- dims the background color of inactive window
          shade = "light",
          percentage = 0.15,           -- percentage of the shade to apply to the inactive window
        },
        custom_highlights = {},
        integrations = {
          cmp = true,
          dashboard = true,
          gitsigns = true,
          harpoon = true,
          nvimtree = true,
          treesitter = true,
          notify = false,
          mini = {
            enabled = true,
            indentscope_color = "",
          },
        },
      })
      vim.cmd.colorscheme "catppuccin"
    end,
  },
  {
    -- Git line changes...
    "lewis6991/gitsigns.nvim",
    opts = {}
  },
  {
    -- Statusbar UI
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {}
  },
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup({
        theme = 'hyper',
        config = {
          week_header = {
            enable = true,
          },
          shortcut = {
            { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
            {
              icon = ' ',
              icon_hl = '@variable',
              desc = 'Files',
              group = 'Label',
              action = 'Telescope find_files',
              key = 'f',
            },
            {
              desc = ' Apps',
              group = 'DiagnosticHint',
              action = 'Telescope app',
              key = 'a',
            },
            {
              desc = ' Diagnostics',
              group = 'Number',
              action = 'Telescope diagnostics',
              key = 'd',
            },
          },
          packages = { enable = true }, -- show how many plugins neovim loaded
          footer = { "", "🚀 Get to work!" } -- footer
        }
      })
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
  }
}
