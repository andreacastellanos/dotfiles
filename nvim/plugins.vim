" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " syntax
    Plug 'sheerun/vim-polyglot'
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'b3nj5m1n/kommentary'
    Plug 'chaoren/vim-wordmotion'
    " Plug 'jiangmiao/auto-pairs'

    " visual
    Plug 'andreacastellanos/NeoSolarized' " custom colors for nvim-dap
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'Yggdroot/indentLine'
    Plug 'kosayoda/nvim-lightbulb'
    " Plug 'dstein64/nvim-scrollview'
    " Plug 'axlebedev/footprints'

    " statusline and buffertabs
    Plug 'shadmansaleh/lualine.nvim'
    Plug 'romgrk/barbar.nvim'

    " search
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

    " start up screen
    Plug 'mhinz/vim-startify'

    " git
    Plug 'mhinz/vim-signify'

    " debuggers
    Plug 'mfussenegger/nvim-dap'
    Plug 'mfussenegger/nvim-dap-python'
    Plug 'rcarriga/nvim-dap-ui'
    Plug 'theHamsta/nvim-dap-virtual-text'

    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    " lsp
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'onsails/lspkind-nvim'

    " other
    Plug 'liuchengxu/vim-which-key'
    " Plug 'rcarriga/vim-ultest'
    " Plug 'neomake/neomake'

call plug#end()
