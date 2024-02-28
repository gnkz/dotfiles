return {
	{
		"folke/twilight.nvim",
		config = function()
			require("twilight").setup({})
		end,
	},
	{
		"folke/zen-mode.nvim",
		keys = {
			{ "<leader>z", "<cmd>ZenMode<cr>" },
		},
		opts = {
			plugins = {
				tmux = { enable = true },
			},
			on_open = function()
				vim.cmd("set laststatus=0")
			end,
			on_close = function()
				vim.cmd("set laststatus=3")
			end,
		},
	},
}
