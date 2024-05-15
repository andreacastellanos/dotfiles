local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    -- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    local telescope = 'require("telescope.builtin")'
    local telescope_theme = 'require("telescope.themes")'
    local noremap_silent = { noremap = true, silent = true }

    -- Enable completion triggered by <c-x><c-o>
    -- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    client.server_capabilities.documentFormattingProvider = true
    if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_command("augroup Format")
        vim.api.nvim_command("autocmd! * <buffer>")
        vim.api.nvim_command("autocmd BufWritePre <buffer> :lua vim.lsp.buf.format()")
        vim.api.nvim_command("augroup END")
    end


    buf_set_keymap("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", noremap_silent)
    -- buf_set_keymap("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", noremap_silent)
    buf_set_keymap("n", "<leader>gh", "<cmd>lua vim.lsp.buf.hover()<CR>", noremap_silent)
    buf_set_keymap("n", "<leader>sh", "<cmd>lua vim.lsp.buf.signature_help()<CR>", noremap_silent)
    buf_set_keymap("v", "<leader>fm", "<cmd>lua vim.lsp.buf.format()<CR>", noremap_silent)
    buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", noremap_silent)
    buf_set_keymap("n", "<leader>df", "<cmd>lua vim.diagnostic.open_float()<CR>", noremap_silent)
    buf_set_keymap("n", "<leader>ls", "<cmd>lua " .. telescope .. ".lsp_references()<CR>", noremap_silent)
    buf_set_keymap("n", "<leader>bls", "<cmd>lua " .. telescope .. ".lsp_document_symbols()<CR>", noremap_silent)
    buf_set_keymap("n", "<leader>als", "<cmd>lua " .. telescope .. ".lsp_dynamic_workspace_symbols()<CR>", noremap_silent)
    buf_set_keymap("n", "<leader>ca", "<cmd>lua " .. telescope .. ".lsp_code_actions(" .. telescope_theme .. ".get_cursor())<CR>", noremap_silent)

    -- if client.server_capabilities.document_highlight then
    --     vim.api.nvim_exec([[
    --         augroup lsp_document_highlight
    --         autocmd! * <buffer>
    --         autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
    --         autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    --         augroup END
    --     ]], false)
    -- end
end

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

local lspconfig = require("lspconfig")

-- lspconfig.pylsp.setup{
--     cmd = { "~/.virtualenvs/py3venv/bin/pylsp" },
--     on_attach = on_attach,
--     capabilities = capabilities,
-- }


-- trld, diagnostics up top
-- require('trld').setup {
-- -- where to render the diagnostics. 'top' | 'bottom'
--     position = 'top',

--     -- if this plugin should execute it's builtin auto commands
--     auto_cmds = true,

--     -- diagnostics highlight group names
--     highlights = {
--         error = "DiagnosticFloatingError",
--         warn =  "DiagnosticFloatingWarn",
--         info =  "DiagnosticFloatingInfo",
--         hint =  "DiagnosticFloatingHint",
--     },

--     formatter = function(diag)
--         local u = require 'trld.utils'
--         local diag_lines = {}

--         for line in diag.message:gmatch("[^\n]+") do
--             line = line:gsub('[ \t]+%f[\r\n%z]', '')
--             table.insert(diag_lines, line)
--         end

--         local lines = {}
--         for _, diag_line in ipairs(diag_lines) do
--             table.insert(lines, { { diag_line .. ' ', u.get_hl_by_serverity(diag.severity) } })
--         end

--         return lines
--     end,
-- }
