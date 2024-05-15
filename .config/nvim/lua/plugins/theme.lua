-- theme
-- vim.g.solarized_borders = true
-- require("solarized").set()


--- gruvbox
-- require("gruvbox").setup({
--     palette_overrides = {
--         light0 = "#fdf6e3", -- solarized light bg
--     }
-- })

-- vim.cmd [[ colorscheme gruvbox ]]
-- vim.o.background = "dark"

--- everforest
require("everforest").setup({
    disable_italic_comments = false,

})
vim.cmd([[colorscheme everforest]])
vim.o.background = "light"