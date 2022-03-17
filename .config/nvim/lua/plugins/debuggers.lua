local M = {}

M.python = function()
    local pythonAdapter = {
        type = "python";
        request = "launch";
        name = "Launch file";
        program = "${file}";
        console = "integratedTerminal";
    }
    local session = dap.launch(pythonAdapter, {}, {})
    if session == nil then
        io.write("Error launching adapter");
    end
    dap.repl.open({}, "vsplit")
end

require("dap").configurations.python = {
    {
        type = "python";
        request = "launch";
        name = "Launch file";
        program = "${file}";
        console = "integratedTerminal";
    },
}

return M
