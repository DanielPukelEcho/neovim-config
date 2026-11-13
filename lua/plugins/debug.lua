return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
        },

        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            dapui.setup()

            -- Register .NET debug adapter
            dap.adapters.coreclr = {
                type = "executable",
                command = "netcoredbg",
                args = { "--interpreter=vscode" },
            }

            -- Configure C# debugging
            dap.configurations.cs = {
                {
                    name = "Launch ASP.NET Core",
                    type = "coreclr",
                    request = "launch",

                    program = function()
                        local path = vim.fn.input(
                            "Path to DLL: ",
                            vim.fn.getcwd() .. "/bin/Debug/net10.0/",
                            "file"
                        )

                        path = vim.fn.fnamemodify(path, ":p")

                        assert(
                            vim.fn.filereadable(path) == 1,
                            "DLL not found: " .. path
                        )

                        return path
                    end,

                    cwd = "${workspaceFolder}",

                    env = {
                        ASPNETCORE_ENVIRONMENT = "Development",
                        ASPNETCORE_URLS = "http://localhost:5000",
                    },
                },
            }

            -- Open and close debugging UI automatically
            dap.listeners.after.event_initialized["dapui_config"] =
                function()
                    dapui.open()
                end

            dap.listeners.before.event_terminated["dapui_config"] =
                function()
                    dapui.close()
                end

            dap.listeners.before.event_exited["dapui_config"] =
                function()
                    dapui.close()
                end

            -- Keymaps
            vim.keymap.set("n", "<F5>", dap.continue)
            vim.keymap.set("n", "<F10>", dap.step_over)
            vim.keymap.set("n", "<F11>", dap.step_into)

            vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
            vim.keymap.set("n", "<leader>do", dap.step_out)
            vim.keymap.set("n", "<leader>dq", dap.terminate)
            vim.keymap.set("n", "<leader>du", dapui.toggle)
            vim.keymap.set("n", "<leader>de", dapui.eval)
        end,
    },
}
