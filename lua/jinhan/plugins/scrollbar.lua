return {
	"petertriho/nvim-scrollbar",
	branch = "refactor/v2",
	dependencies = { "lewis6991/gitsigns.nvim" },

	config = function()
		local colors = require("onedark.colors")
		require("scrollbar").setup({
			marks = {
				Cursor = {
					text = "■",
					priority = 0,
					highlight = "Normal",
				},
				Search = {
					text = { "─", "=" },
					priority = 1,
					highlight = "Search",
				},
				Error = {
					text = { "─", "=" },
					priority = 2,
					highlight = "DiagnosticVirtualTextError",
				},
				Warn = {
					text = { "─", "=" },
					priority = 3,
					highlight = "DiagnosticVirtualTextWarn",
				},
				Info = {
					text = { "─", "=" },
					priority = 4,
					highlight = "DiagnosticVirtualTextInfo",
				},
				Hint = {
					text = { "─", "=" },
					priority = 5,
					highlight = "DiagnosticVirtualTextHint",
				},
				Misc = {
					text = { "─", "=" },
					priority = 6,
					highlight = "Normal",
				},
				GitAdd = {
					text = { "+" },
					priority = 7,
					highlight = { fg = colors.green },
				},
				GitChange = {
					text = { "~" },
					priority = 6,
					highlight = { fg = colors.blue },
				},
				GitDelete = {
					text = { "-" },
					priority = 7,
					highlight = { fg = colors.red },
				},
			},
			exclude = {
				buftypes = { terminal = true },
				filetypes = {
					cmp_docs = true,
					cmp_menu = true,
					noice = true,
					prompt = true,
					TelescopePrompt = true,
				},
			},
			providers = {
				cursor = true,
				diagnostic = true,
				search = true,
				gitsigns = true,
			},
			scrollbar = {
				max_lines = false,
				throttle_ms = 100,
				thumb = {
					text = " ",
					blend = 90,
					highlight = { bg = colors.grey },
					hide_if_all_visible = true,
				},
			},
		})
	end,
}
