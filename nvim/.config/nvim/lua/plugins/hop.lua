return {
	{
		"phaazon/hop.nvim",
		keys = {
			{
				"f",
				"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
			},
			{
				"F",
				"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
			},
			{
				"t",
				"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<cr>",
			},
			{
				"T",
				"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>",
			},
			{
				"<leader>fw",
				"<cmd>HopWord<cr>",
			},
		},
		config = function()
			require("hop").setup()
		end,
	},
}
