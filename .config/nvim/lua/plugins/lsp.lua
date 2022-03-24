local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    -- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    local telescope = 'require("telescope.builtin")'
    local telescope_theme = 'require("telescope.themes")'
    local noremap_silent = { noremap = true, silent = true }

    -- Enable completion triggered by <c-x><c-o>
    -- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    client.resolved_capabilities.document_formatting = false

    buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", noremap_silent)
    -- buf_set_keymap("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", noremap_silent)
    buf_set_keymap("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", noremap_silent)
    buf_set_keymap("n", "sh", "<cmd>lua vim.lsp.buf.signature_help()<CR>", noremap_silent)
    buf_set_keymap("v", "fm", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", noremap_silent)
    buf_set_keymap("n", "rn", "<cmd>lua vim.lsp.buf.rename()<CR>", noremap_silent)
    buf_set_keymap("n", "ls", "<cmd>lua " .. telescope .. ".lsp_references()<CR>", noremap_silent)
    buf_set_keymap("n", "ca", "<cmd>lua " .. telescope .. ".lsp_code_actions(" .. telescope_theme .. ".get_cursor())<CR>", noremap_silent)
    buf_set_keymap("n", "gj", "<cmd>lua vim.lsp.buf.goto_next()<CR>", noremap_silent)
    buf_set_keymap("n", "gk", "<cmd>lua vim.lsp.buf.goto_prev()<CR>", noremap_silent)

    -- if client.resolved_capabilities.document_highlight then
    --     vim.api.nvim_exec([[
    --         augroup lsp_document_highlight
    --         autocmd! * <buffer>
    --         autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
    --         autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    --         augroup END
    --     ]], false)
    -- end

end

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

local lspconfig = require("lspconfig")

lspconfig.clojure_lsp.setup{
    on_attach = on_attach,
    capabilities = capabilities,
    handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false })
    },
}

lspconfig.pylsp.setup{
    cmd = { "~/.virtualenvs/py3venv/bin/pylsp" },
    on_attach=on_attach,
    capabilities = capabilities,
}
