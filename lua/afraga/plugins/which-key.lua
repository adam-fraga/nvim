return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	opts = {
		mode = "n", -- NORMAL mode
		-- prefix: use "<leader>f" for example for mapping everything related to finding files
		-- the prefix is prepended to every mapping part of `mappings`
		prefix = "",
		buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
		silent = true, -- use `silent` when creating keymaps
		noremap = true, -- use `noremap` when creating keymaps
		nowait = false, -- use `nowait` when creating keymaps
		expr = false, -- use `expr` when creating keymaps
	},

	config = function()
		local wk = require("which-key")
		wk.add({
			-- Define the group for Buffer
			{ "<leader>b", group = "Buffer" },
			{ "<leader>bn", "<cmd>:bnext<cr>", desc = "Next" },
			{ "<leader>bp", "<cmd>:bprev<cr>", desc = "Previous" },
			{ "<leader>bd", "<cmd>:bdel<cr>", desc = "Close" },
			{ "<leader>bD", "<cmd>:BufferCloseAllButCurrent<cr>", desc = "Close All But Current" },
			{ "<leader>bh", "<cmd>:BufferCloseBuffersLeft<cr>", desc = "Close Buffers Left" },
			{ "<leader>bl", "<cmd>:BufferCloseBuffersRight<cr>", desc = "Close Buffers Right" },
			{ "<leader>bf", "<cmd>:BufferPick<cr>", desc = "Pick Buffer" },
			{ "<leader>bb", "<cmd>:Telescope buffers<cr>", desc = "List Buffers" },

			-- Define the group for AI Gen
			{ "<leader>C", group = "AI Gen" },
			{ "<leader>Ca", "<cmd>:Gen<cr>", desc = "Prompt AI" },
			{ "<leader>Cc", "<cmd>:Gen Chat<cr>", desc = "Chat AI" },

			-- Define the group for Custom Prompt
			{ "<leader>P", group = "Custom Prompt" },
			{ "<leader>Pr", "<cmd>:Gen Review_Code<cr>", desc = "Review Code" },
			{ "<leader>Pe", "<cmd>:Gen Enhance_Code<cr>", desc = "Enhance Code" },
			{ "<leader>Pm", "<cmd>:Gen Change_Code<cr>", desc = "Modify Code" },
			{ "<leader>Ps", "<cmd>:Gen Make_Concise<cr>", desc = "Make Short (Concise)" },
			{ "<leader>Pt", "<cmd>:Gen Translate_Fr<cr>", desc = "Translate French" },
			{ "<leader>Pg", "<cmd>:Gen Enhance_Grammar_Spelling<cr>", desc = "Enhance Grammar" },

			-- Define the group for Dap Debugger
			{ "<leader>d", group = "Dap Debugger" },
			{ "<leader>dx", "<cmd>:DapTerminate<cr>", desc = "Stop Debugger" },
			{ "<leader>dc", "<cmd>:lua require('dap').continue()<cr>", desc = "Continue" },
			{ "<leader>dt", "<cmd>:lua require('dap-go').debug_test()<cr>", desc = "Go Debug Test" },
			{ "<leader>dl", "<cmd>:lua require('dap').run_last()<cr>", desc = "Run Last" },
			{ "<leader>ds", "<cmd>:lua require('dap').step_over()<cr>", desc = "Step Over" },
			{ "<leader>di", "<cmd>:lua require('dap').step_into()<cr>", desc = "Step Into" },
			{ "<leader>do", "<cmd>:lua require('dap').step_out()<cr>", desc = "Step Out" },
			{ "<leader>db", "<cmd>:lua require('dap').toggle_breakpoint()<cr>", desc = "Toggle Breakpoint" },
			{
				"<leader>dC",
				"<cmd>:lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
				desc = "Set Conditional Breakpoint",
			},
			{ "<leader>dr", "<cmd>:lua require('dap').repl.toggle()<cr>", desc = "Toggle REPL" },
			{ "<leader>dR", "<cmd>:lua require('dap').repl.open()<cr>", desc = "Open REPL" },

			-- Define the group for Dap UI Debugger
			{ "<leader>D", group = "Dap UI Debugger" },
			{ "<leader>Dt", "<cmd>:lua require('dapui').toggle()<cr>", desc = "Toggle Dap UI" },
			{ "<leader>Do", "<cmd>:lua require('dapui').open()<cr>", desc = "Open Dap UI" },
			{ "<leader>Dc", "<cmd>:lua require('dapui').close()<cr>", desc = "Close Dap UI" },

			-- Define the group for Explorer
			{ "<leader>e", group = "Explorer" },
			{ "<leader>ee", "<cmd>:NvimTreeToggle<cr>", desc = "Toggle Explorer" },
			{ "<leader>er", "<cmd>:NvimTreeRefresh<cr>", desc = "Refresh Explorer" },
			{ "<leader>ef", "<cmd>:NvimTreeFindFile<cr>", desc = "Find File in Explorer" },

			-- Define the group for Telescope
			{ "<leader>f", group = "Telescope" },
			{ "<leader>ff", "<cmd>:Telescope find_files<cr>", desc = "Find Files" },
			{ "<leader>fs", "<cmd>:Telescope live_grep<cr>", desc = "Live Grep" },
			{ "<leader>fb", "<cmd>:Telescope buffers<cr>", desc = "Show Buffers" },
			{ "<leader>fr", "<cmd>:Telescope lsp_references<cr>", desc = "Show References" },
			{ "<leader>fh", "<cmd>:Telescope help_tags<cr>", desc = "Help Tags" },
			{ "<leader>fk", "<cmd>:Telescope keymaps<cr>", desc = "Keymaps" },
			{ "<leader>fp", "<cmd>:Telescope projects<cr>", desc = "Projects" },
			{ "<leader>ft", "<cmd>:Telescope treesitter<cr>", desc = "Treesitter" },

			-- Define the group for LSP Goto
			{ "<leader>g", group = "Lsp Goto" },
			{ "<leader>gd", "<cmd>:lua vim.lsp.buf.definition()<cr>", desc = "Go to Definition" },
			{ "<leader>gr", "<cmd>:lua vim.lsp.buf.references()<cr>", desc = "Go to References" },
			{ "<leader>gi", "<cmd>:lua vim.lsp.buf.implementation()<cr>", desc = "Go to Implementation" },
			{ "<leader>gt", "<cmd>:lua vim.lsp.buf.type_definition()<cr>", desc = "Go to Type Definition" },
			{ "<leader>gs", "<cmd>:lua vim.lsp.buf.document_symbol()<cr>", desc = "Document Symbols" },
			{ "<leader>gw", "<cmd>:lua vim.lsp.buf.workspace_symbol()<cr>", desc = "Workspace Symbols" },
			{ "<leader>gf", "<cmd>:lua vim.diagnostic.open_float()<cr>", desc = "Show diag current line" },
			{
				"<leader>gl",
				"<cmd>:lua vim.lsp.diagnostic.show_line_diagnostics()<cr>",
				desc = "Show Line Diagnostics",
			},
			{ "<leader>ga", "<cmd>:lua vim.lsp.diagnostic.code_action()<cr>", desc = "Code Action" },

			-- Define the group for Git Signs
			{ "<leader>G", group = "Git Signs" },
			{ "<leader>Ga", "<cmd>:Gitsigns stage_buffer<cr>", desc = "Stage Buffer" },
			{ "<leader>Gr", "<cmd>:Gitsigns reset_buffer<cr>", desc = "Reset Buffer" },
			{ "<leader>Gd", "<cmd>:Gitsigns diffthis<cr>", desc = "Diff Buffer" },
			{ "<leader>Gv", "<cmd>:Gitsigns preview_hunk<cr>", desc = "Preview Changes" },
			{ "<leader>Gn", "<cmd>:Gitsigns next_hunk<cr>", desc = "Next Hunk" },
			{ "<leader>Gp", "<cmd>:Gitsigns previous_hunk<cr>", desc = "Previous Hunk" },
			{ "<leader>Gb", "<cmd>:Gitsigns blame_line<cr>", desc = "Blame Line" },

			-- Define the group for Harpoon
			{ "<leader>h", group = "Harpoon" },
			{ "<leader>ht", "<cmd>:lua require('harpoon.term').gotoTerminal(1)<cr>", desc = "Terminal 1" },
			{ "<leader>hT", "<cmd>:lua require('harpoon.term').gotoTerminal(2)<cr>", desc = "Terminal 2" },
			{ "<leader>ha", "<cmd>:lua require('harpoon.mark').add_file()<cr>", desc = "Add File" },
			{ "<leader>hd", "<cmd>:lua require('harpoon.mark').delete_file()<cr>", desc = "Delete File" },
			{ "<leader>hh", "<cmd>:lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Toggle Quick Menu" },

			-- Define the group for LSP Diagnostics
			{ "<leader>l", group = "Lsp diagnostics" },
			{ "<leader>ll", "<cmd>:lua vim.lsp.diagnostic.set_loclist()<cr>", desc = "Set Loclist" },
			{ "<leader>ln", "<cmd>:lua vim.lsp.diagnostic.goto_next()<cr>", desc = "Next Diagnostic" },
			{ "<leader>lp", "<cmd>:lua vim.lsp.diagnostic.goto_prev()<cr>", desc = "Previous Diagnostic" },
		})
	end,
}
