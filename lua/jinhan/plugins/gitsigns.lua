return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup({
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "-" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
			-- keymaps = {
			--   -- Define your custom key mappings here
			-- },
			-- watch_index = {
			--   interval = 1000,
			-- },
			current_line_blame = true,
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
				delay = 100,
			},
			current_line_blame_formatter = "<author_time:%d-%b-%y> • <author>",
			update_debounce = 100,
			status_formatter = nil, -- Use default
			max_file_length = 40000,
		})
	end,
}
