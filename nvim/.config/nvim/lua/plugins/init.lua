return {
	"lukas-reineke/indent-blankline.nvim",

	{
		"kylechui/nvim-surround",
		branch = "main",
		config = function()
			require("nvim-surround").setup()
		end,
	},

	{
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({})
		end,
	},
	{
		"linrongbin16/gitlinker.nvim",
		config = function()
			require("gitlinker").setup()
		end,
	},
}
