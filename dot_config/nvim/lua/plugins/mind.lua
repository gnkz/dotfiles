return {
	{
		"phaazon/mind.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim"
		},
		branch = "v2.2",
		keys = {
			{ "<leader>mm", "<cmd>MindOpenMain<cr>" },
			{ "<leader>mp", "<cmd>MindOpenProject<cr>" }
		},
		config = function()
			require("mind").setup()
		end
	}
}
