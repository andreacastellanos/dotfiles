require("telescope").setup{
    prompt_position = "top",
}

vim.api.nvim_set_keymap("n", "<C-f>", ":Telescope find_files<CR>", {})
vim.api.nvim_set_keymap("n", "<C-g>", ":Telescope live_grep<CR>", {})
vim.api.nvim_set_keymap("n", "lb", ":Telescope buffers<CR>", {})
