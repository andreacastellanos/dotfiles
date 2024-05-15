require("nvim-tree").setup{
    -- open_on_setup = true,
    -- auto_close = true,
    open_on_tab = true,
    update_focused_file = {
        enable = true,
        update_root = true,
    },
    respect_buf_cwd = true,
}

vim.api.nvim_set_keymap("n", "<leader>t", ":NvimTreeFindFileToggle<CR>", { noremap = true })

