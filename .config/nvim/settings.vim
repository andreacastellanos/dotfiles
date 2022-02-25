" =============================
"           GENERAL
" =============================

" set leader keys
let g:mapleader = "\<Space>"
let maplocalleader="\<Space>"

syntax enable                           " Enables syntax highlighing
set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
set ruler                               " Show the cursor position all the time
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
set laststatus=2
set number                              " Line numbers
set cursorline                          " Enable highlighting of the current line
set showtabline=2                       " Always show tabs
set updatetime=300                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set clipboard=unnamedplus               " Copy paste between vim and everything else
set relativenumber
set colorcolumn=99
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

let g:python3_host_prog = '~/.virtualenvs/py3venv/bin/python3.7'

" =============================
"           TELESCOPE
" =============================

lua << EOF
    require('telescope').setup{
        prompt_position = "top",
    }
EOF

" =============================
"           COMPE 
" =============================

lua << EOF
    local lspkind = require('lspkind')
    local cmp = require('cmp')
    cmp.setup({
        mapping = {
            ['<C-d>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.close(),
            ['<Enter>'] = cmp.mapping.confirm({ select = true }),
            ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' })
        },
        sources = {
            { name = 'nvim_lsp' },
            { name = 'buffer' } ,
        },
        formatting = {
            format = function(entry, vim_item)
                vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind
                vim_item.menu = ({
                    nvim_lsp = "[LSP]",
                    path = "[Path]",
                    buffer = "[Buffer]",
                })[entry.source.name]
                return vim_item
            end,
        }
    })

    cmp.setup {
      formatting = {
        format = lspkind.cmp_format({ with_text = true })
      }
    }
EOF

set completeopt=menuone,noselect

" Avoid showing extra message when using completion
set shortmess+=c

" =============================
"           LSP 
" =============================

lua << EOF
    --- to-do: figure out why lsp is (really) slow to load
    require'lspconfig'.clojure_lsp.setup{
        on_attach=on_attach,
        capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    }

    require'lspconfig'.pylsp.setup{
        cmd = { '~/.virtualenvs/py3venv/bin/pylsp' },
        on_attach=on_attach,
        capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    }
EOF

" =============================
"           SYNTAX
" =============================

lua << EOF
    require('kommentary.config').configure_language(
        'clojure', { prefer_single_line_comments = true }
    )
EOF

" =============================
"           THEME
" =============================

colorscheme solarized
let g:solarized_borders = v:true

" devicons
lua << EOF
    require'nvim-web-devicons'.setup{}
EOF

" =============================
"           VISUAL
" =============================

" barbar
let bufferline = {}
let bufferline.animation = v:false

" visual indents
" let g:indentLine_char = '┊'

" lualine
lua << EOF
    local custom_solarized_light = require'lualine.themes.solarized_light'
    require'lualine'.setup{
        options = { theme = custom_solarized_light },
        sections = { lualine_x = { 'filetype' }}
    }
EOF

" code action lightbulb
autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()

" to-do: figure out why this isn't working. theme?
let g:rainbow_active = 1

" =============================
"           DAP
" =============================

let g:dap_virtual_text = 1

lua << EOF
    require"debuggers"
    require('dap-python').setup(
        '~/.virtualenvs/py3venv/bin/python3.7', { include_configs = false }
    )
    require('dap-python').test_runner = 'pytest'

    vim.fn.sign_define('DapBreakpoint', {text='⭕', texthl='DapBreakpoint', linehl='', numhl=''})
    vim.fn.sign_define('DapLogPoint', {text='🟡', texthl='DapLogPoint', linehl='', numhl=''})
    vim.fn.sign_define('DapStopped', {text='🔴', texthl='DapStopped', linehl='debugPC', numhl=''})
EOF

" nvim-dap
au FileType dap-repl lua require('dap.ext.autocompl').attach()

command! -complete=file -nargs=* Python lua require"debuggers".python({<f-args>})

" =============================
"           TREESITTER
" =============================

lua << EOF
    require'nvim-treesitter.configs'.setup {
        ensure_installed = { "clojure", "python" , "json" },
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
\   { 's': '~/.config/nvim/settings.vim' },
\   { 'm': '~/.config/nvim/mappings.vim' },
\   { 'p': '~/.config/nvim/plugins.vim' },
\   { 'z': '~/.zshrc'  },
\ ]

let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1

let g:webdevicons_enable_startify = 1
let g:startify_custom_header = ['']

" =============================
"           WORDMOTION
" =============================

let g:wordmotion_nomap = 1
