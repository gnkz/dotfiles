return {
	"lukas-reineke/indent-blankline.nvim",

	"b3nj5m1n/kommentary",

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {}
	},


	{
		"kylechui/nvim-surround",
		branch = "main",
		config = function()
			require("nvim-surround").setup()
		end
	},

	{
		"folke/trouble.nvim",
		dependencies = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup()
		end,
	},

	{
		"lewis6991/impatient.nvim",
		config = function()
			require("impatient")
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
}
