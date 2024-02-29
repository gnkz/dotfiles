return {
	{
		"lewis6991/gitsigns.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		lazy = false,
		keys = {
			{ "<leader>gsh", mode = { "n", "v" }, "<cmd>Gitsigns stage_hunk<cr>" },
			{ "<leader>guh", "<cmd>Gitsigns undo_stage_hunk<cr>" },
			{ "<leader>grh", mode = { "n", "v" }, "<cmd>Gitsigns reset_hunk<cr>" },
			{ "<leader>gsb", "<cmd>Gitsigns stage_buffer<cr>" },
			{ "<leader>grb", "<cmd>Gitsigns reset_buffer<cr>" },
			{ "<leader>gph", "<cmd>Gitsigns preview_hunk<cr>" },
			{ "<leader>gbl", "<cmd>Gitsigns blame_line<cr>" },
			{ "<leader>gdt", "<cmd>Gitsigns diffthis<cr>" },
			{ "<leader>g]", "<cmd>Gitsigns next_hunk<cr>" },
			{ "<leader>g[", "<cmd>Gitsigns prev_hunk<cr>" },
			{ "<leader>ul", "<cmd>Gitsigns setloclist<cr>" },
			{ "<leader>tb", "<cmd>Gitsigns toggle_current_line_blame<cr>" },
			{ "<leader>td", "<cmd>Gitsigns toggle_deleted<cr>" },
		},
		config = function()
			require("gitsigns").setup()
		end,
	},
}
