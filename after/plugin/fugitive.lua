vim.keymap.set("n", "<leader>gs", vim.cmd.Git);

-- Shows commit change logs
vim.keymap.set("n", "<C-y>", ":Git blame<CR>", { noremap = true, silent = true })

