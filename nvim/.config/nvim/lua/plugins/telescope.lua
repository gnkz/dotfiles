return {
	{
		"nvim-telescope/telescope.nvim",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		keys = {
			{ "<leader>fb", "<cmd>Telescope git_branches<CR>" },
			{ "<leader>pp", "<cmd>Telescope find_files<CR>" },
			{ "<leader>ps", "<cmd>Telescope live_grep<CR>" },
			{ "<leader>pb", "<cmd>Telescope buffers<CR>" },
			{ "<leader>pg", "<cmd>Telescope git_status<CR>" },
			{ "<leader>//", "<cmd>Telescope current_buffer_fuzzy_find<CR>" },
		},
		config = function()
			local telescope = require("telescope")

			telescope.setup({
				defaults = {
					mappings = {
						i = {
							["<C-B>"] = "git_create_branch",
						},
					},
					file_ignore_patterns = { "node_modules" },
				},
				pickers = {
					buffers = {
						ignore_current_buffer = true,
						sort_mru = true,
						sort_lastused = true,
					},
				},
			})
			telescope.load_extension("fzf")
		end
	}
}
