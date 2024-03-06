return {
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
    {
        "windwp/nvim-ts-autotag",
        ft = { -- only runs this when file type is one of these.
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
