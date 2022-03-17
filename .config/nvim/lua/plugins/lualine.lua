local custom_solarized_light = require("lualine.themes.solarized_light")
require("lualine").setup{
    options = { theme = custom_solarized_light },
    sections = { 
        lualine_x = { "filetype" },
    },
}
