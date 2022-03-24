local actions = require("telescope.actions")

require("telescope").setup{
    prompt_position = "top",
    defaults = {
        mappings = {
            i = {
                ["<esc>"] = actions.close
            },
        },
    },
}

local telescope = 'require("telescope.builtin")'

vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>lua " .. telescope .. ".find_files()<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>lua " .. telescope .. ".live_grep()<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>lua " .. telescope .. ".buffers()<CR>", {})
