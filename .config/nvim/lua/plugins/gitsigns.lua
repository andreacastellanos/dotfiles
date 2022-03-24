-- todo: adjust column width

require("gitsigns").setup {
    signs = {
        change       = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
        changedelete = {hl = 'GitSignsChange', text = '-', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},  
    },
}

local noremap_silent = { noremap = true, silent = true }

local gitsigns = 'require("gitsigns")'

vim.api.nvim_set_keymap("n", "<leader>gd", ":Gitsigns diffthis<CR>", noremap_silent)
vim.api.nvim_set_keymap("n", "<leader>gb", "<cmd>lua " .. gitsigns .. ".blame_line{full=true}<CR>", noremap_silent)
vim.api.nvim_set_keymap("n", "<leader>gsb", ":Gitsigns toggle_current_line_blame <CR>", noremap_silent)
