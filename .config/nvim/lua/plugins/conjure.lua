vim.api.nvim_set_keymap("n", "<leader>cc", ":ConjureLogVSplit <CR> :ConjureConnect<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>ct", ":ConjureEvalBuf <CR> :ConjureCljRunCurrentTest<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>cta", ":ConjureEvalBuf <CR> :ConjureCljRunAllTests<CR>", { noremap = true })
