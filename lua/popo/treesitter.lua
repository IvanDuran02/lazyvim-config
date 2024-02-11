return {
  "https://github.com/apple/pkl-neovim.git",
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        autotag = {
          enable = true,
        },
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "typescript", "javascript", "html", "tsx", "go", "rust", "css", "prisma", "cpp", "pkl" },

        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  },
}
