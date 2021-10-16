local M = {}

--- Works with `make watch` running in separate terminal BEFORE debugger started.
M.pdaas = function()
    local dap = require "dap"
    local pdaasAdapter = {
        type = "executable";
        name = "node2";
        command  = os.getenv("HOME") .. "/.nvm/versions/node/v12.18.2/bin/node";
        args = { os.getenv("HOME") .. "/vscode-node-debug2/out/src/nodeDebug.js" };
    };
    local pdaasConfig = {
        type = "node2";
        request = "launch";
        runtimeExecutable = os.getenv("HOME") .. "/.nvm/versions/node/v12.18.2/bin/node";
        program = os.getenv("HOME") .. "/Plaid/pdaas2/build/pd2/scripts/cli/index.js";
        cwd = vim.fn.getcwd();
        sourceMaps = true;
        outFiles = {
            "${workspaceFolder}/build/**/*.js",
            "!**/node_modules/**",
        };
        sourceMapPathOverrides = {
            ["${workspaceFolder}/src/pd2/extractor/**/*.ts"] = "${workspaceFolder}/build/pd2/extractor/**/*.js",
        };
        protocol = "inspector";
        console = "integratedTerminal";
    };

    local session = dap.launch(pdaasAdapter, pdaasConfig, {})
    if session == nil then
        io.write("Error launching adapter");
    end
    dap.repl.open({}, 'vsplit')
end

M.qsync = function()
    local qsyncAdapter = {
        type = 'python';
        request = 'launch';
        name = "Launch file";
        program = "${file}";
        console = 'integratedTerminal';
    }
    local session = dap.launch(qsyncAdapter, {}, {})
    if session == nil then
        io.write("Error launching adapter");
    end
    dap.repl.open({}, 'vsplit')
end

require('dap').configurations.python = {
    {
        type = 'python';
        request = 'launch';
        name = "Launch file";
        program = "${file}";
        console = 'integratedTerminal';
    },
}

return M
