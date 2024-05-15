-- set leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = ","

local set = vim.opt

vim.cmd [[ syntax enable ]]
set.hidden = true
-- set.nowrap = true
set.ruler = true
set.mouse = "a"
set.splitbelow = true
set.splitright = true
-- set.t_Co = 256
set.shiftwidth = 2
set.tabstop = 2
set.smarttab = true
set.expandtab = true
set.smartindent = true
set.autoindent = true
set.laststatus = 2
set.number = true
set.cursorline = true
-- set.showtabline = 2
set.showmatch = true
set.updatetime = 300
set.timeoutlen = 500
set.clipboard = "unnamedplus"
set.relativenumber = true
-- set.colorcolumn = "80"
set.incsearch = true
set.foldmethod = "indent"
set.foldnestmax = 10
set.foldenable = false
set.foldlevel = 2
set.ignorecase = true
set.smartcase = true
set.termguicolors = true

-- auto source:source $MYVIMRC 
vim.api.nvim_command([[ au! BufWritePost $MYVIMRC source %]])

vim.api.nvim_command([[ cmap w!! w !sudo tee % ]])

vim.g.python3_host_prog = "~/.virtualenvs/py3venv/bin/python3.9"

set.encoding = "utf8"
-- set.guifont=JetBrains\ Mono\ NL:h14

local noremap = { noremap = true }

-- nav for omnicomplete
vim.api.nvim_set_keymap("i", "<c-j>", '("\\<C-n>")', { noremap = true, expr = true })
vim.api.nvim_set_keymap("i", "<c-k>", '("\\<C-p>")', { noremap = true, expr = true })

-- alt + hjkl to resize windows
vim.api.nvim_set_keymap("n", "<A-j>", ":resize -2<CR>", noremap)
vim.api.nvim_set_keymap("n", "<A-k>", ":resize +2<CR>", noremap)
vim.api.nvim_set_keymap("n", "<A-h>", ":vertical resize -2<CR>", noremap)
vim.api.nvim_set_keymap("n", "<A-l>", ":vertical resize +2<CR>", noremap)

vim.api.nvim_set_keymap("i", "jj", "<Esc>", noremap)

-- TAB move to next buffer
vim.api.nvim_set_keymap("n", "<TAB>", ":bnext | echo @%<CR>", noremap)
vim.api.nvim_set_keymap("n", "<S-TAB>", ":bnext<CR>", noremap)

-- save
vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", noremap)

-- tabbing
vim.api.nvim_set_keymap("v", "<TAB>", ">gv", noremap)
vim.api.nvim_set_keymap("v", "<S-TAB>", "<gv", noremap)

-- window navigation
vim.api.nvim_set_keymap("n", "<leader>h", "<C-w>h", noremap)
vim.api.nvim_set_keymap("n", "<leader>j", "<C-w>j", noremap)
vim.api.nvim_set_keymap("n", "<leader>k", "<C-w>k", noremap)
vim.api.nvim_set_keymap("n", "<leader>l", "<C-w>l", noremap)

-- close
vim.api.nvim_set_keymap("n", "<leader>cw", "<C-w>c", noremap) -- <C-w>h<C-w>c<CR>
vim.api.nvim_set_keymap("n", "<leader>cb", ":bp | sp | bn | bd | <TAB><CR>", noremap)

-- disable setting macros
vim.api.nvim_set_keymap("", "q", "<Nop>", {})

-- don't yank on delete/change
vim.api.nvim_set_keymap("", "x", '"_x', noremap)
vim.api.nvim_set_keymap("", "X", '"_X', noremap)
vim.api.nvim_set_keymap("", "dd", '"_dd', noremap)
vim.api.nvim_set_keymap("", "d", '"_d', noremap)
vim.api.nvim_set_keymap("", "c", '"_c', noremap)

-- yank to end of line
vim.api.nvim_set_keymap("n", "Y", "y$", noremap)

-- display file path
vim.api.nvim_set_keymap("n", "fn", "<cmd>echo @%<CR>", noremap)

-- escape from term
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", noremap)

-- clear highlighting
vim.api.nvim_set_keymap("n", "<leader>hc", ":noh<CR>", noremap)

-- todo: change matching paren to yellow or something
require('leap').add_default_mappings()