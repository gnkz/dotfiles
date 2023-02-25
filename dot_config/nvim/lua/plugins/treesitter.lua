return {
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"json",
					"typescript",
					"javascript",
					"nix",
					"lua",
					"fish",
					"solidity",
					"rust",
					"markdown",
					"markdown_inline",
					"vim",
					"regex",
					"bash"
				},
			})
		end
	}
}
