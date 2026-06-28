return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup({})

		-- install parsers
		require("nvim-treesitter").install({
			"bash",
			"c",
			"css",
			"dockerfile",
			"gitignore",
			"graphql",
			"html",
			"java",
			"javascript",
			"json",
			"lua",
			"markdown",
			"markdown_inline",
			"query",
			"tsx",
			"typescript",
			"vim",
			"vimdoc",
			"yaml",
		})

		-- enable treesitter highlighting for all supported filetypes
		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				pcall(vim.treesitter.start)
			end,
		})

		-- enable treesitter-based indentation
		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})

	end,
}
