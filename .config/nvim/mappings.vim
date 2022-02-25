" =============================
"           GENERAL
" =============================

" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

inoremap jj <Esc>

" TAB move to text buffer
nnoremap <TAB> :bnext<CR>
nnoremap <S-TAB> :bprevious<CR>

" save
nnoremap <C-s> :w<CR>

" tabbing
vnoremap < <gv
vnoremap > >gv

" window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" disable setting macros
map q <Nop>

" don't yank on delete char/line
nnoremap x "_x
nnoremap X "_X
vnoremap x "_x
vnoremap X "_X
nnoremap dd "_dd

" yank to end of line
nnoremap Y y$

" display file path
nnoremap fn <cmd>echo @%<CR>

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

nnoremap <C-p> <cmd>Telescope find_files<CR>
nnoremap <C-f> <cmd>Telescope live_grep<CR>
nnoremap <C-b> <cmd>Telescope buffers<CR>

" =============================
"           LSP
" =============================

nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gt <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gh <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> rn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> ca <cmd>lua vim.lsp.buf.code_action()<CR>

" =============================
"           CONJURE
" =============================


" =============================
"           SIGNIFY
" =============================

nmap <silent> <leader>gm :SignifyHunkDiff<CR>

" =============================
"           WORDMOTION
" =============================

nmap w <Plug>WordMotion_w
nmap b <Plug>WordMotion_b
