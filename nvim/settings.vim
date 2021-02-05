" =============================
"           GENERAL
" =============================

" set leader key
let g:mapleader = "\<Space>"

syntax enable                           " Enables syntax highlighing
set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
set ruler              			            " Show the cursor position all the time
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set tabstop=2                           " Insert 2 spaces for a tab
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set laststatus=2                        " lightline
set number                              " Line numbers
set cursorline                          " Enable highlighting of the current line
set showtabline=2                       " Always show tabs
set updatetime=300                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set clipboard=unnamedplus               " Copy paste between vim and everything else
set relativenumber
set colorcolumn=79
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2
set ignorecase
set smartcase
set termguicolors
set background=light

au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC

cmap w!! w !sudo tee %

let g:python3_host_prog = '~/.virtualenvs/neovim3/bin/python3.7'

" =============================
"           FZF
" =============================

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden"

" =============================
"           TELESCOPE
" =============================

" lua << EOF
"     require('telescope').setup{
"         prompt_position = "top",
"         initial_mode = "normal",
"     }
" EOF

" =============================
"           LSP
" =============================

lua << EOF
    require'lspconfig'.tsserver.setup{
        --- " on_attach=require'completion'.on_attach,
        --- " flags = { allow_incremental_sync = true }
    }
    require'lspconfig'.pyls.setup{
        cmd = { '/Users/acastellanos/.virtualenvs/CRAWLER_VENV/bin/pyls' },
        --- " on_attach=require'completion'.on_attach,
        --- " flags = { allow_incremental_sync = true }
    }

    require'compe'.setup({
        enabled = true,
        autocomplete = true,
        source = {
            path = true;
            buffer = true;
            calc = true;
            vsnip = true;
            nvim_lsp = true;
            nvim_lua = true;
            spell = true;
            tags = true;
            snippets_nvim = true;
        }
    })
EOF

" completion-nvim
" autocmd BufEnter * lua require'completion'.on_attach()

set completeopt=menu,menuone,noselect

" Avoid showing message extra message when using completion
set shortmess+=c


" =============================
"           SYNTAX
" =============================

lua << EOF
    require('kommentary.config').configure_language(
        'typescript', { prefer_single_line_comments = true }
    )
EOF


" =============================
"           VISUAL
" =============================

let bufferline = {}
let bufferline.animation = v:false

let g:indentLine_char = '┊'

lua << EOF
    local lualine = require('lualine')
    lualine.theme='solarized_light'
    lualine.sections.lualine_x = { 'filetype' }
    lualine.status()
EOF

colorscheme NeoSolarized

let g:neosolarized_vertSplitBgTrans = 0
let g:neosolarized_italic = 1

autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()


" =============================
"           DAP
" =============================

let g:dap_virtual_text = 1

lua << EOF
    require"debuggers"
    require('dap-python').setup(
        '~/.virtualenvs/CRAWLER_VENV/bin/python3.7', { include_configs = false }
    )
    require('dap-python').test_runner = 'pytest'

    vim.fn.sign_define('DapBreakpoint', {text='⭕', texthl='DapBreakpoint', linehl='', numhl=''})
    vim.fn.sign_define('DapLogPoint', {text='🟡', texthl='DapLogPoint', linehl='', numhl=''})
    vim.fn.sign_define('DapStopped', {text='🔴', texthl='DapStopped', linehl='debugPC', numhl=''})
EOF

" nvim-dap
command! -complete=file -nargs=* Pdaas lua require"debuggers".pdaas({<f-args>})

" nvim-dap-python
command! -complete=file -nargs=* Qsync lua require('dap').continue()


" =============================
"           TREESITTER
" =============================

lua << EOF
    require'nvim-treesitter.configs'.setup {
        ensure_installed = { "typescript", "python" , "json" },
        highlight = {
            enable = true,
        },
    }
    require "nvim-treesitter.highlight"
EOF


" =============================
"           SIGNIFY
" =============================

let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'

let g:signify_sign_show_count = 0
let g:signify_sign_show_text = 1


" =============================
"           STARTIFY
" =============================

let g:startify_session_dir = '~/.config/nvim/sessions'
let g:startify_lists = [
\   { 'type': 'bookmarks', 'header': ['   Bookmarks'        ]            },
\   { 'type': 'files',     'header': ['   Files'            ]            },
\   { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
\   { 'type': 'sessions',  'header': ['   Sessions'         ]             },
\ ]

let g:startify_bookmarks = [
\   { 'c': '~/.config/nvim/' },
\   { 's': '~/.config/nvim/general/settings.vim' },
\   { 'm': '~/.config/nvim/keys/mappings.vim' },
\   { 'p': '~/Plaid/pdaas/src/pd2/extractor' },
\   { 'q': '~/Quovo/qsync2' },
\ ]

let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1

let g:webdevicons_enable_startify = 1
let g:startify_custom_header = [
\ '',
\]
