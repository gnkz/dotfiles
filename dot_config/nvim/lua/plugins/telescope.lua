return {
	{
		"nvim-telescope/telescope.nvim",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"rmagatti/session-lens",
				dependencies = { "rmagatti/auto-session" }
			},
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		keys = {
			{ "gr",         "<cmd>Telescope lsp_references<cr>" },
			{ "gi",         "<cmd>Telescope lsp_implementations<CR>" },
			{ "gd",         "<cmd>Telescope lsp_definitions<CR>" },
			{ "gt",         "<cmd>Telescope lsp_type_definitions<CR>" },
			{ "<leader>ds", "<cmd>Telescope diagnostics<CR>" },
			{ "<leader>fb", "<cmd>Telescope git_branches<CR>" },
			{ "<leader>pp", "<cmd>Telescope find_files<CR>" },
			{ "<leader>ps", "<cmd>Telescope live_grep<CR>" },
			{ "<leader>pb", "<cmd>Telescope buffers<CR>" },
			{ "<leader>pg", "<cmd>Telescope git_status<CR>" },
			{ "<leader>sl", "<cmd>Telescope session-lens search_session<CR>" },
			{ "<leader>//", "<cmd>Telescope current_buffer_fuzzy_find<CR>" },
		},
		config = function()
			require("session-lens").setup({
				path_display = { "shorten" },
				previewer = true,
			})

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
			telescope.load_extension("session-lens")
		end
	}
}
