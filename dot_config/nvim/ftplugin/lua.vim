augroup FormatOnSave
	autocmd!
	autocmd BufWritePre <buffer> lua vim.lsp.buf.format()
augroup END

