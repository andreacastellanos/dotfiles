require("lspconfig").clojure_lsp.setup{
    on_attach = function(client)
        client.resolved_capabilities.document_formatting = false
    end,
    capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false })
    }
}

require("lspconfig").pylsp.setup{
    cmd = { "~/.virtualenvs/py3venv/bin/pylsp" },
    on_attach=on_attach,
    capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
}


vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "sh", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { silent = true })
vim.api.nvim_set_keymap("v", "fm", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "gj", "<cmd>lua vim.lsp.buf.goto_next()<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "gk", "<cmd>lua vim.lsp.buf.goto_prev()<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "ls", "<cmd>lua require('telescope.builtin').lsp_references()<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "ca", "<cmd>lua require('telescope.builtin').lsp_code_actions(require('telescope.themes').get_cursor())<CR>", { silent = true })
