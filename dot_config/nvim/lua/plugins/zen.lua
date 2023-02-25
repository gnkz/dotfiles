return {
	{
		"Pocco81/true-zen.nvim",
		lazy = false,
		keys = {
			{ "<leader>az", "<cmd>TZAtaraxis<cr>" },
			{ "<leader>nz", mode = { "n", "v" },  "<cmd>TZNarrow<cr>" },
		},
		config = function()
			require("true-zen").setup({
				integrations = {
					lualine = true
				}
			})
		end
	}
}
