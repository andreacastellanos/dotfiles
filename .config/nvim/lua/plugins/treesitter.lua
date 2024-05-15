require("nvim-treesitter.configs").setup {
    ensure_installed = { "python" , "json" },
    highlight = {
        enable = true,
    },
}

vim.api.nvim_set_hl(0, "TSPunctBracket", { link = "TSNone" })

require("nvim-autopairs").setup({
    check_ts = true,
})

require('nvim-autopairs.ts-conds')
