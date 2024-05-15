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

local noremap_silent = { noremap = true, silent = true }

local dap = 'require("dap")'
-- vim.api.nvim_set_keymap("n", "<leader>c", "<cmd>lua " .. dap .. ".continue()<CR>", noremap_silent)
-- vim.api.nvim_set_keymap("n", "<leader>b", "<cmd>lua " .. dap .. ".toggle_breakpoint()<CR>", noremap_silent)
-- vim.api.nvim_set_keymap("n", "<leader>r", "<cmd>lua " .. dap .. ".repl.open({}, 'vsplit')<CR>", noremap_silent)
-- vim.api.nvim_set_keymap("n", "<leader>s", "<cmd>lua " .. dap .. ".step_over()<CR>", noremap_silent)
-- vim.api.nvim_set_keymap("n", "<leader>si", "<cmd>lua " .. dap .. ".step_into()<CR>", noremap_silent)
-- vim.api.nvim_set_keymap("n", "<leader>so", "<cmd>lua " .. dap .. ".step_out()<CR>", noremap_silent)
