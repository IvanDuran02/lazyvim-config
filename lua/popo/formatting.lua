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
        ft = {
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
        },
        opts = {}
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
}
