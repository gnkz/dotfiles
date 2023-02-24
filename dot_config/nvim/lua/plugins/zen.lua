return {
	{
		"Pocco81/true-zen.nvim",
		keys = {
			{ "<leader>zn", "<cmd>TZAtaraxis<cr>" }
		},
		config = function()
			require("true-zen").setup({})
		end
	}
}
