vim.g.solarized_borders = true
require('solarized').set()

--- code action lightbulb
vim.api.nvim_command([[ autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb() ]])