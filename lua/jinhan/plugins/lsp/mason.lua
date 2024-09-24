return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

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

		-- LSP
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
				"sqlls",
				"tailwindcss",
				"yamlls",
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
