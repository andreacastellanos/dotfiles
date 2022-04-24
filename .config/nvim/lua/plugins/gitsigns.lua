require("gitsigns").setup {
    signs = {
        add          = {hl = 'GitSignsAdd'   , text = '█', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
        change       = {hl = 'GitSignsChange', text = '█', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
        delete       = {hl = 'GitSignsDelete', text = '▄', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        topdelete    = {hl = 'GitSignsDelete', text = '▀', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        changedelete = {hl = 'GitSignsChange', text = '▄', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},  
    },
}

local noremap_silent = { noremap = true, silent = true }

local gitsigns = 'require("gitsigns")'

vim.api.nvim_set_keymap("n", "<leader>gd", ":Gitsigns diffthis<CR>", noremap_silent)
vim.api.nvim_set_keymap("n", "<leader>rh", ":Gitsigns reset_hunk<CR>", noremap_silent)
vim.api.nvim_set_keymap("n", "<leader>ph", ":Gitsigns preview_hunk<CR>", noremap_silent)
vim.api.nvim_set_keymap("n", "<leader>gsb", ":Gitsigns toggle_current_line_blame<CR>", noremap_silent)
vim.api.nvim_set_keymap("n", "<leader>gb", "<cmd>lua " .. gitsigns .. ".blame_line{full=true}<CR>", noremap_silent)
