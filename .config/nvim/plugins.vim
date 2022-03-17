" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " syntax and movement
    Plug 'sheerun/vim-polyglot'
    " Plug 'ntpeters/vim-better-whitespace'
    Plug 'b3nj5m1n/kommentary'
    Plug 'chaoren/vim-wordmotion'
    Plug 'tpope/vim-surround'
    Plug 'guns/vim-sexp'
    Plug 'tpope/vim-sexp-mappings-for-regular-people'

    " theme
    Plug 'shaunsingh/solarized.nvim'
    Plug 'kyazdani42/nvim-web-devicons'

    " visual
    Plug 'kosayoda/nvim-lightbulb'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'p00f/nvim-ts-rainbow'
    Plug 'kyazdani42/nvim-tree.lua'

    " statusline and buffertabs
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'romgrk/barbar.nvim'

    " search
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

    " start up screen
    Plug 'mhinz/vim-startify'

    " git
    Plug 'mhinz/vim-signify'

    " clojure
    Plug 'Olical/conjure'
    Plug 'clojure-vim/vim-jack-in'
    Plug 'tpope/vim-dispatch'
    Plug 'radenling/vim-dispatch-neovim'

    " debuggers
    Plug 'mfussenegger/nvim-dap'
    Plug 'mfussenegger/nvim-dap-python'
    Plug 'rcarriga/nvim-dap-ui'
    Plug 'theHamsta/nvim-dap-virtual-text'

    " sessions
    " Plug 'rmagatti/auto-session'
    " Plug 'rmagatti/session-lens'

    " lsp
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'onsails/lspkind-nvim'

    " other
    Plug 'liuchengxu/vim-which-key'

call plug#end()
