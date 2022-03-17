vim.g.signify_sign_delete = "-"
vim.g.signify_sign_change = "~"
vim.g.signify_sign_show_count = false

vim.api.nvim_set_keymap("n", "sd", ":SignifyDiff", { silent = true })
vim.api.nvim_set_keymap("n", "sD", "<C-w>h<C-w>c", { silent = true })