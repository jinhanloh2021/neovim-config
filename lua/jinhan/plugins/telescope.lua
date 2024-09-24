return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "truncate" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
			pickers = {
				lsp_references = {
					show_line = false,
				},
			},
		})
		telescope.load_extension("fzf")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<C-p>", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
	end,
}

-- builtin.lsp_references({opts})            *telescope.builtin.lsp_references()*
--     Lists LSP references for word under the cursor, jumps to reference on
--     `<cr>`
--
--
--     Parameters: ~
--         {opts} (table)  options to pass to the picker
--
--     Options: ~
--         {include_declaration}  (boolean)  include symbol declaration in the
--                                           lsp references (default: true)
--         {include_current_line} (boolean)  include current line (default:
--                                           false)
--         {fname_width}          (number)   defines the width of the filename
--                                           section (default: 30)
--         {show_line}            (boolean)  show results text (default: true)
--         {trim_text}            (boolean)  trim results text (default: false)
--         {file_encoding}        (string)   file encoding for the previewer
