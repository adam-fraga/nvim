return {
	"jackMort/ChatGPT.nvim",
	event = "VeryLazy",
	config = function()
		require("chatgpt").setup({
			api_key_cmd = "$OPENAI_API_KEY2",
			chat = {
				welcome_message = "Welcome to ChatGPT.nvim Adam! Press <C-i> to use the output as input.",
			},
		})
	end,
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
}
