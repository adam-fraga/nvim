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
			c = {
				name = "Chat GPT", -- optional group name
				c = { "<cmd>:ChatGPT<cr>", "Prompt ChatGPT" }, -- create a binding with label
				a = { "<cmd>:ChatGPTActAs<cr>", "Act as" }, -- additional options for creating the keymap
				C = { "<cmd>:ChatGPTCompleteCode", "Code completion" }, -- just a label. don't create any mapping
			},
			f = {
				b = { "<cmd>:Telescope buffers<cr>", "Show active buffers" }, -- create a binding with label
				m = { "<cmd>:lua vim.lsp.buf.format()<cr>", "Format file" }, -- create a binding with label
			},
		}, { prefix = "<leader>" })
	end,
}
