vim.g.wordmotion_nomap = true

vim.api.nvim_set_keymap("", "w", "<Plug>WordMotion_w", { silent = true })
vim.api.nvim_set_keymap("", "b", "<Plug>WordMotion_b", { silent = true })