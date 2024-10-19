return {
	"sanathks/workspace.nvim",
	dependencies = { "nvim-telescope/telescope.nvim" },
	config = function()
		local workspace = require("workspace")
		workspace.setup({
			workspaces = {
				{ name = "Vulcan", path = "~/code/github.com/nomoixyz", keymap = { "<leader>wn" } },
				{ name = "Chezmoi", path = "~/.local/share/chezmoi", keymap = { "<leader>wc" } },
			},
		})

		vim.keymap.set("n", "<leader>ws", workspace.tmux_sessions)
	end,
}
