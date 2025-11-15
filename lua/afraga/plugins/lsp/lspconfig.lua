return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap -- for conciseness

		local opts = { noremap = true, silent = true }
		local on_attach = function(client, bufnr)
			opts.buffer = bufnr

			-- set keybinds
			opts.desc = "Show LSP references"
			keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

			opts.desc = "Go to declaration"
			keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

			opts.desc = "Show LSP definitions"
			keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

			opts.desc = "Show LSP implementations"
			keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

			opts.desc = "Show LSP type definitions"
			keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

			opts.desc = "See available code actions"
			keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

			opts.desc = "Smart rename"
			keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

			opts.desc = "Show buffer diagnostics"
			keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

			opts.desc = "Show line diagnostics"
			keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

			opts.desc = "Show documentation for what is under cursor"
			keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

			opts.desc = "Restart LSP"
			keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
		end

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		-- (not in youtube nvim video)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- configure html server
		vim.lsp.config("html", {
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "html", "templ", "svelte" },
		})
		vim.lsp.enable({ "html" })

		-- configure templ server
		vim.lsp.config("templ", {
			cmd = { "templ" },
			capabilities = capabilities,
			on_attach = on_attach,
		})

		vim.lsp.enable({ "templ" })

		vim.lsp.config("htmx", {
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "html", "templ" },
		})

		vim.lsp.enable({ "htmx" })

		vim.lsp.config("astro", {
			capabilities = capabilities,
			on_attach = on_attach,
		})

		vim.lsp.enable({ "astro" })

		-- configure typescript server with plugin
		vim.lsp.config("ts_ls", {
			capabilities = capabilities,
			on_attach = on_attach,
		})

		vim.lsp.enable({ "ts_ls" })

		-- configure css server
		vim.lsp.config("cssls", {
			capabilities = capabilities,
			on_attach = on_attach,
		})

		vim.lsp.enable({ "cssls" })

		-- configure php server
		vim.lsp.config("intelephense", {
			cmd = { "intelephense", "--stdio" },
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "php", "blade" },
			format = { true },
		})
		vim.lsp.enable({ "intelephense" })

		-- configure tailwindcss server
		vim.lsp.config("tailwindcss", {
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = {
				"aspnetcorerazor",
				"astro",
				"astro-markdown",
				"blade",
				"clojure",
				"django-html",
				"htmldjango",
				"edge",
				"eelixir",
				"elixir",
				"ejs",
				"erb",
				"eruby",
				"gohtml",
				"gohtmltmpl",
				"haml",
				"handlebars",
				"hbs",
				"html",
				"htmlangular",
				"html-eex",
				"heex",
				"jade",
				"leaf",
				"liquid",
				"markdown",
				"mdx",
				"mustache",
				"njk",
				"nunjucks",
				"php",
				"razor",
				"slim",
				"twig",
				"css",
				"less",
				"postcss",
				"sass",
				"scss",
				"stylus",
				"sugarss",
				"javascript",
				"javascriptreact",
				"reason",
				"rescript",
				"typescript",
				"typescriptreact",
				"vue",
				"svelte",
				"templ",
			},
			init_options = { userLanguages = { templ = "html" } },
		})
		vim.lsp.enable({ "tailwindcss" })

		-- configure svelte server
		vim.lsp.config("svelte", {
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				on_attach(client, bufnr)

				vim.api.nvim_create_autocmd("BufWritePost", {
					pattern = { "*.js", "*.ts" },
					callback = function(ctx)
						if client.name == "svelte" then
							client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
						end
					end,
				})
			end,
		})

		vim.lsp.enable({ "svelte" })

		-- configure prisma orm server
		vim.lsp.config("prismals", {
			capabilities = capabilities,
			on_attach = on_attach,
		})
		vim.lsp.enable({ "prismals" })

		vim.lsp.config("jsonls", {
			capabilities = capabilities,
			on_attach = on_attach,
		})
		vim.lsp.enable({ "jsonls" })

		-- configure rust server
		vim.lsp.config("rust_analyzer", {
			capabilities = capabilities,
			on_attach = on_attach,
		})
		vim.lsp.enable({ "rust_analyzer" })

		-- configure Cpp/C  server
		vim.lsp.config("clangd", {
			capabilities = capabilities,
			on_attach = on_attach,
			cmd = { "clangd" },
			filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
			single_file_support = true,
		})
		vim.lsp.enable({ "clangd" })

		-- configure graphql language server
		vim.lsp.config("graphql", {
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
		})
		vim.lsp.enable({ "graphql" })

		vim.lsp.config("gopls", {
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "go", "gomod", "gowork", "gotmpl", "templ" },
		})
		vim.lsp.enable({ "gopls" })

		-- configure emmet language server
		vim.lsp.config("emmet_ls", {
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
		})
		vim.lsp.enable({ "emmet_ls" })

		-- configure python server
		vim.lsp.config("pyright", {
			capabilities = capabilities,
			on_attach = on_attach,
		})
		vim.lsp.enable({ "pyright" })

		-- configure lua server (with special settings)
		vim.lsp.config("lua_ls", {
			capabilities = capabilities,
			on_attach = on_attach,
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})

		vim.lsp.enable({ "lua_ls" })
	end,
}
