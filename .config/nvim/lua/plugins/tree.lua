require("nvim-tree").setup{
    open_on_setup = true,
    auto_close = true,
    open_on_tab = true,
}

vim.api.nvim_set_keymap("n", "<leader>t", ":NvimTreeFindFileToggle<CR>", { noremap = true })

--todo: https://github.com/romgrk/barbar.nvim#integration-with-filetree-plugins