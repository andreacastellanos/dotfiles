vim.api.nvim_set_keymap("n", "<leader>cb", ":ConjureLogVSplit <CR> :ConjureConnect<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>rt", ":ConjureEvalBuf <CR> :ConjureCljRunCurrentTest<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>rta", ":ConjureEvalBuf <CR> :ConjureCljRunAllTests<CR>", {})