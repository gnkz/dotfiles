local cmd = vim.cmd
local indent = 4

local scopes = { o = vim.o, b = vim.bo, w = vim.wo }
local function opt(scope, key, value)
	scopes[scope][key] = value
	if scope ~= "o" then
		scopes["o"][key] = value
	end
end

vim.g.mapleader = " "

cmd("syntax enable")
cmd("filetype plugin indent on")
cmd("highlight WinSeparator guibg=None")

opt("b", "shiftwidth", indent)
opt("b", "smartindent", true)
opt("b", "swapfile", false)
opt("b", "tabstop", indent)
opt("b", "textwidth", 100)
opt("b", "undofile", true)
opt("o", "hidden", true)
opt("o", "hlsearch", true)
opt("o", "ignorecase", true)
opt("o", "incsearch", true)
opt("o", "ruler", true)
opt("o", "scrolloff", 12)
opt("o", "showbreak", "+++")
opt("o", "showmatch", true)
opt("o", "smartcase", true)
opt("o", "termguicolors", true)
opt("o", "undolevels", 5000)
opt("o", "updatetime", 50)
opt("o", "visualbell", true)
opt("w", "cursorline", true)
opt("w", "linebreak", true)
opt("w", "relativenumber", true)
opt("w", "number", true)
opt("w", "signcolumn", "yes")
opt("o", "laststatus", 3)

cmd("au TextYankPost * lua vim.highlight.on_yank {on_visual = false}")
cmd("autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab")
cmd("autocmd Filetype typescript setlocal ts=4 sw=4 sts=0 expandtab")
cmd("autocmd Filetype json setlocal ts=2 sw=2 sts=0 expandtab")
cmd("autocmd Filetype html setlocal ts=2 sw=2 expandtab")
cmd("autocmd Filetype css setlocal ts=2 sw=2 sts=0 expandtab")
