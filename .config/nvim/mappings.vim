" =============================
"           GENERAL
" =============================

" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Use alt + hjkl to resize windows
nnoremap <M-j> :resize -2<CR>
nnoremap <M-k> :resize +2<CR>
nnoremap <M-h> :vertical resize -2<CR>
nnoremap <M-l> :vertical resize +2<CR>

inoremap jj <Esc>

" TAB move to text buffer
nnoremap <TAB> :bnext<CR>
nnoremap <S-TAB> :bprevious<CR>

" save
nnoremap <C-s> :w<CR>

" tabbing
vnoremap <TAB> >gv
vnoremap <S-TAB> <gv

" window navigation
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" disable setting macros
map q <Nop>

" don't yank on delete char/line
nnoremap x "_x
nnoremap X "_X
vnoremap x "_x
vnoremap X "_X
nnoremap dd "_dd
vnoremap dd "_dd
nnoremap d "_d
vnoremap d "_d

" yank to end of line
nnoremap Y y$

" display file path
nnoremap fn <cmd>echo @%<CR>

tnoremap <Esc> <C-\><C-n>

" =============================
"           DAP
" =============================

nnoremap <silent> <leader>c <cmd>lua require'dap'.continue()<CR>
nnoremap <silent> <leader>b <cmd>lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <leader>r <cmd>lua require'dap'.repl.open({}, 'vsplit')<CR>
nnoremap <silent> <leader>s <cmd>lua require'dap'.step_over()<CR>
nnoremap <silent> <leader>si <cmd>lua require'dap'.step_into()<CR>
nnoremap <silent> <leader>so <cmd>lua require'dap'.step_out()<CR>

" =============================
"           TELESCOPE
" =============================

nnoremap <C-f> <cmd>Telescope find_files<CR>
nnoremap <C-g> <cmd>Telescope live_grep<CR>
nnoremap lb <cmd>Telescope buffers<CR>

" =============================
"           LSP
" =============================

nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gt <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gh <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> sh <cmd>lua vim.lsp.buf.signature_help()<CR>
vnoremap <silent> fm <cmd>lua vim.lsp.buf.range_formatting()<CR>
nnoremap <silent> gj <cmd>lua vim.lsp.buf.goto_next()<CR>
nnoremap <silent> gk <cmd>lua vim.lsp.buf.goto_prev()<CR>
nnoremap <silent> rn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> ls <cmd>lua require('telescope.builtin').lsp_references()<CR>
nnoremap <silent> ca <cmd>lua require('telescope.builtin').lsp_code_actions(require('telescope.themes').get_cursor())<CR>

" =============================
"           SIGNIFY
" =============================

nnoremap <silent> sd :SignifyDiff<CR>
nnoremap <silent> sD <C-w>h<C-w>c<CR>

" =============================
"           WORDMOTION
" =============================

nmap w <Plug>WordMotion_w
nmap b <Plug>WordMotion_b

" =============================
"           OTHER
" =============================

nnoremap <leader>cb :ConjureLogVSplit <CR> :ConjureConnect<CR>
nnoremap <leader>rt :ConjureEvalBuf <CR> :ConjureCljRunCurrentTest<CR>
nnoremap <leader>rta :ConjureEvalBuf <CR> :ConjureCljRunAllTests<CR>

nnoremap <leader>t :NvimTreeFindFileToggle<CR>
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :WhichKey ','<CR>

