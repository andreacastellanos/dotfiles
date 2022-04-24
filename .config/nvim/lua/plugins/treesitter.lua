require("nvim-treesitter.configs").setup {
    ensure_installed = { "clojure", "python" , "json" },
    highlight = {
        enable = true,
    },
}

require("nvim-treesitter.highlight").set_custom_captures {
    ["punctuation.bracket"] = "TSNone", -- gray
}

require("nvim-autopairs").setup({
    check_ts = true,
})

require('nvim-autopairs.ts-conds')

