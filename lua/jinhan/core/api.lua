local api = vim.api
-- highlight on yank
api.nvim_create_autocmd("TextYankPost", {
	group = api.nvim_create_augroup("HighlightYank", { clear = true }),
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
	end,
})
