return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		-- Import cmp_nvim_lsp for capabilities
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		-- LSP: Configure mason-lspconfig with the new 'handlers' API
		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"bashls",
				"biome",
				"cssls",
				"dockerls",
				"eslint",
				"graphql",
				"html",
				"ltex",
				"lua_ls",
				"pyright",
				"rust_analyzer",
				"solang",
				"tailwindcss",
				"yamlls",
				"gopls",
				"ts_ls",
			},
			automatic_installation = true,
			handlers = {
				-- Default handler for all servers installed by Mason-LSPconfig
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
						-- Add common on_attach functions here if you have them,
						-- or define them in your lspconfig.lua
						-- on_attach = on_attach,
					})
				end,
				["graphql"] = function()
					require("lspconfig")["graphql"].setup({
						capabilities = capabilities,
						filetypes = { "graphql", "gql", "typescriptreact", "javascriptreact" },
					})
				end,
				["lua_ls"] = function()
					require("lspconfig")["lua_ls"].setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim", "require" },
								},
								completion = {
									callSnippet = "Replace",
								},
								workspace = {
									library = vim.api.nvim_get_runtime_file("", true),
									checkThirdParty = false,
								},
								telemetry = {
									enable = false,
								},
							},
						},
					})
				end,
			},
		})

		-- Formatters
		mason_tool_installer.setup({
			ensure_installed = {
				"black", -- python formatter
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
			},
		})
	end,
}
