return {
	"echasnovski/mini.nvim",
	version = false,
	lazy = false,
	config = function()
		require("mini.pairs").setup()
		require("mini.comment").setup()
		require("mini.statusline").setup()
	end,
}
