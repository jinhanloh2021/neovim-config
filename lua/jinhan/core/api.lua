local api = vim.api

vim.api.nvim_create_user_command("Claude", function()
	vim.cmd("tabnew")
	vim.cmd("terminal claude")
	vim.cmd("startinsert")
end, { desc = "Open Claude in a new tab terminal" })

-- highlight on yank
api.nvim_create_autocmd("TextYankPost", {
	group = api.nvim_create_augroup("HighlightYank", { clear = true }),
	pattern = "*",
	callback = function()
		vim.hl.on_yank({ higroup = "IncSearch", timeout = 200 })
	end,
})
