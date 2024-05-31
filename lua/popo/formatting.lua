return {
    {
        {
            'stevearc/conform.nvim',
            config = function()
                require("conform").setup({
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        pattern = "*",
                        callback = function(args)
                            require("conform").format({ bufnr = args.buf })
                        end,
                    }),
                    format_on_save = {
                        -- These options will be passed to conform.format()
                        timeout_ms = 500,
                        lsp_fallback = true,
                    },
                    formatters_by_ft = {
                        lua = { "stylua" },
                        -- Conform will run multiple formatters sequentially
                        python = { "isort", "black" },
                        -- Use a sub-list to run only the first available formatter
                        javascript = { { "prettierd", "prettier" } },
                        go = { "goimports", "gofmt" },
                    },
                })
            end
        }
    },
    {
        "windwp/nvim-ts-autotag",
        lazy = false,
        config = function()
            require 'nvim-ts-autotag'.setup()
        end,
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {}
    },
    {
        "abecodes/tabout.nvim",
        opts = {}
    },
    {
        "folke/trouble.nvim",
        opts = {}, -- for default options, refer to the configuration section for custom setup.
        cmd = "Trouble",
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>cl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>xL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>xQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
    }
}
