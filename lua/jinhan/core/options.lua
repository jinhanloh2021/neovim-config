vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt -- for conciseness
local fn = vim.fn
local api = vim.api

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
opt.wrap = false -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- appearance

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- use windows clip.exe with yank
if fn.has('wsl') == 1 then
  api.nvim_create_autocmd('TextYankPost', {
  group = api.nvim_create_augroup('Yank', { clear = true }),
  callback = function()
    fn.system('clip.exe', fn.getreg('"'))
    end,
  })
end

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false

-- scroll offset
opt.scrolloff = 10

-- update time for local-highlight plugin. Default is 4000
opt.updatetime = 100

-- cursor: use a blending cursor so the character underneath stays visible
opt.guicursor = "n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor/lCursor,r-cr:hor20,o:hor50"
vim.api.nvim_set_hl(0, "Cursor", { fg = "bg", bg = "fg", blend = 0 })
