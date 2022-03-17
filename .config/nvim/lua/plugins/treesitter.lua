require("nvim-treesitter.configs").setup {
    ensure_installed = { "clojure", "python" , "json" },
    highlight = {
        enable = true,
    },
    rainbow = {
        enable = true,
    },
}

require("nvim-treesitter.highlight")
