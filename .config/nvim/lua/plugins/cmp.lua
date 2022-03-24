local cmp = require("cmp")
local lspkind = require("lspkind")
cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["UltiSnips#Anon"](args.body)
        end,
    },
    mapping = {
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<Enter>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "buffer" } ,
        { name = "path" },
        { name = "ultisnips" },
    },
    formatting = {
        format = lspkind.cmp_format({
            mode = "symbol_text",
            maxwidth = 50,
        }),
    },
})

vim.opt.completeopt = {"menuone", "noselect"}

-- Avoid showing extra message when using completion
vim.o.shortmess = vim.o.shortmess .. "c"
