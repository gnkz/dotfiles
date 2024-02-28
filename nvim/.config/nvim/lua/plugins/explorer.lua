return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		require("nvim-tree").setup({
			filters = {
				dotfiles = false,
			},
		})
		vim.keymap.set("n", "<leader>e", ":NvimTreeFindFileToggle<CR>", { silent = true })
	end,
}
