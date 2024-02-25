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
		wk.register({
			C = {
				name = "Chat GPT",
				c = { "<cmd>:ChatGPT<cr>", "Prompt ChatGPT" },
				a = { "<cmd>:ChatGPTActAs<cr>", "Act as" }, -- additional options for creating the keymap
				C = { "<cmd>:ChatGPTCompleteCode", "Code completion" }, -- just a label. don't create any mapping
			},
			e = {
				name = "Explorer",
				e = { "<cmd>:NvimTreeToggle<cr>", "Toggle" },
				r = { "<cmd>:NvimTreeRefresh<cr>", "Refresh" },
				f = { "<cmd>:NvimTreeFindFile<cr>", "Find file" },
			},
			f = {
				name = "Telescope",
				f = { "<cmd>:Telescope find_files<cr>", "Find files" },
				s = { "<cmd>:Telescope live_grep<cr>", "Live grep" },
				b = { "<cmd>:Telescope buffers<cr>", "Show active buffers" },
				r = { "<cmd>:Telescope lsp_references<cr>", "Show references" },
				h = { "<cmd>:Telescope help_tags<cr>", "Help tags" },
				k = { "<cmd>:Telescope keymaps<cr>", "Keymaps" },
				p = { "<cmd>:Telescope projects<cr>", "Projects" },
				t = { "<cmd>:Telescope treesitter<cr>", "Treesitter" },
			},
			g = {
				name = "Lsp Goto",
				d = { "<cmd>:lua vim.lsp.buf.definition()<cr>", "Definition" },
				r = { "<cmd>:lua vim.lsp.buf.references()<cr>", "References" },
				i = { "<cmd>:lua vim.lsp.buf.implementation()<cr>", "Implementation" },
				t = { "<cmd>:lua vim.lsp.buf.type_definition()<cr>", "Type definition" },
				s = { "<cmd>:lua vim.lsp.buf.document_symbol()<cr>", "Document symbol" },
				w = { "<cmd>:lua vim.lsp.buf.workspace_symbol()<cr>", "Workspace symbol" },
			},
			G = {
				name = "Git Signs",
				a = { "<cmd>:Gitsigns stage_buffer<cr>", "Stage buffer" },
				r = { "<cmd>:Gitsigns reset_buffer<cr>", "Reset buffer" },
				d = { "<cmd>:Gitsigns diffthis<cr>", "Diff buffer" },
				v = { "<cmd>:Gitsigns preview_hunk<cr>", "Visualize changes" },
				n = { "<cmd>:Gitsigns next_hunk<cr>", "Next hunk" },
				p = { "<cmd>:Gitsigns previous_hunk<cr>", "Previous hunk" },
				b = { "<cmd>:Gitsigns blame_line<cr>", "Blame line" },
			},
			h = {
				name = "Harpoon",
				t = { "<cmd>:lua require('harpoon.term').gotoTerminal(1)<cr>", "Terminal 1" },
				T = { "<cmd>:lua require('harpoon.term').gotoTerminal(2)<cr>", "Terminal 2" },
				a = { "<cmd>:lua require('harpoon.mark').add_file()<cr>", "Add file" },
				d = { "<cmd>:lua require('harpoon.mark').delete_file()<cr>", "Delete file" },
				h = { "<cmd>:lua require('harpoon.ui').toggle_quick_menu()<cr>", "Toggle quick menu" },
			},
			l = {
				name = "Lsp diagnostics",
				a = { "<cmd>:lua vim.lsp.diagnostic.code_action()<cr>", "Code action" },
				d = { "<cmd>:lua vim.lsp.diagnostic.show_line_diagnostics()<cr>", "Show line diagnostics" },
				l = { "<cmd>:lua vim.lsp.diagnostic.set_loclist()<cr>", "Set loclist" },
				n = { "<cmd>:lua vim.lsp.diagnostic.goto_next()<cr>", "Next diagnostic" },
				p = { "<cmd>:lua vim.lsp.diagnostic.goto_prev()<cr>", "Previous diagnostic" },
				f = { "<cmd>:lua vim.lsp.buf.formatting()<cr>", "Format" },
			},
		}, { prefix = "<leader>" })
	end,
}
