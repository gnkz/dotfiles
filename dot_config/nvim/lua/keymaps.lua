local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Navigation
map("n", "<leader>h", ":wincmd h<CR>", { silent = true })
map("n", "<leader>j", ":wincmd j<CR>", { silent = true })
map("n", "<leader>k", ":wincmd k<CR>", { silent = true })
map("n", "<leader>l", ":wincmd l<CR>", { silent = true })

-- Buffers
map("n", "<C-K>", ":bnext<CR>", { silent = true })
map("n", "<C-J>", ":bprev<CR>", { silent = true })
map("n", "<leader>bd", ":bdelete<CR>", { silent = true })

-- Yank
map("n", "<leader>y", '"+y', { silent = true })
map("v", "<leader>y", '"+y', { silent = true })
map("n", "<leader>Y", 'gg"+yG', { silent = true })
map("v", "<leader>Y", 'gg"+yG', { silent = true })

-- Others
map("n", "<leader>nh", ":noh<CR>", { silent = true })
