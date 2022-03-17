require("plugins.debuggers")
require("dap-python").setup( 
	"~/.virtualenvs/py3venv/bin/python3.7", { include_configs = false } 
)
require("dap-python").test_runner = "pytest"

vim.fn.sign_define("DapBreakpoint", {text="⭕", texthl="DapBreakpoint", linehl="", numhl=""})
vim.fn.sign_define("DapLogPoint", {text="🟡", texthl="DapLogPoint", linehl="", numhl=""})
vim.fn.sign_define("DapStopped", {text="🔴", texthl="DapStopped", linehl="debugPC", numhl=""})

vim.g.dap_virtual_text = true

vim.api.nvim_command([[ au FileType dap-repl lua require("dap.ext.autocompl").attach() ]])

vim.api.nvim_command([[ command! -complete=file -nargs=* Python lua require("debuggers").python({<f-args>}) ]])

vim.api.nvim_set_keymap("n", "<leader>c", "<cmd>lua require('dap').continue()<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>b", "<cmd>lua require('dap').toggle_breakpoint()<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>r", "<cmd>lua require('dap').repl.open({}, 'vsplit')<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>s", "<cmd>lua require('dap').step_over()<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>si", "<cmd>lua require('dap').step_into()<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>so", "<cmd>lua require('dap').step_out()<CR>", { silent = true })
