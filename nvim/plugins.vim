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
    " Plug 'jiangmiao/auto-pairs'
    Plug 'chaoren/vim-wordmotion'

    " visual
    Plug 'andreacastellanos/NeoSolarized' " custom colors for nvim-dap
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'Yggdroot/indentLine'
    Plug 'kosayoda/nvim-lightbulb'
    Plug 'dstein64/nvim-scrollview'

    " statusline and buffertabs
    Plug 'hoob3rt/lualine.nvim'
    Plug 'romgrk/barbar.nvim'

    " search
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    " Plug 'nvim-lua/popup.nvim'
    " Plug 'nvim-lua/plenary.nvim'
    " Plug 'nvim-telescope/telescope.nvim'
    Plug 'liuchengxu/vim-which-key'

    " start up screen
    Plug 'mhinz/vim-startify'

    " git
    Plug 'mhinz/vim-signify'

    " debuggers
    Plug 'mfussenegger/nvim-dap'
    Plug 'mfussenegger/nvim-dap-python'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'theHamsta/nvim-dap-virtual-text'

    " snippets
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'

    " lsp
    Plug 'neovim/nvim-lspconfig'
    " Plug 'nvim-lua/completion-nvim'
    Plug 'hrsh7th/nvim-compe'

    " lint
    " Plug 'neomake/neomake'

    " Plug 'vim-test/vim-test'

call plug#end()
