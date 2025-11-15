return {
	"akinsho/flutter-tools.nvim",
	event = "BufReadPre", -- ou "VeryLazy" si tu préfères charger après le démarrage
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("flutter-tools").setup({
			-- tu peux personnaliser ici si besoin, sinon laisse vide {}
			-- example:
			-- widget_guides = { enabled = true },
			-- outline = { open_cmd = "30vsplit right" },
		})
	end,
}
