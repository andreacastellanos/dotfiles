vim.cmd([[ colorscheme solarized ]])
vim.g.solarized_borders = true

--- code action lightbulb
vim.api.nvim_command([[ autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb() ]])