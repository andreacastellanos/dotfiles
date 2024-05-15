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
    use "windwp/nvim-autopairs"
    -- use "nvim-treesitter/nvim-treesitter-context"
    -- use "gpanders/nvim-parinfer"
    use "ggandor/leap.nvim"

    -- theme
    use "shaunsingh/solarized.nvim"
    use "ellisonleao/gruvbox.nvim"
    -- "sainnhe/everforest"
    use "neanias/everforest-nvim"
    use "nvim-tree/nvim-web-devicons"

    -- visual
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    }
    use "kyazdani42/nvim-tree.lua"

    -- statusline and bufferline
    use "nvim-lualine/lualine.nvim"
    use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}

    -- search
    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            { "nvim-lua/plenary.nvim" }
        }
    }

    -- start up screen
    use "goolord/alpha-nvim"

    -- git
    use "lewis6991/gitsigns.nvim"

    -- debuggers
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
    -- use "Mofiqul/trld.nvim" -- top right errors

    -- other
    use "liuchengxu/vim-which-key"

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require("packer").sync()
    end
end)
