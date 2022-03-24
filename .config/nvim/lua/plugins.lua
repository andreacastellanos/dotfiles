-- https://github.com/wbthomason/packer.nvim

local fn = vim.fn
local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
end

return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")

    -- syntax and movement
    use "sheerun/vim-polyglot"
    -- use "ntpeters/vim-better-whitespace"
    use "b3nj5m1n/kommentary"
    use "chaoren/vim-wordmotion"
    use "tpope/vim-surround"
    use "guns/vim-sexp"
    use "tpope/vim-sexp-mappings-for-regular-people"
    use "jiangmiao/auto-pairs"

    -- theme
    use "shaunsingh/solarized.nvim"
    use "kyazdani42/nvim-web-devicons"

    -- visual
    use "kosayoda/nvim-lightbulb"
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    }
    use "p00f/nvim-ts-rainbow"
    use "kyazdani42/nvim-tree.lua"

    -- statusline and bufferline
    use "nvim-lualine/lualine.nvim"
    use "akinsho/bufferline.nvim"

    -- search
    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            { "nvim-lua/plenary.nvim" }
        }
    }

    -- start up screen
    use "mhinz/vim-startify"

    -- git
    use "lewis6991/gitsigns.nvim"

    -- clojure
    use "Olical/conjure"
    use {
        "clojure-vim/vim-jack-in",
        requires = {
            { "tpope/vim-dispatch" },
            { "radenling/vim-dispatch-neovim" },
        }
    }

    --- debuggers
    use "mfussenegger/nvim-dap"
    use "mfussenegger/nvim-dap-python"
    use "rcarriga/nvim-dap-ui"
    use "theHamsta/nvim-dap-virtual-text"

    -- sessions
    -- use "rmagatti/session-lens"

    -- lsp
    use "neovim/nvim-lspconfig"
    use {
        "hrsh7th/nvim-cmp",
        requires = {
            { "onsails/lspkind-nvim" }
        }
    }
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"

    -- other
    use "liuchengxu/vim-which-key"

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require("packer").sync()
    end
end)
