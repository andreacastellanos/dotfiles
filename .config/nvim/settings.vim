" =============================
"           GENERAL
" =============================

" set leader keys
let g:mapleader = "\<Space>"
let g:maplocalleader = ","

syntax enable
set hidden
" set nowrap
set ruler
set mouse=a
set splitbelow
set splitright
set t_Co=256
set shiftwidth=2
set tabstop=2
set smarttab
set expandtab
set smartindent
set autoindent
set laststatus=2
set number
set cursorline
" set showtabline=2
set updatetime=300
set timeoutlen=500
set clipboard=unnamedplus
set relativenumber
"set colorcolumn=99
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2
set ignorecase
set smartcase
set termguicolors
set background=light

au! BufWritePost $MYVIMRC source %      " auto source:source $MYVIMRC

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
    require'lspconfig'.clojure_lsp.setup{
        on_attach = function(client)
            client.resolved_capabilities.document_formatting = false
        end,
        capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
        handlers = {
            ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {virtual_text = false})
        }
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
    require("nvim-web-devicons").setup{ default = true }
EOF

" =============================
"           VISUAL
" =============================

" barbar
let bufferline = {}
let bufferline.animation = v:false

" lualine
lua << EOF
    local custom_solarized_light = require'lualine.themes.solarized_light'
    require'lualine'.setup{
        options = { theme = custom_solarized_light },
        sections = { 
            lualine_x = { 'filetype' },
        },
    }
EOF

" code action lightbulb
autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()

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
        rainbow = {
            enable = true,
        },
    }
    require "nvim-treesitter.highlight"
EOF

" =============================
"           SIGNIFY
" =============================

let g:signify_sign_delete = '-'
let g:signify_sign_change = '~'
let g:signify_sign_show_count = 0

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
"           TREE
" =============================

lua << EOF
    require'nvim-tree'.setup{
        open_on_setup = true,
        auto_close = true,
        open_on_tab = true,
    }
EOF


" =============================
"           OTHER
" =============================

set encoding=utf8
" set guifont=JetBrains\ Mono\ NL:h14
let g:wordmotion_nomap = 1
let g:sexp_enable_insert_mode_mappings = 0

