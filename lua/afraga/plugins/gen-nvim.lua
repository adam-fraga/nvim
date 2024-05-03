return {
	"David-Kunz/gen.nvim",
	opts = {
		model = "mistral", -- The default model to use.
		host = "localhost", -- The host running the Ollama service.
		port = "11434", -- The port on which the Ollama service is listening.
		display_mode = "float", -- The display mode. Can be "float" or "split".
		show_model = true, -- Displays which model you are using at the beginning of your chat session.
		debug = false, -- Prints errors and the command which is run.
	},
	config = function()
		require("gen").prompts["Translate_Fr"] = {
			prompt = "Translate the following text in Fr:\n$text",
			replace = true,
		}
	end,
}
