-- vim.g["conjure#client#clojure#nrepl#eval#raw_out"] = true
vim.g["conjure#client#clojure#nrepl#test#raw_out"] = true
vim.g["conjure#log#hud#enabled"] = false
vim.g["conjure#log#jump_to_latest#enabled"] = true
vim.g["conjure#log#jump_to_latest#cursor_scroll_position"] = "bottom"

local noremap = { noremap = true }

vim.api.nvim_set_keymap("n", "<leader>cc", ":ConjureLogVSplit <CR> :ConjureConnect<CR> <C-w>h", noremap)
vim.api.nvim_set_keymap("n", "<leader>ct", ":ConjureEvalBuf <CR> :ConjureCljRunCurrentTest<CR>", noremap)
vim.api.nvim_set_keymap("n", "<leader>cta", ":ConjureEvalBuf <CR> :ConjureCljRunAllTests<CR>", noremap)
