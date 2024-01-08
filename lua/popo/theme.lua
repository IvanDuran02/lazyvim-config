return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        color_overrides = {
          mocha = {
            base = "#0a0a10" -- made the base color a bit darker
          }
        }
      })
      vim.cmd.colorscheme "catppuccin"
    end,
  },
  {
    -- Statusbar UI
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {}
  },

}
