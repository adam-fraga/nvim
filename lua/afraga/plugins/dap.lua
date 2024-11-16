return {
	"mfussenegger/nvim-dap",

	opt = true,
	config = function()
		local dap = require("dap")

		local sign = vim.fn.sign_define

		-- DAP SIGNS

		sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
		sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
		sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })
		sign("DapStopped", { text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" })

		-- DAP ADAPTERS

		dap.adapters.python = {
			type = "executable",
			command = "python",
			args = { "-m", "debugpy.adapter" },
		}

		dap.adapters.lldb = {
			type = "executable", --OR server
			executable = {
				-- Change this to your path!
				command = "/usr/bin/lldb",
				name = "lldb",
			},
		}

		dap.adapters.delve = {
			type = "server",
			port = "${port}",
			executable = {
				command = "dlv",
				args = { "dap", "-l", "127.0.0.1:${port}" },
				-- add this if on windows, otherwise server won't open successfully
				-- detached = false
			},
		}

		-- DAP CONFIGURATIONS

		dap.configurations.python = {
			{
				type = "python",
				request = "launch",
				name = "Launch file",
				program = "${file}",
				pythonPath = function()
					return vim.fn.exepath("python")
				end,
			},
		}

		dap.configurations.rust = {
			{
				name = "Launch file",
				type = "lldb",
				request = "launch",
				program = function()
					local path = vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					print(path)
					return path
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
		}

		dap.configurations.cpp = dap.configurations.rust
		dap.configurations.c = dap.configurations.rust
		dap.set_log_level("DEBUG")

		dap.configurations.go = {
			{
				type = "delve",
				name = "Debug",
				request = "launch",
				program = "${file}",
			},
			{
				type = "delve",
				name = "Debug test", -- configuration for debugging test files
				request = "launch",
				mode = "test",
				program = "${file}",
			},
			-- works with go.mod packages and sub packages
			{
				type = "delve",
				name = "Debug test (go.mod)",
				request = "launch",
				mode = "test",
				program = "./${relativeFileDirname}",
			},
		}
	end,
}
