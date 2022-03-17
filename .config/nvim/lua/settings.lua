--- set leader keys
vim.g.mapleader = "<Space>"
vim.g.maplocalleader = ","

local set = vim.opt

vim.cmd [[ syntax enable ]]
set.hidden = true
--- set.nowrap = true
set.ruler = true
set.mouse = "a"
set.splitbelow = true
set.splitright = true
--- set.t_Co = 256
set.shiftwidth = 2
set.tabstop = 2
set.smarttab = true
set.expandtab = true
set.smartindent = true
set.autoindent = true
set.laststatus = 2
set.number = true
set.cursorline = true
--- set.showtabline = 2
set.updatetime = 300
set.timeoutlen = 500
set.clipboard = "unnamedplus"
set.relativenumber = true
set.colorcolumn = "80"
set.foldmethod = "indent"
set.foldnestmax = 10
set.foldenable = false
set.foldlevel = 2
set.ignorecase = true
set.smartcase = true
set.termguicolors = true
set.background = "light"

--- auto source:source $MYVIMRC 
vim.api.nvim_command([[ au! BufWritePost $MYVIMRC source %]])

--- ???
vim.api.nvim_command([[ cmap w!! w !sudo tee % ]])

vim.g.python3_host_prog = "~/.virtualenvs/py3venv/bin/python3.7"

set.encoding = "utf8"
--- set.guifont=JetBrains\ Mono\ NL:h14


local noremap = { noremap = true }

--- Better nav for omnicomplete
vim.api.nvim_set_keymap("i", "<c-j>", '("\\<C-n>")', { noremap = true, expr = true })
vim.api.nvim_set_keymap("i", "<c-k>", '("\\<C-p>")', { noremap = true, expr = true })

--- Use alt + hjkl to resize windows
vim.api.nvim_set_keymap("n", "<M-j>", ":resize -2<CR>", noremap)
vim.api.nvim_set_keymap("n", "<M-k>", ":resize +2<CR>", noremap)
vim.api.nvim_set_keymap("n", "<M-h>", ":vertical resize -2<CR>", noremap)
vim.api.nvim_set_keymap("n", "<M-l>", ":vertical resize +2<CR>", noremap)

vim.api.nvim_set_keymap("i", "jj", "<Esc>", noremap)

--- TAB move to text buffer
vim.api.nvim_set_keymap("n", "<TAB>", ":bnext<CR>", noremap)
vim.api.nvim_set_keymap("n", "<S-TAB>", ":bnext<CR>", noremap)

--- save
vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", noremap)

--- tabbing
vim.api.nvim_set_keymap("v", "<TAB>", ">gv", noremap)
vim.api.nvim_set_keymap("v", "<S-TAB>", "<gv", noremap)

--- window navigation
vim.api.nvim_set_keymap("n", "<leader>h", "<C-w>h", noremap)
vim.api.nvim_set_keymap("n", "<leader>j", "<C-w>j", noremap)
vim.api.nvim_set_keymap("n", "<leader>k", "<C-w>k", noremap)
vim.api.nvim_set_keymap("n", "<leader>l", "<C-w>l", noremap)

--- disable setting macros
vim.api.nvim_set_keymap("", "q", "<Nop>", {})

--- don't yank on delete char/line
vim.api.nvim_set_keymap("", "x", '"_x', noremap)
vim.api.nvim_set_keymap("", "X", '"_X', noremap)
vim.api.nvim_set_keymap("", "dd", '"_dd', noremap)
vim.api.nvim_set_keymap("", "d", '"_d', noremap)

--- yank to end of line
vim.api.nvim_set_keymap("n", "Y", "y$", noremap)

--- display file path
vim.api.nvim_set_keymap("n", "fn", "<cmd>echo @%<CR>", noremap)

vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", noremap)
