return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		lazy = false,
		keys = {
			{ "<ESC>",      mode = { "t" },       [[<C-\><C-n>]] },
			{ "<leader>tt", "<cmd>ToggleTerm<cr>" }
		},
		opts = {
			direction = "float"
		}
	}
}
