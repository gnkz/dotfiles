return {
	{
		"lewis6991/gitsigns.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		lazy = false,
		keys = {
			{ "<leader>us", mode = { "n", "v" },                          "<cmd>Gitsigns stage_hunk<cr>" },
			{ "<leader>ur", mode = { "n", "v" },                          "<cmd>Gitsigns reset_hunk<cr>" },
			{ "<leader>uS", "<cmd>Gitsigns stage_buffer<cr>" },
			{ "<leader>uu", "<cmd>Gitsigns undo_stage_hunk<cr>" },
			{ "<leader>uR", "<cmd>Gitsigns reset_buffer<cr>" },
			{ "<leader>up", "<cmd>Gitsigns preview_hunk<cr>" },
			{ "<leader>ub", "<cmd>Gitsigns blame_line<cr>" },
			{ "<leader>ud", "<cmd>Gitsigns diffthis<cr>" },
			{ "<leader>ul", "<cmd>Gitsigns setloclist<cr>" },
			{ "<leader>tb", "<cmd>Gitsigns toggle_current_line_blame<cr>" },
			{ "<leader>td", "<cmd>Gitsigns toggle_deleted<cr>" },
			{ "<leader>]c", "<cmd>Gitsigns next_hunk<cr>" },
			{ "<leader>[c", "<cmd>Gitsigns prev_hunk<cr>" },

		},
		config = function()
			require("gitsigns").setup()
		end
	},
}
