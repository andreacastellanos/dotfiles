local actions = require("telescope.actions")

require('telescope').setup {
    prompt_position = "top",
    defaults = {
    mappings = {
        i = {
            ["<esc>"] = actions.close
        },
    },
    dynamic_preview_title = true,
    layout_config = {
      vertical = { width = 0.75 }
    },
    -- `hidden = true` is not supported in text grep commands.
    vimgrep_arguments = vimgrep_arguments,
  },
  pickers = {
    buffers = {
      ignore_current_buffer = true,
      sort_lastused = true,
    },
    find_files = {
      find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*", "--glob", "!**/node_modules/*", "--glob", "!**/.clj-kondo/*" },
    }
  },
}

local telescope = 'require("telescope.builtin")'

vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>lua " .. telescope .. ".find_files()<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>lua " .. telescope .. ".live_grep()<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>lua " .. telescope .. ".buffers()<CR>", {})
