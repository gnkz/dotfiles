return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		priority = 99999,
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
					"bash",
					"zig",
					"toml",
					"terraform",
					"go",
					"sql",
					"vimdoc",
				},
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<cr>", -- set to `false` to disable one of the mappings
						node_incremental = "<cr>",
						scope_incremental = "<tab>",
						node_decremental = "<s-tab>",
					},
				},
				indent = {
					enable = true,
				},
			})
		end,
	},
}
