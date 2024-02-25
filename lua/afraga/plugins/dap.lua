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

		dap.adapters.codelldb = {
			type = "server",
			port = "7888",
			executable = {
				-- Change this to your path!
				command = "//usr/bin/lldb",
				args = { "--port", "${port}" },
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
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
		}
	end,
}
