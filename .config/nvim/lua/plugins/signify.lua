vim.g.signify_sign_delete = "-"
vim.g.signify_sign_change = "~"
vim.g.signify_sign_show_count = false

local noremap_silent = { noremap = true, silent = true }

vim.api.nvim_set_keymap("n", "sd", ":SignifyDiff<CR>", noremap_silent)
vim.api.nvim_set_keymap("n", "sD", "<C-w>h<C-w>c<CR>", noremap_silent)
